import 'package:bus_locator/Authentication/bloc/auth_state.dart';
import 'package:equatable/equatable.dart';
import 'package:bus_locator/Authentication/login_services/auth_service1.dart';


abstract class AuthEvent extends Equatable{
  const AuthEvent();
  @override 
  List<Object> get props => [];
  @override
  String toString();
}

class StartUp extends AuthEvent {
  @override
  String toString() {
  return "StartUp";
   }
}
// Mapped
class InjectService extends AuthEvent {
  final AuthService _auth;
  InjectService(this._auth);
  AuthService get authClass => this._auth;
}
// Mapped
class Login extends AuthEvent {
  final AuthService service;
  final String email;
  final String password;
  Login(this.service,{this.email, this.password});
  @override
  String toString() {
  return "Login";
   }
}
// Mapped
class Logout extends AuthEvent {
  @override
  String toString() {
  return "Logout";
   }
}
// Mapped
class CreateAccount extends AuthEvent {
  final String email;
  final String password;
  final String confirmPassword;
  CreateAccount({this.email, this.password, this.confirmPassword});
  @override
  String toString() {
  return "CreateAccount";
   }
}
// Mapped
class IsLoggedIn extends AuthEvent {
  @override
  String toString() {
  return "IsLoggedIn";
   }
}

class RequestChangePassword extends AuthEvent{
  @override
  String toString() {
  return "RequestChangePassword";
   }
}

class ChangePassword extends AuthEvent{
  final String currentPassword;
  final String newPassword;
  final String confirmNewPassword;
  ChangePassword(this.currentPassword, this.newPassword, this.confirmNewPassword);
  @override
  String toString() {
  return "ChangePassword";
   }
}
