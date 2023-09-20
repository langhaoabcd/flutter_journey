import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:myfltter1/pages/form_app/web_view_page.dart';
import 'package:myfltter1/pages/layout/container_page.dart';
import 'package:myfltter1/pages/layout/row_column.dart';
import 'package:myfltter1/pages/layout/sizing.dart';
import 'package:myfltter1/theme/app_theme.dart';
import 'package:myfltter1/widgets/xi_deng_logo.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_gen/gen_l10n/myflutter_app_localizations.dart';

import '../layout/page1.dart';
import '../layout/grild_list1.dart';
import 'autofill.dart';
import 'form_widgets.dart';
import 'sign_in_http.dart';
import 'validation.dart';

final demos = [
  Demo(
    name: 'Sign in with HTTP',
    route: 'signin_http',
    builder: (context) => const SignInHttp(
        // This sample uses a mock HTTP client.
        // httpClient: mockClient,
        ),
  ),
  Demo(
    name: 'Autofill',
    route: 'autofill',
    builder: (context) => const FormAutofill(),
  ),
  Demo(
    name: 'Form widgets',
    route: 'form_widgets',
    builder: (context) => const FormWidgets(),
  ),
  Demo(
    name: 'Validation',
    route: 'validation',
    builder: (context) => const FormValidation(),
  ),
  // Demo(
  //   name: 'WebViewPage',
  //   route: 'WebViewPage',
  //   builder: (context) => WebViewPage(
  //     uri: Uri.parse("http://www.baidu.com"),
  //     title: "百度一下",
  //   ),
  // ),
  Demo(
    name: '布局1-Lake',
    route: 'layout1',
    builder: (context) => const Page1(),
  ),
  Demo(
    name: '布局1-container1',
    route: 'layout2',
    builder: (context) => const ContainerPage(),
  ),
  Demo(
    name: '布局1-grid-list',
    route: 'layout3',
    builder: (context) => const GrildList1(),
  ),
  Demo(
    name: '布局1-sizing',
    route: 'layout4',
    builder: (context) => const Sizing(),
  ),
  Demo(
    name: '布局1-row column',
    route: 'layout5',
    builder: (context) => const RowColumn(),
  )
];

final _router = GoRouter(routes: [
  GoRoute(
    path: '/',
    builder: (context, state) => const HomePage(),
    routes: [
      for (final demo in demos)
        GoRoute(
          path: demo.route,
          builder: (context, state) => demo.builder(context),
        ),
    ],
  ),
]);

class FormApp extends StatefulWidget {
  const FormApp({Key? key}) : super(key: key);

  @override
  _FormAppState createState() => _FormAppState();
}

class _FormAppState extends State<FormApp> {
  late ThemeData _theme;
  late Locale _locale;

  @override
  void initState() {
    _theme = lightTheme; //darkTheme; //切换主题，可自动系统追随设置深浅色主题
    _locale = Locale('zh'); //切换语言，可将配置保存在本地
  }

  // void changeLanguage(Locale locale) {
  //   setState(() {
  //     _locale = locale;
  //   });
  // }

  // void switchTheme() {
  //   setState(() {
  //     _theme = // 切换 light/dark 主题
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
        title: 'Form Samples',
        locale: _locale,
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: AppLocalizations.supportedLocales,
        //可自动替换下列语句
        // localizationsDelegates: [
        //   AppLocalizations.delegate, // Add this line
        //   GlobalMaterialLocalizations.delegate,
        //   GlobalWidgetsLocalizations.delegate,
        //   GlobalCupertinoLocalizations.delegate,
        // ],
        // supportedLocales: [
        //   Locale('zh'),
        //   Locale('en'),
        //   Locale.fromSubtags(
        //     languageCode: 'zh',
        //     scriptCode: 'Hans',
        //     countryCode: 'CN'), // 'zh_Hans_CN'
        // Locale.fromSubtags(
        //     languageCode: 'zh',
        //     scriptCode: 'Hant',
        //     countryCode: 'TW')
        // ],
        // themeMode: ThemeMode.system, //设置主题跟随系统，深浅色主题
        // darkTheme: darkTheme,
        // theme: lightTheme,
        theme:
            _theme, //自定义设置主题 ThemeData(primarySwatch: Colors.blue, useMaterial3: true),
        routerConfig: _router);
  }
}

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "表单示例",
          // style: TextStyle(fontFamily: 'NotoSansSc'),
        ),
      ),
      body: ListView(
        children: [
          ...[
            const XiDengLogo(height: 100),
            Text(
              AppLocalizations.of(context)!.helloWorld,
              // style: const TextStyle(fontFamily: 'NotoSansSc'),
            )
          ], //实现多语言
          ...demos.map((e) => DemoTitle(demo: e))
        ],
      ),
    );
  }
}

class DemoTitle extends StatelessWidget {
  final Demo demo;

  const DemoTitle({Key? key, required this.demo}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(demo.name),
      onTap: () {
        context.go('/${demo.route}');
        //Navigator.of(context).pushNamed(demo.route);
      },
    );
  }
}

class Demo {
  final String name;
  final String route;
  final WidgetBuilder builder;

  const Demo({required this.name, required this.route, required this.builder});
}
