import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final repositoryProvider = Provider((ref) => Repository());

class Repository {
  Dio dio = Dio(BaseOptions(
    baseUrl:
        'https://bowerbird-test-api-production-42f964da9407.herokuapp.com/api/v1/',
    connectTimeout: const Duration(seconds: 20),
    receiveTimeout: const Duration(seconds: 60),
  ));

  Future<Map<String, dynamic>> login(String email, String password) async {
    try {
      var response = await dio.post("/login", data: {
        "user": {"email": email, "password": password}
      });
      return response.data;
    } on DioException catch (e) {
      return e.response?.data;
    }
  }

  Future getMessageGroup(String token) async {
    try {
      var response = await dio.get("/message_groups",
          options: Options(headers: {"Authorization": "Bearer $token"}));
      return response.data;
    } on DioException catch (e) {
      return e.response;
    }
  }
}
