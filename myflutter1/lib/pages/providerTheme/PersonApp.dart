import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:myfltter1/states/ThemeState.dart';
import 'package:provider/provider.dart';

import 'PersonPage.dart';

class PersonApp extends StatelessWidget {
  const PersonApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<ThemeState>(create: (_) => ThemeState()),
      ],
      child: Consumer<ThemeState>(
        builder: (context, ThemeState themes, _) {
          return MaterialApp(
            title: 'Flutter Demo' + themes.getCurrentTheme.toString(),
            theme: themes.getCurrentThemeData,
            // theme: ThemeData(
            //   fontFamily: 'NotoSansSc', //全局指定字体
            //   brightness: Brightness.dark,
            //   primaryColor: Colors.black,
            //   // fontFamily: GoogleFonts.getFont('NotoSansSc').fontFamily, //.PingFangSC(), //'Hind',
            //   textTheme: const TextTheme(
            //     displayLarge:
            //         TextStyle(fontSize: 72, fontWeight: FontWeight.bold),
            //     titleLarge:
            //         TextStyle(fontSize: 36, fontStyle: FontStyle.italic),
            //     bodyMedium: TextStyle(fontSize: 14),
            //   ),
            // ),
            home: const PersonPage(),
          );
        },
      ),
    );
  }
}
