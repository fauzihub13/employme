part of 'logout_bloc.dart';

@immutable
sealed class LogoutEvent {}

class LogoutRequested extends LogoutEvent {}
