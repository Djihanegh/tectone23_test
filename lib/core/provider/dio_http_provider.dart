import 'package:dio/dio.dart';
import 'package:flutter_loggy_dio/flutter_loggy_dio.dart';

abstract class DioHttpProvider {
  DioHttpProvider({
    required String baseUrl,
  }) : _dio = Dio(
          BaseOptions(
            baseUrl: baseUrl,
          ),
        )..interceptors.add(LoggyDioInterceptor());

  final Dio _dio;

  Future<Response<Map<String, dynamic>>> get(
    String path, {
    Map<String, dynamic>? queryParameters,
  }) {
    return _dio.get(
      path,
      queryParameters: queryParameters,
    );
  }

  Future<Response<Map<String, dynamic>>> post(
    String path, {
    Map<String, dynamic>? queryParameters,
  }) {
    return _dio.post(
      path,
      queryParameters: queryParameters,
    );
  }
}
