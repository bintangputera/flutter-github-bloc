import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:github_bloc/modules/user_detail/bloc/follower/follower_bloc.dart';
import 'package:github_bloc/modules/user_detail/bloc/follower/follower_state.dart';
import 'package:github_bloc/widgets/components/loading_widget.dart';

class WidgetFollowerList extends StatelessWidget {
  const WidgetFollowerList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container();
    /* return Expanded(child: BlocBuilder<FollowerBloc, FollowerState>(
      builder: (context, state) {
        if (state is ShowLoadingFollowerState) {
          return LoadingWidget();
        }
        if (state is ShowErrorFollowerListState) {
          return Text(state.message);
        }
        if (state is ShowListFollowerState) {
          print(state);
        }
        return Container();
      },
    )); */
  }
}
