import 'package:bus_locator/Authentication/bloc/auth_event.dart';
import 'package:equatable/equatable.dart';

class AuthState extends Equatable {
  const AuthState({this.message});
  @override
  List<Object> get props => [];
  final String message;
}

class InjectSuccess extends AuthState{}

class AuthInitial extends AuthState {}

class LoginSuccess extends AuthState {
  final String message;
  LoginSuccess({this.message});
}

class LoginFailure extends AuthState {
  final String message;
  LoginFailure({this.message});
}

class LogoutSuccess extends AuthState {
  final String message;
  LogoutSuccess({this.message});
}

class LogoutFailure extends AuthState {
  final String message;
  LogoutFailure({this.message});
}

class AuthLoading extends AuthState {}

class CreateAccountSuccess extends AuthState {
  final String message;
  CreateAccountSuccess({this.message});
}

class CreateAccountFailure extends AuthState {
  final String message;
  CreateAccountFailure({this.message});
}

// Use inside app
class LoggedIn extends AuthState {}
class NotLoggedIn extends AuthState {}
