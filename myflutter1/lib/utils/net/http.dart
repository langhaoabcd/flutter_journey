import 'package:dio/dio.dart';

import 'interceptors/timeout_interceptor.dart';

class HttpHelper {
  static const String baseUrl = "http://localhost:5141";

  static Dio dio = Dio()
    ..options.baseUrl = baseUrl
    ..options.contentType = Headers.jsonContentType
    ..options.headers = {"Content-Type": "application/json"}
    ..options.connectTimeout = const Duration(seconds: 20)
    ..options.receiveTimeout = const Duration(seconds: 20);

  static init() {
    // 添加拦截器
    dio.interceptors.add(InterceptorsWrapper(onResponse: (response, handler) {
      // 设置允许所有域名访问
      response.headers.add('Access-Control-Allow-Origin', '*');
      response.headers.add('Access-Control-Allow-Headers', '*');
      response.headers.add('Access-Control-Allow-Methods', '*');
      return handler.next(response);
    }));

    dio.interceptors.add(InterceptorsWrapper(onError: (e, handler) {
      // 处理401错误
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

//   // /*
//   //   表单形式
//   //  */
//   // static Future<Map<String, dynamic>> postForm(
//   //     String path, Map<String, dynamic> map) async {
//   //   var response = await getInstance()!.dio.post(path,
//   //       data: map,
//   //       options: Options(
//   //           contentType: "application/x-www-form-urlencoded",
//   //           headers: {"Content-Type": "application/x-www-form-urlencoded"}));
//   //   return processResponse(response);
//   // }

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
