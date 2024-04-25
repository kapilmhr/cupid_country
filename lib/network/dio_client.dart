import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';

import 'paths.dart';

class DioClient {
  DioClient._();

  static final instance = DioClient._();

  factory DioClient() {
    return instance;
  }

  final Dio _dio = Dio(
    BaseOptions(
        baseUrl: Paths.baseUrl,

        connectTimeout: const Duration(seconds: 60),
        receiveTimeout: const Duration(seconds: 60),
        responseType: ResponseType.json),
  );

  ///Get Method
  Future<dynamic> get(String path,
      {Map<String, dynamic>? queryParameters,
      Options? options,
      CancelToken? cancelToken,
      ProgressCallback? onReceiveProgress}) async {
    try {
      final Response response = await _dio.get(
        path,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
        onReceiveProgress: onReceiveProgress,
      );
      if (response.statusCode == 200) {
        debugPrint(response.data.toString());
        return response.data;
      }
      throw 'something went wrong';
    } catch (e) {
      rethrow;
    }
  }
}
