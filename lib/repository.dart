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

  Future getMessage(String token, String messageGroupId) async {
    try {
      var response = await dio.get("/messages",
          queryParameters: {"message_group_id": messageGroupId},
          options: Options(headers: {"Authorization": "Bearer $token"}));
      return response.data;
    } on DioException catch (e) {
      return e.response;
    }
  }

  Future getMessageGroupMember(String token, String messageGroupId) async {
    try {
      var response = await dio.get("/message_group_members",
          queryParameters: {"message_group_id": messageGroupId},
          options: Options(headers: {"Authorization": "Bearer $token"}));
      return response.data;
    } on DioException catch (e) {
      return e.response;
    }
  }

  Future sendMessage(String token, String messageGroupId,
      String messageGroupMemberId, String message) async {
    final formData = FormData.fromMap(
      {
        "message[message_group_id]": messageGroupId,
        "message[message_group_member_id]": messageGroupMemberId,
        "message[message]": message
      },
    );
    try {
      var response = await dio.post("/messages",
          queryParameters: {"message_group_id": messageGroupId},
          data: formData,
          options: Options(headers: {"Authorization": "Bearer $token"}));
      return response.data;
    } on DioException catch (e) {
      return e.response;
    }
  }
}
