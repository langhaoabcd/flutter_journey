import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:myfltter1/states/ThemeState.dart';
import 'package:provider/provider.dart';

class PersonPage extends StatefulWidget {
  const PersonPage({Key? key}) : super(key: key);

  @override
  _PersonPageState createState() => _PersonPageState();
}

class _PersonPageState extends State<PersonPage> {
  bool _dartMode = false;
  // var them = MyTheme.dark;
  void _changeDarkMode(bool flag) {
    final provider = Provider.of<ThemeState>(context, listen: false);
    // them = provider.getCurrentTheme;
    provider.switchTheme();
    setState(() {
      _dartMode = flag;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            "Provider SwitchTheme",
            // style: TextStyle(fontFamily: 'NotoSansSc'),
          ),
        ),
        body: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Text(them.toString()),
            CupertinoSwitch(
                // This bool value toggles the switch.
                value: _dartMode,
                activeColor: CupertinoColors.activeBlue,
                onChanged: _changeDarkMode),
          ],
        ));
  }
}
