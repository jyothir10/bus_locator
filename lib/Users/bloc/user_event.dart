part of 'user_bloc.dart';

abstract class UserEvent extends Equatable {
  const UserEvent();
  @override
  // TODO: implement props
  List<Object> get props => null;
}

class UserProfile extends UserEvent {
  @override
  String toString() {
    // TODO: implement toString
    return "User Profile";
  }
}
