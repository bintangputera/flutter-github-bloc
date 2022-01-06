import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:github_bloc/modules/user_detail/bloc/follower/follower_bloc.dart';
import 'package:github_bloc/modules/user_detail/bloc/follower/follower_event.dart';
import 'package:github_bloc/modules/user_detail/bloc/user/user_bloc.dart';
import 'package:github_bloc/modules/user_detail/bloc/user/user_event.dart';
import 'package:github_bloc/modules/user_detail/widgets/widget_user_detail.dart';

class UserDetailScreen extends StatefulWidget {
  UserDetailScreen(this.username);

  String username;

  // route name for navigator
  static const String routeName = "/userDetailRoute";

  @override
  _UserDetailScreenState createState() => _UserDetailScreenState();
}

class _UserDetailScreenState extends State<UserDetailScreen> {

  // bloc declare
  late UserBloc _userBloc;
  // late FollowerBloc _followerBloc;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    // Bloc initialization
    _userBloc = UserBloc();
    // _followerBloc = FollowerBloc();

    // Bloc event adding
    _userBloc.add(GetDetailUserEvent(widget.username));
    // _followerBloc.add(GetListFollowerEvent(widget.username));
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _userBloc.close();
    print('blocs disposed');
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: const Text('Profile Detail'),
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: SafeArea(
        // multi bloc provider for provide multi bloc
        child: MultiBlocProvider(
          providers: [
            BlocProvider<UserBloc>(create: (context) => _userBloc),
            // BlocProvider<FollowerBloc>(create: (context) => _followerBloc,)
          ],
          child: Column(
            children: [
              // Detail user
              WidgetUserDetail(context: context,),
              // Follower list
              // WidgetFollowerList()
            ],
          ),
        ),
      ),
    );
  }
}
