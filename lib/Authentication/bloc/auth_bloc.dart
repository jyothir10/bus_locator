import 'package:bus_locator/Authentication/bloc/auth_errors.dart';
import 'package:bus_locator/Authentication/bloc/auth_event.dart';
import 'package:bus_locator/Authentication/bloc/auth_state.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'dart:async';
import 'package:bus_locator/Authentication/login_services/auth_service1.dart';
import 'package:bus_locator/logger/logger.dart';
import 'package:flutter/services.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  Auth _auth = Auth();

  @override
  // TODO: implement initialState
  AuthState get initialState => AuthInitial();

  @override
  void onEvent(AuthEvent event) {
    super.onEvent(event);
    log("AUTHEVENT", event.toString());
  }

  @override
  void onTransition(Transition transition) {
    super.onTransition(transition);
    log("AUTHSTATE", transition.toString());
  }

  @override
  Stream<AuthState> mapEventToState(AuthEvent event) async* {
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
    } else if (event is ForgotPassword) {
      yield* _mapForgotPassword(event);
    } else if (event is UserProfile) {
      yield* _mapUserProfile(event);
    }
  }

  Stream<AuthState> _mapLogin(Login login) async* {
    try {
      FirebaseUser user = await _auth.login(login.service,
          email: login.email, password: login.password);
      if (user != null) {
        log("TESTING", user.providerData.toString());
        yield LoginSuccess(message: LOGIN_SUCCESS_MESSAGE);
      } else {
        yield LoginFailure(message: LOGIN_ERROR_MESSAGE);
      }
    } on PlatformException catch (error) {
      final String message = loginPlatformExceptionHandler(error.code);
      yield LoginFailure(message: message);
    } catch (error) {
      yield LoginFailure(
          message: error.message != null ? error.message : LOGIN_ERROR_MESSAGE);
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
    // TODO (farih) Refactor this
    if (!_validateEmail(createAccount.email)) {
      yield CreateAccountFailure(message: INVALID_EMAIL_MESSAGE);
    } else if (!_validatePasswordLength(createAccount.password)) {
      yield CreateAccountFailure(message: PASSWORDS_LENGTH_MESSAGE);
    } else if (!_passwordsMatch(
        createAccount.password, createAccount.confirmPassword)) {
      yield CreateAccountFailure(message: PASSWORDS_DO_NOT_MATCH_MESSAGE);
    } else {
      try {
        final user = await _auth.createAccount(
            createAccount.email, createAccount.password);
        yield user != null
            ? CreateAccountSuccess(message: CREATE_ACCOUNT_SUCCESS_MESSAGE)
            : CreateAccountFailure(message: CREATE_ACCOUNT_SUCCESS_MESSAGE);
      } on PlatformException catch (error) {
        String message = createAccountPlatformExceptionHandler(error.code);
        yield CreateAccountFailure(message: message);
      } catch (error) {
        yield CreateAccountFailure(
            message: error.message != null
                ? error.message
                : CREATE_ACCOUNT_ERROR_MESSAGE);
      }
    }
  }

  Stream<AuthState> _mapStartUp() async* {
    final bool isLoggedIn = await _auth.isLoggedIn();
    yield isLoggedIn ? StartUpAuthorised() : StartUpUnauthorised();
  }

  Stream<AuthState> _mapChangePassword(ChangePassword changePassword) async* {
    // TODO (farih) Refactor this portion.
    try {
      FirebaseUser user = await _auth.getCurrentUser();
      user = await user.reauthenticateWithCredential(
          EmailAuthProvider.getCredential(
              email: user.email, password: changePassword.currentPassword));
      if (!_validatePasswordLength(changePassword.newPassword)) {
        yield ChangePasswordFailure(message: PASSWORDS_LENGTH_MESSAGE);
      } else if (!_passwordsMatch(
          changePassword.newPassword, changePassword.confirmNewPassword)) {
        yield ChangePasswordFailure(message: PASSWORDS_DO_NOT_MATCH_MESSAGE);
      } else {
        await user.updatePassword(changePassword.newPassword);
        yield ChangePasswordSuccess(message: CHANGE_PASSWORD_SUCCESS_MESSAGE);
      }
    } on PlatformException catch (error) {
      String message = changePasswordPlatformExceptionHandler(error.code);
      yield ChangePasswordFailure(message: message);
    } catch (error) {
      yield ChangePasswordFailure(
          message: error.message != null
              ? error.message
              : CHANGE_PASSWORD_ERROR_MESSAGE);
    }
  }

  Stream<AuthState> _mapRequestChangePassword(
      RequestChangePassword requestChangePassword) async* {
    // if ( != AuthService.EMAILANDPASSWORD) {
    //   return CannotChangePassword(message: "Sorry. You cannot change your password");
    // } else {
    yield CanChangePassword();
  }

  Stream<AuthState> _mapForgotPassword(ForgotPassword forgotPassword) async* {
    try {
      await _auth.sendPasswordResetEmail(forgotPassword.email);
      yield ForgotPasswordSuccess(message: FORGOT_PASSWORD_SUCCESS_MESSAGE);
    } on PlatformException catch (error) {
      String message = forgotPasswordPlatformExceptionHandler(error.code);
      yield ForgotPasswordFailure(message: message);
    } catch (error) {
      yield ForgotPasswordFailure(
          message: (error.message != null)
              ? error.message
              : FORGOT_PASSWORD_ERROR_MESSAGE);
    }
  }

  Stream<AuthState> _mapUserProfile(UserProfile userProfile) async*{
    try {
      Map userInfo = await _auth.getUserProfile();
      yield UserProfileSuccess(userInfo);
    } catch(error) {
      yield UserProfileFailure(message:USER_PROFILE_FAILURE_MESSAGE);
    }
  }

  bool _validatePasswordLength(String p1) {
    return p1.length >= 8;
  }

  bool _passwordsMatch(String p1, String p2) {
    return p1 == p2;
  }

  bool _validateEmail(String email) {
    // TODO (farih) Add regex validation
    return email != "";
  }
}
