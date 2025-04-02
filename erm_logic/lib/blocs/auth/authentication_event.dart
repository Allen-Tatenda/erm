part of 'authentication_bloc.dart';

@immutable
sealed class AuthenticationEvent {}

final class LoadAuthenticationEvent extends AuthenticationEvent{}

final class AuthenticateEvent extends AuthenticationEvent{
final String username;
final String password;
AuthenticateEvent({required this.username, required this.password});

List<Object> get props => [username,password];
}