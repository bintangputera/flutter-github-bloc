abstract class UserEvent {}

class GetDetailUserEvent extends UserEvent{
  final String username;

  GetDetailUserEvent(this.username);
}
