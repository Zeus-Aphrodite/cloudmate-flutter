import 'package:cloudmate/src/models/history_quiz_model.dart';
import 'package:cloudmate/src/public/api_gateway.dart';
import 'package:cloudmate/src/resources/base_repository.dart';
import 'package:dio/dio.dart';

class HistoryQuizRepository {
  Future<List<HistoryQuizModel>> getHistory() async {
    Response response = await BaseRepository().getRoute(ApiGateway.HISTORY);
    if (response.statusCode == 200) {
      List<dynamic> data = response.data['data'];
      return data.map((e) => HistoryQuizModel.fromJson(e)).toList();
    } 
    return [];
  }
}