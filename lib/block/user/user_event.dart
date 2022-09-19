part of 'user_bloc.dart';

@immutable
abstract class UserEvent {}

class ActivateUserEvent extends UserEvent {
  final User user;
  ActivateUserEvent(this.user);
}

class ChangeUserAgeEvent extends UserEvent {
  final int age;
  ChangeUserAgeEvent(this.age);
}

class AddUserProfessionEvent extends UserEvent {
  final String profession;
  AddUserProfessionEvent(this.profession);
}

class DeleteUserEvent extends UserEvent {}
