part of 'authentication_bloc.dart';

@immutable
sealed class AuthenticationState {}

final class AuthenticationInitial extends AuthenticationState {}

final class Authenticating extends AuthenticationState {
  final String msg;
  Authenticating({required this.msg});

  List<Object> get props => [msg];
}

final class Authenticated extends AuthenticationState{
    final String msg;
  Authenticated({required this.msg});

  List<Object> get props => [msg];
}

final class AuthenticationFailed extends AuthenticationState{
    final String msg;
  AuthenticationFailed({required this.msg});

  List<Object> get props => [msg];
}
