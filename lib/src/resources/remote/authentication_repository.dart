import 'dart:async';

import 'package:cloudmate/src/public/api_gateway.dart';
import 'package:cloudmate/src/resources/base_repository.dart';
import 'package:cloudmate/src/resources/local/user_local.dart';
import 'package:dio/dio.dart';

class AuthenticationRepository {
  Future<bool> login(String username, String password) async {
    var body = {
      'username': username.toLowerCase(),
      'password': password,
    };
    Response response = await BaseRepository().postRoute(
      ApiGateway.LOGIN,
      body,
    );

    if (response.statusCode == 200) {
      UserLocal().saveAccessToken(response.data['data']['token']);
      return true;
    }
    return false;
  }

  Future<bool> register({
    required String fistName,
    required String lastName,
    required String username,
    required String password,
  }) async {
    var body = {
      'firstName': fistName,
      'lastName': lastName,
      'username': username.toLowerCase(),
      'password': password,
    };
    Response response = await BaseRepository().postRoute(
      ApiGateway.REGISTER,
      body,
    );

    if (response.statusCode == 200) {
      UserLocal().saveAccessToken(response.data['data']['token']);
      return true;
    }
    return false;
  }

  FutureOr<bool> logOut() async {
    UserLocal().clearAccessToken();
    return false;
  }
}
