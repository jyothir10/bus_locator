import 'package:bus_locator/Authentication/bloc/auth_event.dart';
import 'package:bus_locator/Authentication/bloc/auth_state.dart';
import 'package:bus_locator/Authentication/login_services/auth_service.dart';
import 'package:bus_locator/Authentication/login_services/firebase_login.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'dart:async';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthService _auth;
  AuthState _isLoggedIn = NotLoggedIn();
  @override
  // TODO: implement initialState
  AuthState get initialState => AuthInitial();

  @override
  Stream<AuthState> mapEventToState(AuthEvent event) async* {
    AuthState state;
    yield AuthLoading();
    if (event is InjectService) {
      yield _mapInjectService(event);
    } else if (event is Login) {
      state = await _mapLogin(event);
      yield state;
    } else if (event is Logout) {
      state = await _mapLogout(event);
      yield state;
    } else if (event is CreateAccount) {
      state = await _mapCreateAccount(event);
      yield state;
    } else if (event is IsLoggedIn) {
      yield _isLoggedIn;
    }
  }

  AuthState _mapInjectService(InjectService injectService) {
    _auth = injectService.authClass;
    return InjectSuccess();
  }

  Future<AuthState> _mapLogin(Login login) async {
    bool result;
    if (_auth is FirebaseAuthHandler) {
      final String email = login.email;
      final String password = login.password;
      result = await _auth.login(email, password);
    } else {
      result = await _auth.login();
    }
    _isLoggedIn = result ? LoggedIn() : NotLoggedIn();
    return result
        ? LoginSuccess(message: "Welcome")
        : LoginFailure(message: "There was an error loging in");
  }

  Future<AuthState> _mapLogout(Logout logout) async {
    final bool result = await _auth.logout();
    return result
        ? LogoutSuccess(message: "Successfully logged out.")
        : LogoutFailure(message: "There was an error logging out.");
  }

  Future<AuthState> _mapCreateAccount(CreateAccount createAccount) async {
    if (!_validatePasswordLength(createAccount.password)) {
      return CreateAccountFailure(message:"Password must be 8 characters long.");
    } else if (!_passwordsMatch(
        createAccount.password, createAccount.confirmPassword)) {
      return CreateAccountFailure(message:"Passwords must match.");
    } else {
      final bool result = await _auth.createAccount(
          createAccount.email, createAccount.password);
      return result
          ? CreateAccountSuccess(
              message:"Your account has been created successfully. Please login to continue.")
          : CreateAccountFailure(
              message:"There has been an error while creating your account.");
    }
  }

  bool _validatePasswordLength(String p1) {
    return p1.length >= 8;
  }

  bool _passwordsMatch(String p1, String p2) {
    return p1 == p2;
  }
}
