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
      yield* _mapLogin(event);
    } else if (event is Logout) {
      yield* _mapLogout(event);
    } else if (event is CreateAccount) {
      yield* _mapCreateAccount(event);
    } else if (event is ChangePassword) {
      yield* _mapChangePassword(event);
    } else if (event is StartUp) {
      yield* _mapStartUp();
    } else if (event is RequestChangePassword) {
      yield* _mapRequestChangePassword(event);
    }
  }

  Stream<AuthState> _mapLogin(Login login) async* {
    try {
      FirebaseUser user = await _auth.login(login.service,
          email: login.email, password: login.password);

      if (user != null) {
        print(user.providerId);
        yield LoginSuccess(message: "Welcome");
      } else {
        yield LoginFailure(message: "Error while logging in.");
      }
    } catch (error) {
      yield LoginFailure(message: error.message);
    }
  }

  Stream<AuthState> _mapLogout(Logout logout) async* {
    try {
      await _auth.logout();
      yield LogoutSuccess();
    } catch (error) {
      yield LoginFailure(message: error.message);
    }
  }

  Stream<AuthState> _mapCreateAccount(CreateAccount createAccount) async* {
    if (!_validatePasswordLength(createAccount.password)) {
      yield CreateAccountFailure(
          message: "Password must be 8 characters long.");
    } else if (!_passwordsMatch(
        createAccount.password, createAccount.confirmPassword)) {
      yield CreateAccountFailure(message: "Passwords must match.");
    } else {
      try {
        final user = await _auth.createAccount(
            createAccount.email, createAccount.password);
        yield user != null
            ? CreateAccountSuccess(
                message:
                    "Your account has been created successfully. Please login to continue.")
            : CreateAccountFailure(
                message:
                    "There has been an error while creating your account.");
      } catch (err) {
        yield CreateAccountFailure(message: err.message);
      }
    }
  }

  Stream<AuthState> _mapStartUp() async* {
    final bool isLoggedIn = await _auth.isLoggedIn();
    yield isLoggedIn ? StartUpAuthorised() : StartUpUnauthorised();
  }

  Stream<AuthState> _mapChangePassword(ChangePassword changePassword) async* {
    try {
      FirebaseUser user = await _auth.currentUser();
      user = await user.reauthenticateWithCredential(
          EmailAuthProvider.getCredential(
              email: user.email, password: changePassword.currentPassword));
      if (_passwordsMatch(
          changePassword.newPassword, changePassword.confirmNewPassword)) {
        await user.updatePassword(changePassword.newPassword);
        yield ChangePasswordSuccess(
            message: "You have successfully changed your password.");
      } else {
        yield ChangePasswordFailure(
            message: "The new passwords do not match.");
      }
    } catch (error) {
      yield ChangePasswordFailure(message: error.message);
    }
  }

  Stream<AuthState> _mapRequestChangePassword (
      RequestChangePassword requestChangePassword) async*{
    // if ( != AuthService.EMAILANDPASSWORD) {
    //   return CannotChangePassword(message: "Sorry. You cannot change your password");
    // } else {
    yield CanChangePassword();
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
