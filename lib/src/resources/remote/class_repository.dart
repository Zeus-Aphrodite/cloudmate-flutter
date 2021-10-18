import 'package:cloudmate/src/models/class_model.dart';
import 'package:cloudmate/src/models/user.dart';
import 'package:cloudmate/src/public/api_gateway.dart';
import 'package:cloudmate/src/resources/base_repository.dart';
import 'package:dio/dio.dart';

class ClassRepository {
  Future<ClassModel?> createClass({
    required String name,
    required String topic,
    required String intro,
    required UserModel myProfile,
  }) async {
    var body = {
      'name': name,
      'topic': topic,
      'intro': intro,
    };

    Response? response =
        await BaseRepository().postRoute(ApiGateway.CLASS, body);

    if ([200, 201].contains(response.statusCode)) {
      return ClassModel.fromCreatedClass(response.data['data'], myProfile);
    }

    return null;
  }

  Future<ClassModel?> editClass({
    required String id,
    required String name,
    required String topic,
    required String intro,
    required UserModel myProfile,
  }) async {
    var body = {
      'name': name,
      'topic': topic,
      'intro': intro,
    };

    Response? response = await BaseRepository().patchRoute(
      ApiGateway.CLASS,
      query: 'id=$id',
      body: body,
    );

    if ([200, 201].contains(response.statusCode)) {
      return ClassModel.fromCreatedClass(response.data['data'], myProfile);
    }

    return null;
  }

  Future<ClassModel?> editImageClass({
    required String id,
    required String image,
    required String blurHash,
    required UserModel myProfile,
  }) async {
    var body = {
      'image': image,
      'blurHash': blurHash,
    };

    Response? response = await BaseRepository().patchRoute(
      ApiGateway.CLASS,
      query: 'id=$id',
      body: body,
    );

    if ([200, 201].contains(response.statusCode)) {
      return ClassModel.fromCreatedClass(response.data['data'], myProfile);
    }

    return null;
  }

  Future<List<ClassModel>> getListClasses({
    required int skip,
    int limit = 15,
  }) async {
    Response response = await BaseRepository().getRoute(
      ApiGateway.CLASS,
      query: 'skip=$skip&limit=$limit',
    );
    if ([200, 201].contains(response.statusCode)) {
      List<dynamic> listResult = response.data['data'];
      return listResult.map((item) => ClassModel.fromMap(item)).toList();
    }

    return [];
  }

  Future<List<ClassModel>> getListRecommendClasses({
    required int skip,
    int limit = 15,
  }) async {
    Response response = await BaseRepository().getRoute(
      ApiGateway.RECOMMEND_CLASSES,
      query: 'skip=$skip&limit=$limit',
    );
    if ([200, 201].contains(response.statusCode)) {
      List<dynamic> listResult = response.data['data'];
      return listResult.map((item) => ClassModel.fromMap(item)).toList();
    }

    return [];
  }

  Future<bool> joinClass({required String classId}) async {
    var body = {
      'idClass': classId,
    };
    Response response =
        await BaseRepository().postRoute(ApiGateway.JOIN_CLASS, body);
    if ([200, 201].contains(response.statusCode)) {
      return true;
    }
    return false;
  }

  Future<bool> leaveClass({required String classId}) async {
    var body = {
      'idClass': classId,
    };
    Response response =
        await BaseRepository().deleteRoute(ApiGateway.LEAVE_CLASS, body: body);
    if (response.statusCode == 200) {
      return true;
    }
    return false;
  }
}
