import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:myfltter1/pages/providerTheme/PersonApp.dart';
import 'package:myfltter1/pages/provider_cart/models/catalog_model.dart';
import 'package:myfltter1/pages/provider_counter/my_counter_home_page.dart';
import 'package:myfltter1/router/router.dart';
import 'package:myfltter1/theme/app_theme.dart';
import 'package:oktoast/oktoast.dart';
import 'package:provider/provider.dart';

import 'pages/form_app/form_app.dart';

void main() {
  // runApp(const MyApp());
  // runApp(ChangeNotifierProvider(
  //   create: (context) => Counter(),
  //   child: const MyCounterHomePage(),
  // )); //测试状态管理1。Counter

  runApp(const PersonApp()); //测试状态切换主题

  Map<String, dynamic> res = <String, dynamic>{
    'id': "111",
    'author': "aaaa",
  };
  // res.map()
  // Intl.defaultLocale = 'zh_CN';

  // runApp(DefaultTextStyle(
  //   style: const TextStyle(fontFamily: 'NotoSansSc'),
  //   child: FormApp(),
  // )); //测试表单

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
  // )); //测试状态管理2。Cart
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
