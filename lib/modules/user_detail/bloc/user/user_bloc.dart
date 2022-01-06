import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:github_bloc/modules/user_detail/bloc/user/user_event.dart';
import 'package:github_bloc/modules/user_detail/bloc/user/user_state.dart';
import 'package:github_bloc/modules/user_detail/repository/user_repository.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  late UserRepository _repo;
  late String username;

  UserBloc() : super(InitUserState()) {
    _repo = UserRepository.instance;

    on<GetDetailUserEvent>(
      (event, emit) async {
        emit(ShowLoadingDetailUserState());
        try {
          var map = await _repo.getProfileDetail(event.username);
          emit(ShowUserDetailState(map));
        } catch (ex) {
          emit(ShowErrorDetailState("$ex"));
        }
      },
    );
  }
}
