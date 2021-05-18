import 'package:dio/dio.dart';

class ApiDio {
  static const get_users = '/users';

  final String _baseUrl;
  final Map<String, dynamic> _headers;

  ApiDio(this._baseUrl, this._headers);

  Dio init() {
    Dio dio = Dio(
      BaseOptions(
        baseUrl: _baseUrl,
        headers: _headers,
      ),
    );

    implementInterceptors();
    return dio;
  }

  void implementInterceptors() {}
}
