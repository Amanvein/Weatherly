import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:weatherly/dependencies.dart';
import 'package:weatherly/services/environment.dart';

class DioClient {
  final _dio = getIt<Dio>();
  String baseURL = getIt<EnvironmentService>().getValue('API_KEY');

// Get:-----------------------------------------------------------------------
  Future<Response> get(
    String url, {
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onReceiveProgress,
  }) async {
    try {
      final response = await _dio.get(
        baseURL + url,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
        onReceiveProgress: onReceiveProgress,
      );

      return response;
    } catch (e) {
      debugPrint('get method error $e');
      rethrow;
    }
  }
}
