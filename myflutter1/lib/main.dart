import 'package:flutter/material.dart';
import 'package:myfltter1/pages/oauthApp/AuthApp.dart';
import 'package:myfltter1/pages/providerCart/models/CatalogModel.dart';
import 'package:myfltter1/pages/providerCart/store/CartModel.dart';
import 'package:myfltter1/pages/providerCounter/Counter.dart';
import 'package:myfltter1/pages/providerCounter/MyCounterHomePage.dart';
import 'package:myfltter1/router/router.dart';
import 'package:provider/provider.dart';

import 'pages/baiduLocation/LocationApp.dart';
import 'pages/formApp/FormApp.dart';

void main() {
  // runApp(const MyApp());
  // runApp(ChangeNotifierProvider(
  //   create: (context) => Counter(),
  //   child: const MyCounterHomePage(),
  // )); //测试状态管理1。Counter

  runApp(const FormApp()); //测试表单

  // runApp(const AuthApp()); //测试oidc

  // runApp(const LocationApp()); //测试百度定位

  // runApp(MultiProvider(
  //   providers: [
  //     // In this sample app, CatalogModel never changes, so a simple Provider
  //     // is sufficient.
  //     Provider(create: (context) => CatalogModel()),
  //     // CartModel is implemented as a ChangeNotifier, which calls for the use
  //     // of ChangeNotifierProvider. Moreover, CartModel depends
  //     // on CatalogModel, so a ProxyProvider is needed.
  //     ChangeNotifierProxyProvider<CatalogModel, CartModel>(
  //         create: (context) => CartModel(),
  //         update: (context, catalog, cart) {
  //           if (cart == null) throw ArgumentError.notNull('cart');
  //           cart.catalog = catalog;
  //           return cart;
  //         })
  //   ],
  //   child: const MyApp(),
  // ));//测试状态管理2。Cart
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
        title: 'Flutter Demo',
        theme: ThemeData(
          // This is the theme of your application.
          //
          // Try running your application with "flutter run". You'll see the
          // application has a blue toolbar. Then, without quitting the app, try
          // changing the primarySwatch below to Colors.green and then invoke
          // "hot reload" (press "r" in the console where you ran "flutter run",
          // or simply save your changes to "hot reload" in a Flutter IDE).
          // Notice that the counter didn't reset back to zero; the application
          // is not restarted.
          primarySwatch: Colors.blue,
        ),
        routerConfig: router()
        // home: const MyHomePage(title: 'Flutter Demo Home Page'),
        );
  }
}