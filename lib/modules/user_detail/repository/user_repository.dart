

import 'dart:convert';

import 'package:github_bloc/constant/api_path.dart';
import 'package:github_bloc/modules/home/model/follower_model.dart';
import 'package:github_bloc/modules/home/model/user_model.dart';
import 'package:github_bloc/utils/service/network_service.dart';
import 'package:http/http.dart';

class UserRepository extends NetworkService {
  UserRepository();

  UserRepository._privateConstructor();
  static final UserRepository _instance = UserRepository._privateConstructor();
  static UserRepository get instance => _instance;

  Future<UserModel> getProfileDetail(String username) async {
    print("fetching api by username : $username");

    var map = await getMethod("${BASE_URL}users/$username");
    print(map);
    return UserModel.fromJson(map);
  }

  Future<List<FollowerModel>> getFollowerList(String username) async {
    print("fetching api by username : $username");
    var map = await getMethod("${BASE_URL}users/$username/followers");
    return followerModelFromJson(map);
  }

}