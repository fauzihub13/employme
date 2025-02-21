import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:employme/data/datasource/auth_remote_datasource.dart';
import 'package:employme/data/models/respone/auth_respon_model.dart';

import '../../../../data/datasource/auth_local_datasource.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final AuthRemoteDatasource _authRemoteDatasource;
  final AuthLocalDatasource _authLocalDatasource;

  LoginBloc({
    required AuthRemoteDatasource authRemoteDatasource,
    required AuthLocalDatasource authLocalDatasource,
  })  : _authRemoteDatasource = authRemoteDatasource,
        _authLocalDatasource = authLocalDatasource,
        super(LoginInitial()) {
    on<LoginSubmitted>(_onLoginSubmitted);
  }

  Future<void> _onLoginSubmitted(
    LoginSubmitted event,
    Emitter<LoginState> emit,
  ) async {
    emit(LoginLoading());

    try {
      final result = await _authRemoteDatasource.login(
        event.email,
        event.password,
      );

      await result.fold(
        (error) async {
          emit(LoginFailure(error));
        },
        (authResponse) async {
          if (authResponse.accessToken != null) {
            await _authLocalDatasource.saveToken(authResponse.accessToken!);
            log("Token1: ${authResponse.accessToken}");
          }

          emit(LoginSuccess(authResponse: authResponse));
          log("Token saved: ${authResponse.accessToken}");
        },
      );
    } catch (e) {
      emit(LoginFailure(e.toString()));
    }
  }
}
