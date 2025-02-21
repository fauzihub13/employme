import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:employme/data/datasource/auth_local_datasource.dart';

part 'logout_event.dart';
part 'logout_state.dart';

class LogoutBloc extends Bloc<LogoutEvent, LogoutState> {
  final AuthLocalDatasource _authLocalDatasource;

  LogoutBloc({required AuthLocalDatasource authLocalDatasource})
      : _authLocalDatasource = authLocalDatasource,
        super(LogoutInitial()) {
    on<LogoutRequested>((event, emit) async {
      emit(LogoutLoading());

      try {
        await _authLocalDatasource.deleteToken();
        emit(LogoutSuccess());
      } catch (e) {
        emit(LogoutFailure(e.toString()));
      }
    });
  }
}
