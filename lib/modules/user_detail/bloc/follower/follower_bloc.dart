import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:github_bloc/modules/user_detail/bloc/follower/follower_event.dart';
import 'package:github_bloc/modules/user_detail/bloc/follower/follower_state.dart';
import 'package:github_bloc/modules/user_detail/repository/user_repository.dart';

class FollowerBloc extends Bloc<FollowerEvent, FollowerState> {
  late UserRepository _repo;
  late String username;

  FollowerBloc() : super(InitFollowerState()) {
    _repo = UserRepository.instance;

    on<GetListFollowerEvent>(
      (event, emit) async {
        emit(ShowLoadingFollowerState());
        try {
          var data = await _repo.getFollowerList("bintangputera");
          emit(ShowListFollowerState(data));
        } catch (ex) {
          emit(ShowErrorFollowerListState("$ex"));
        }
      },
    );
  }
}
