import 'dart:convert';
import 'package:dio/dio.dart';

class AuthService {
  final String baseUrl = 'https://dummyjson.com/auth/login';
  final Dio _dio = Dio();

  Future<Map<String, dynamic>> login(String username, String password) async {
    try {
      final response = await _dio.post(
        baseUrl,
        data: {'username': username, 'password': password},
      );
      if (response.statusCode == 200) {
        final Map<String, dynamic> responseData = response.data;
        return responseData;
      } else {
        throw Exception('Failed to login');
      }
    } catch (e) {
      throw Exception('Failed to login: $e');
    }
  }
}
