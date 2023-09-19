import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class HttpHelper {
  static const String baseUrl = 'http://localhost:5141';

  static Dio dio = Dio()
    ..options.baseUrl = baseUrl
    ..options.contentType = Headers.jsonContentType
    ..options.headers = {'Content-Type': 'application/json'}
    ..options.connectTimeout = const Duration(seconds: 20)
    ..options.receiveTimeout = const Duration(seconds: 20)
    ..interceptors.add(InterceptorsWrapper(onRequest: (options, handler) async {
      // 在这里添加请求之前需要设置的信息
      return handler.next(options);
    }, onResponse: (response, handler) async {
      response.headers.add('Access-Control-Allow-Origin', '*');
      response.headers.add('Access-Control-Allow-Headers', '*');
      response.headers.add('Access-Control-Allow-Methods', '*');
      return handler.next(response);
    }, onError: (e, handler) async {
      debugPrint('错误请求：${e.message}');
      switch (e.type) {
        case DioExceptionType.connectionTimeout: // 连接超时
        case DioExceptionType.sendTimeout: // 请求超时
        case DioExceptionType.receiveTimeout: // 响应超时
          // debugPrint('网络连接超时');
          Fluttertoast.showToast(
            msg: '网络连接超时',
            toastLength: Toast.LENGTH_LONG,
            gravity: ToastGravity.TOP,
          );
          break;
        case DioExceptionType.connectionError:
          debugPrint('网络连接错误');
          Fluttertoast.showToast(
            msg: '无法连接到服务器,请检查你的网络!',
            toastLength: Toast.LENGTH_LONG,
            gravity: ToastGravity.CENTER
          );
          // GlobalKey<ScaffoldState> navigatorKey = GlobalKey<ScaffoldState>();
          // AwesomeDialog(
          //   context: navigatorKey.currentContext!,
          //   dialogType: DialogType.error,
          //   title: '网络连接错误',
          //   desc: '无法连接到服务器,请检查你的网络!',
          //   btnOkOnPress: () {},
          // ).show();
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

  HttpHelper._internal() {
    debugPrint('初始化_internal');
  }

  static Future<T> get<T>(String url, {params}) async {
    Response response = await dio.get(url,
        queryParameters: params,
        options: Options(headers: {'Authorization': 'token'}));
    return _handleResponse<T>(response);
  }

  static Future<T> post<T>(String url, {data, params}) async {
    Response response = await dio.post(url,
        data: data,
        queryParameters: params,
        options: Options(headers: {'Authorization': 'token'}));
    return _handleResponse<T>(response);
  }

  /// 表单形式
  static Future<T> postForm<T>(String url, {data, params}) async {
    Response response = await dio.post(url,
        data: data,
        queryParameters: params,
        options: Options(
            contentType: 'application/x-www-form-urlencoded',
            headers: {
              'Content-Type': 'application/x-www-form-urlencoded',
              'Authorization': 'token'
            }));
    return _handleResponse<T>(response);
  }

  static Future<T> put<T>(String url, {data, params}) async {
    final response = await dio.put(url,
        data: data,
        queryParameters: params,
        options: Options(headers: {'Authorization': 'token'}));
    return _handleResponse<T>(response);
  }

  static Future<T> delete<T>(String url, {data, params}) async {
    final response = await dio.delete(url,
        data: data,
        queryParameters: params,
        options: Options(headers: {'Authorization': 'token'}));
    return _handleResponse<T>(response);
  }

  //todo upload
  //todo download

  // 通用处理响应数据的方法
  static T _handleResponse<T>(Response response) {
    if (response.statusCode == 200) {
      return response.data;
    } else {
      throw Exception(response.statusMessage);
    }
  }
}
