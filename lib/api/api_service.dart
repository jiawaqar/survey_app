import 'package:dio/dio.dart';

class ApiService {
  final Dio _dio = Dio();

  Future<String?> login(String email, String password) async {
    const url = "https://reqres.in/api/login";

    try {
      final response = await _dio.post(url, data: {
        "email": email,
        "password": password,
      });

      if (response.statusCode == 200) {
        return response.data["token"];
      }
    } catch (e) {
      print("Login Error: $e");
    }

    return null;
  }
}
