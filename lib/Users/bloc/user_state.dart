part of 'user_bloc.dart';

abstract class UserState extends Equatable {
  const UserState();
  @override
  List<Object> get props => [];
}

class UserInitial extends UserState {}

class UserLoading extends UserState {}

class UserProfileSuccess extends UserState {
  final String message;
  final Map userInfo;
  UserProfileSuccess(this.userInfo, {this.message});
}

class UserProfileFailure extends UserState {
  final String message;
  UserProfileFailure(this.message);
}
