import 'package:dio/dio.dart';

class ApiService {
  final String _baseUrl = 'https://newsapi.org/v2/';
  final String _apiKey = '80cab9873bdf4cc5a0a2eb559d77ac08';

  final Dio dio;
  ApiService(this.dio);

  Future<Map<String, dynamic>> get({required String endPoint}) async {
    var response = await dio.get('$_baseUrl$endPoint&apiKey=$_apiKey');
    return response.data;
  }
}