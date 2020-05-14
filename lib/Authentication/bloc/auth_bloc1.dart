import 'package:bus_locator/Authentication/bloc/auth_event.dart';
import 'package:bus_locator/Authentication/bloc/auth_state.dart';
import 'package:bus_locator/Authentication/login_services/auth_service.dart';
import 'package:bus_locator/Authentication/login_services/facebook_login.dart';
import 'package:bus_locator/Authentication/login_services/firebase_login.dart';
import 'package:bus_locator/Authentication/login_services/google_login.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'dart:async';
import 'package:shared_preferences/shared_preferences.dart';

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
    } else if (event is StartUp) {
      state = await _mapStartUp();
      yield state;
    }
  }

  AuthState _mapInjectService(InjectService injectService) {
    _auth = injectService.authClass;
    return InjectSuccess();
  }

  Future<AuthState> _mapLogin(Login login) async {
    bool result;
    final String email = login.email;
    final String password = login.password;
    result = await _auth.login(email, password);
    print(result);
    if (result) {
      saveAuthService(_auth.toString());
    }
    _isLoggedIn = result ? LoggedIn() : NotLoggedIn();
    return result
        ? LoginSuccess(message: "Welcome")
        : LoginFailure(message: "There was an error loging in");
  }

  Future<AuthState> _mapLogout(Logout logout) async {
    final bool result = await _auth.logout();
    _isLoggedIn = !result ? LoggedIn() : NotLoggedIn();
    if (result) {
      deleteAuthService();
    }
    return result
        ? LogoutSuccess(message: "Successfully logged out.")
        : LogoutFailure(message: "There was an error logging out.");
  }

  Future<AuthState> _mapCreateAccount(CreateAccount createAccount) async {
    if (!_validatePasswordLength(createAccount.password)) {
      return CreateAccountFailure(
          message: "Password must be 8 characters long.");
    } else if (!_passwordsMatch(
        createAccount.password, createAccount.confirmPassword)) {
      return CreateAccountFailure(message: "Passwords must match.");
    } else {
      final bool result = await _auth.createAccount(
          createAccount.email, createAccount.password);
      return result
          ? CreateAccountSuccess(
              message:
                  "Your account has been created successfully. Please login to continue.")
          : CreateAccountFailure(
              message: "There has been an error while creating your account.");
    }
  }

  Future<AuthState> _mapStartUp() async {
    final prefs = await SharedPreferences.getInstance();
    String service = prefs.getString("service");
    bool result;
    AuthState state;
    if (service == "facebook") {
      _auth = FacebookAuthHandler(["email"]);
    } else if (service == "google") {
      _auth = GoogleAuthHandler();
    } else if (service == "firebase") {
      _auth = FirebaseAuthHandler();
    }
    print(_auth);
    result = await _auth?.isLoggedIn() ?? false;
    state = result ? StartUpAuthorised() : StartUpUnauthorised();
    print(state);
    _isLoggedIn = result ? LoggedIn() : NotLoggedIn();
    return state;
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
