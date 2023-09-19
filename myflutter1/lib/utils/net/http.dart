import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class HttpHelper {
  static const String baseUrl = 'http://localhost:5141';

  static Dio dio = Dio()
    ..options.baseUrl = baseUrl
    ..options.contentType = Headers.jsonContentType
    ..options.headers = {'Content-Type': 'application/json'}
    ..options.connectTimeout = const Duration(seconds: 20)
    ..options.receiveTimeout = const Duration(seconds: 20)
    ..interceptors.add(InterceptorsWrapper(onResponse: (response, handler) {
      response.headers.add('Access-Control-Allow-Origin', '*');
      response.headers.add('Access-Control-Allow-Headers', '*');
      response.headers.add('Access-Control-Allow-Methods', '*');
      return handler.next(response);
    }, onError: (e, handler) {
      debugPrint('错误请求：${e.message}');
      switch (e.type) {
        case DioExceptionType.connectionTimeout: // 连接超时
        case DioExceptionType.sendTimeout: // 请求超时
        case DioExceptionType.receiveTimeout: // 响应超时
          debugPrint('网络连接超时');
          break;
        case DioExceptionType.connectionError:
          debugPrint('网络连接错误');
          break;
        default:
          break;
      }
      //根据statusCode处理响应错误
      if (e.response?.statusCode == 401) {
        // 清除本地存储
        // LocalStorage.clear();
        // // 跳转登录页
        // Get.toNamed('/login');
        return;
      }
      // 其他错误,继续抛出
      return handler.next(e);
    }));

  static init() {
    debugPrint('初始化dio');
  }

  static Future<T> get<T>(String url, {params}) async {
    Response response = await dio.get(url, queryParameters: params);
    return _handleResponse<T>(response);
  }

  static Future<T> post<T>(String url, {data, params}) async {
    Response response =
        await dio.post(url, data: data, queryParameters: params);
    return _handleResponse<T>(response);
  }

  /// 表单形式
  static Future<T> postForm<T>(String url, {data, params}) async {
    Response response = await dio.post(url,
        data: data,
        queryParameters: params,
        options: Options(
            contentType: 'application/x-www-form-urlencoded',
            headers: {'Content-Type': 'application/x-www-form-urlencoded'}));
    return _handleResponse<T>(response);
  }

  static Future<T> put<T>(String url, {data, params}) async {
    final response = await dio.put(url, data: data, queryParameters: params);
    return _handleResponse<T>(response);
  }

  static Future<T> delete<T>(String url, {data, params}) async {
    final response = await dio.delete(url, data: data, queryParameters: params);
    return _handleResponse<T>(response);
  }

  // 通用处理响应数据的方法
  static T _handleResponse<T>(Response response) {
    if (response.statusCode == 200) {
      return response.data;
    } else {
      throw Exception(response.statusMessage);
    }
  }
}
