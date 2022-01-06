abstract class FollowerEvent{}

class GetListFollowerEvent extends FollowerEvent{
  String username;

  GetListFollowerEvent(this.username);
}