import 'package:github_bloc/modules/home/model/follower_model.dart';

abstract class FollowerState{}

class InitFollowerState extends FollowerState{}

class ShowLoadingFollowerState extends FollowerState{}

class ShowListFollowerState extends FollowerState{
  List<FollowerModel> list;

  ShowListFollowerState(this.list);
}

class ShowErrorFollowerListState extends FollowerState{
  String message;

  ShowErrorFollowerListState(this.message);
}
