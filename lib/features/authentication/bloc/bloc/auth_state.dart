part of 'auth_bloc.dart';

@immutable
sealed class AuthState {}

final class AuthInitial extends AuthState {}

final class AuthLoadingState extends AuthState {}

// final TextClick
final class AuthLoadedState extends AuthState {
  final String msg;
  AuthLoadedState({required this.msg});
}

final class AuthErrorState extends AuthState {
  final String errorMsg;
  AuthErrorState({required this.errorMsg});
}
