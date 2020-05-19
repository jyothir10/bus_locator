import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:bus_locator/Users/services/user_services.dart';

part 'user_event.dart';
part 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  final UserService _userService = UserService();
  @override
  UserState get initialState => UserInitial();

  @override
  Stream<UserState> mapEventToState(
    UserEvent event,
  ) async* {
    yield UserLoading();
    if (event is UserProfile) {
      yield* _mapUserProfile(event);
    }
  }

  Stream<UserState> _mapUserProfile(UserProfile userProfile) async* {
    try {
      Map userInfo = await _userService.getUserProfile();
      yield UserProfileSuccess(userInfo);
    } catch (error) {
      yield UserProfileFailure("There was an error loading your profile.");
    }
  }
}
