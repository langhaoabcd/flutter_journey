// flutter_bmflocation: ^3.4.1
//   flutter_baidu_mapapi_map: ^3.4.1
//   permission_handler: ^10.4.3

// import 'dart:io';

// import 'package:flutter/material.dart';
// import 'package:flutter_bmflocation/flutter_bmflocation.dart';
// import 'package:flutter_baidu_mapapi_base/flutter_baidu_mapapi_base.dart'
//     show BMFMapSDK, BMF_COORD_TYPE;
// import 'package:permission_handler/permission_handler.dart';

// class LocationApp extends StatelessWidget {
//   const LocationApp({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Flutter Demo',
//       theme: ThemeData(primarySwatch: Colors.blue, useMaterial3: true),
//       home: LocationHomeApp(),
//       // home: const MyHomePage(title: 'Flutter Demo Home Page'),
//     );
//   }
// }

// class LocationHomeApp extends StatefulWidget {
//   const LocationHomeApp({Key? key}) : super(key: key);

//   @override
//   _LocationHomeAppState createState() => _LocationHomeAppState();
// }

// class _LocationHomeAppState extends State<LocationHomeApp> {
//   @override
//   void initState() {
//     super.initState();

//     LocationFlutterPlugin locationFlutterPlugin = LocationFlutterPlugin();

//     /// 动态申请定位权限
//     requestPermission();
//     // 设置是否隐私政策
//     locationFlutterPlugin.setAgreePrivacy(true);
//     BMFMapSDK.setAgreePrivacy(true);

//     if (Platform.isIOS) {
//       /// 设置ios端ak, android端ak可以直接在清单文件中配置
//       locationFlutterPlugin.authAK('请在此输入您在开放平台上申请的API_KEY');
//       BMFMapSDK.setApiKeyAndCoordType(
//           '请在此输入您在开放平台上申请的API_KEY', BMF_COORD_TYPE.BD09LL);
//     } else if (Platform.isAndroid) {
//       // Android 目前不支持接口设置Apikey,
//       // 请在主工程的Manifest文件里设置，详细配置方法请参考官网(https://lbsyun.baidu.com/)demo
//       BMFMapSDK.setCoordType(BMF_COORD_TYPE.BD09LL);
//     }

//     // iOS端鉴权结果
//     locationFlutterPlugin.getApiKeyCallback(callback: (String result) {
//       String str = result;
//       print('鉴权结果：' + str);
//     });
//   }

//   @override
//   void dispose() {
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('百度地图定位插件'),
//       ),
//       body: BaiduLocationDemo(),
//     );
//   }
// }

// // 动态申请定位权限
// void requestPermission() async {
//   // 申请权限
//   bool hasLocationPermission = await requestLocationPermission();
//   if (hasLocationPermission) {
//     // 权限申请通过
//   } else {}
// }

// /// 申请定位权限
// /// 授予定位权限返回true， 否则返回false
// Future<bool> requestLocationPermission() async {
//   //获取当前的权限
//   var status = await Permission.location.status;
//   if (status == PermissionStatus.granted) {
//     //已经授权
//     return true;
//   } else {
//     //未授权则发起一次申请
//     status = await Permission.location.request();
//     if (status == PermissionStatus.granted) {
//       return true;
//     } else {
//       return false;
//     }
//   }
// }

// class BaiduLocationDemo extends StatelessWidget {
//   const BaiduLocationDemo({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Container();
//   }
// }
