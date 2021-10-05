import 'package:cloudmate/src/models/user.dart';
import 'package:cloudmate/src/public/api_gateway.dart';
import 'package:cloudmate/src/resources/base_repository.dart';
import 'package:dio/dio.dart';

class UserRepository {
  Future<UserModel?> getInfoUser() async {
    Response response = await BaseRepository().getRoute(ApiGateway.GET_INFO);
    if (response.statusCode == 200) {
      return UserModel.fromMap(response.data['data'] as Map<String, dynamic>);
    }
    return null;
  }

  Future<UserModel?> updateUser({
    required String firstName,
    required String lastName,
    required String phone,
    required String intro,
  }) async {
    var body = {
      "firstName": firstName,
      "lastName": lastName,
      "intro": intro,
      "phone": phone,
    };
    Response response = await BaseRepository().patchRoute(ApiGateway.USER, body: body);
    if ([200, 201].contains(response.statusCode)) {
      return UserModel.fromMap(response.data['data'] as Map<String, dynamic>);
    }
    return null;
  }
}
