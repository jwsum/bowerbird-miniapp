import 'package:dio/dio.dart';

class Repository {
  Dio dio = Dio(BaseOptions(
    baseUrl:
        'https://bowerbird-test-api-production-42f964da9407.herokuapp.com/api/v1/',
    connectTimeout: const Duration(seconds: 20),
    receiveTimeout: const Duration(seconds: 60),
  ));

  Future<String> login(String email, String password) async {
    var response = await dio.post("/login", data: {
      "user": {"email": email, "password": password}
    });

    var result = response.data;
    return result;
  }
}
