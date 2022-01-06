import 'package:github_bloc/modules/home/model/user_model.dart';

abstract class UserState {}

class InitUserState extends UserState{}

class ShowLoadingDetailUserState extends UserState{}

class ShowUserDetailState extends UserState {
  UserModel userModel;

  ShowUserDetailState(this.userModel);
}

class ShowErrorDetailState extends UserState {
  String message;

  ShowErrorDetailState(this.message);
}