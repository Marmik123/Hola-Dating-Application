import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class HttpService {
  static HttpService _httpService = HttpService();
  static HttpService getInstance() => _httpService;

  Future<Response> post(String url, dynamic args) async {
    try {
      Dio dio = Dio();
      if (kDebugMode || true) {
        dio.interceptors.add(PrettyDioLogger(
          requestHeader: true,
          requestBody: true,
          responseBody: true,
          responseHeader: true,
          maxWidth: 200,
          compact: true,
          error: true,
        ));
      }
      Response response = await dio.post(url,
          data: jsonEncode(args),
          options: Options(contentType: 'application/json', headers: {
            'content-type': 'application/json',
          }));

      return response;
    } on DioError catch (e) {
      return e.response;
    }
  }

  Future<Response> postProfilePic(String url, FormData args) async {
    try {
      Dio dio = Dio();
      if (kDebugMode || true) {
        dio.interceptors.add(PrettyDioLogger(
          requestHeader: true,
          requestBody: true,
          responseBody: true,
          responseHeader: true,
          maxWidth: 150,
          compact: true,
          error: true,
        ));
      }
      Response response = await dio.post(
        url,
        data: args,
      );
      return response;
    } on DioError catch (e) {
      return e.response;
    }
  }

  Future<Response> get(String url) async {
    try {
      Dio dio = Dio();
      if (kDebugMode || true) {
        dio.interceptors.add(PrettyDioLogger(
          requestHeader: true,
          requestBody: true,
          responseBody: true,
          responseHeader: true,
          maxWidth: 200,
          compact: true,
          error: true,
        ));
      }
      Response response = await dio.get(
        url,
        /*
          options: Options(contentType: 'application/json', headers: {
            'content-type': 'application/json',
          }
          )*/
      );

      return response;
    } on DioError catch (e) {
      return e.response.data['message'];
    }
  }
}
