import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:github_bloc/config/themes.dart';
import 'package:github_bloc/modules/home/model/user_model.dart';
import 'package:github_bloc/modules/user_detail/bloc/user/user_bloc.dart';
import 'package:github_bloc/modules/user_detail/bloc/user/user_state.dart';
import 'package:github_bloc/modules/webview/web_view_screen.dart';
import 'package:github_bloc/utils/others/shimmer_loading.dart';
import 'package:github_bloc/widgets/components/loading_widget.dart';

class WidgetUserDetail extends StatelessWidget {
  const WidgetUserDetail({
    required this.context,
    Key? key,
  }) : super(key: key);

  final BuildContext context;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: BlocBuilder<UserBloc, UserState>(
        builder: (context, state) {
          if (state is ShowLoadingDetailUserState) {
            return ShimmerLoading(child: _lazyLoading());
          }
          if (state is ShowErrorDetailState) {
            return Center(child: Text("User not found", style: AppTheme.subtitle2,));
          }
          if (state is ShowUserDetailState) {
            print("Name : ${state.userModel.name}");
            return _detailSection(state.userModel);
          }
          return Container();
        },
      ),
    );
  }

  Widget _detailSection(UserModel userModel) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 24),
            Row(
              children: [
                CircleAvatar(
                  radius: 40.0,
                  backgroundImage: NetworkImage(userModel.avatarUrl),
                ),
                SizedBox(width: 20),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(userModel.name ?? "-", style: AppTheme.subtitle1),
                    Text(
                      userModel.login ?? "-",
                      style: AppTheme.subtitle2,
                    ),
                  ],
                )
              ],
            ),
            SizedBox(height: 24),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
              width: double.infinity,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4),
                  color: Colors.white12),
              child: Text(
                userModel.bio,
                style: AppTheme.subtitle2,
              ),
            ),
            SizedBox(
              height: 16,
            ),
            Row(
              children: [
                RichText(
                  text: TextSpan(
                    children: [
                      WidgetSpan(
                        alignment: PlaceholderAlignment.middle,
                        child: Container(
                          padding: EdgeInsets.only(right: 8),
                          child: Icon(
                            Icons.location_city_outlined,
                            size: 20,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      TextSpan(
                        text: userModel.company ?? "-",
                        style: AppTheme.subtitle2,
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  width: 16,
                ),
                RichText(
                  text: TextSpan(
                    children: [
                      WidgetSpan(
                        alignment: PlaceholderAlignment.middle,
                        child: Container(
                          padding: EdgeInsets.only(right: 8),
                          child: Icon(
                            Icons.location_on_outlined,
                            size: 20,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      TextSpan(
                        text: userModel.location ?? "-",
                        style: AppTheme.subtitle2,
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: 8),
            RichText(
              text: TextSpan(
                children: [
                  WidgetSpan(
                    alignment: PlaceholderAlignment.middle,
                    child: Container(
                      padding: EdgeInsets.only(right: 8),
                      child: Icon(Icons.attachment_outlined,
                          size: 20, color: Colors.white),
                    ),
                  ),
                  TextSpan(
                    text: userModel.blog ?? "-",
                    recognizer: TapGestureRecognizer()
                    ..onTap = (){
                      Navigator.pushNamed(context, WebViewScreen.routeName, arguments:userModel.blog);
                    } ,
                    style: AppTheme.subtitle2
                        .copyWith(fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
            SizedBox(height: 8,),
            Row(
              children: [
                RichText(
                  text: TextSpan(
                    children: [
                      WidgetSpan(
                        alignment: PlaceholderAlignment.middle,
                        child: Container(
                          padding: EdgeInsets.only(right: 8),
                          child: Icon(
                            Icons.person_outlined,
                            size: 20,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      TextSpan(
                        text: "${userModel.followers} followers • ${userModel.following} following",
                        style: AppTheme.subtitle2,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _lazyLoading() {
    return Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 24),
          Row(
            children: [
              SizedBox(width: 16),
              CircleAvatar(
                radius: 40.0,
                backgroundColor: Colors.grey,
              ),
              SizedBox(width: 20),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    color: Colors.grey,
                    width: 150,
                    height: 10,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    width: 100,
                    height: 10,
                    color: Colors.grey,
                  ),
                ],
              )
            ],
          ),
          SizedBox(height: 24),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(4),
                color: Colors.grey,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
