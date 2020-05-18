import 'package:equatable/equatable.dart';
import 'package:bus_locator/Authentication/bloc/auth_event.dart';
import 'package:bus_locator/Authentication/login_services/auth_service1.dart';

class AuthState extends Equatable {
  const AuthState({this.message});
  @override
  List<Object> get props => [];
  final String message;
}

class InjectSuccess extends AuthState {}

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

class StartUpAuthorised extends AuthState {}

class StartUpUnauthorised extends AuthState {}

class ChangePasswordFailure extends AuthState {
  final String message;
  ChangePasswordFailure({this.message});
}

class ChangePasswordSuccess extends AuthState {
  final String message;
  ChangePasswordSuccess({this.message});
}

class ReauthenticateStart extends AuthState {
  final AuthService service;
  final AuthEvent lastEvent;
  final String message;
  ReauthenticateStart({this.service, this.lastEvent, this.message});
}

class CanChangePassword extends AuthState{}
class CannotChangePassword extends AuthState{
  final String message;
  CannotChangePassword({this.message});
}

class ForgotPasswordSuccess extends AuthState{
  final String message;
  ForgotPasswordSuccess({this.message});
}
class ForgotPasswordFailure extends AuthState{
  final String message;
  ForgotPasswordFailure({this.message});
}
