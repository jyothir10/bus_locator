import 'package:bus_locator/Authentication/bloc/auth_event.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:bus_locator/Authentication/bloc/auth_bloc.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  AuthBloc authBloc;
  setUp(() {
    authBloc = AuthBloc();
  });
  tearDown(() {
    authBloc?.close();
  });

  test("Checking initial state", () {
    expect(authBloc.initialState, AuthInitial());
  });

  test("Checking startUp, ", () {
    authBloc.add(StartUp());
    expectLater(authBloc, emitsInOrder([AuthInitial(), AuthLoading()]));
  });


}
