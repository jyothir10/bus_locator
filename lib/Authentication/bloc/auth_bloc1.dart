import 'package:bus_locator/Authentication/bloc/auth_event.dart';
import 'package:bus_locator/Authentication/bloc/auth_state.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'dart:async';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:bus_locator/Authentication/login_services/auth_service1.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  Auth _auth = Auth();

  @override
  // TODO: implement initialState
  AuthState get initialState => AuthInitial();

  @override
  Stream<AuthState> mapEventToState(AuthEvent event) async* {
    AuthState state;
    yield AuthLoading();
    // if (event is InjectService) {
    //   state = _mapInjectService(event);
    if (event is Login) {
      state = await _mapLogin(event);
    } else if (event is Logout) {
      state = await _mapLogout(event);
    } else if (event is CreateAccount) {
      state = await _mapCreateAccount(event);
    } else if (event is ChangePassword) {
      state = await _mapChangePassword(event);
    } else if (event is StartUp) {
      state = await _mapStartUp();
    } else if (event is RequestChangePassword) {
      state = _mapRequestChangePassword(event);
    }
    yield state;
  }

  Future<AuthState> _mapLogin(Login login) async {
    try {
      FirebaseUser user = await _auth.login(login.service,
          email: login.email, password: login.password);

      if (user != null) {
        print(user.providerId);
        return LoginSuccess(message: "Welcome");
      } else {
        return LoginFailure(message: "Error while logging in.");
      }
    } catch (error) {
      return LoginFailure(message: error.message);
    }
  }

  Future<AuthState> _mapLogout(Logout logout) async {
    try {
      await _auth.logout();
      return LogoutSuccess();
    } catch (error) {
      return LoginFailure(message: error.message);
    }
  }

  Future<AuthState> _mapCreateAccount(CreateAccount createAccount) async {
    if (!_validatePasswordLength(createAccount.password)) {
      return CreateAccountFailure(
          message: "Password must be 8 characters long.");
    } else if (!_passwordsMatch(
        createAccount.password, createAccount.confirmPassword)) {
      return CreateAccountFailure(message: "Passwords must match.");
    } else {
      try {
        final user = await _auth.createAccount(
            createAccount.email, createAccount.password);
        return user != null
            ? CreateAccountSuccess(
                message:
                    "Your account has been created successfully. Please login to continue.")
            : CreateAccountFailure(
                message:
                    "There has been an error while creating your account.");
      } catch (err) {
        return CreateAccountFailure(message: err.message);
      }
    }
  }

  Future<AuthState> _mapStartUp() async {
    final bool isLoggedIn = await _auth.isLoggedIn();
    return isLoggedIn ? StartUpAuthorised() : StartUpUnauthorised();
  }

  Future<AuthState> _mapChangePassword(ChangePassword changePassword) async {
    try {
      FirebaseUser user = await _auth.currentUser();
      user = await user.reauthenticateWithCredential(
          EmailAuthProvider.getCredential(
              email: user.email, password: changePassword.currentPassword));
      if (_passwordsMatch(
          changePassword.newPassword, changePassword.confirmNewPassword)) {
        await user.updatePassword(changePassword.newPassword);
        return ChangePasswordSuccess(
            message: "You have successfully changed your password.");
      } else {
        return ChangePasswordFailure(
            message: "The new passwords do not match.");
      }
    } catch (error) {
      return ChangePasswordFailure(message: error.message);
    }
  }

  AuthState _mapRequestChangePassword(
      RequestChangePassword requestChangePassword) {
    // if ( != AuthService.EMAILANDPASSWORD) {
    //   return CannotChangePassword(message: "Sorry. You cannot change your password");
    // } else {
    return CanChangePassword();
  }

  void saveAuthService(String service) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString("service", service);
  }

  void deleteAuthService() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.remove("service");
  }

  bool _validatePasswordLength(String p1) {
    return p1.length >= 8;
  }

  bool _passwordsMatch(String p1, String p2) {
    return p1 == p2;
  }
}
