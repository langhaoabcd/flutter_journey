import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../services/weather_service.dart';
import '../../model/account_data.dart';

const double _kItemExtent = 32.0;
const List<String> _fruitNames = <String>[
  'Apple',
  'Mango',
  'Banana',
  'Orange',
  'Pineapple',
  'Strawberry',
];

class SignInHttp extends StatefulWidget {
  const SignInHttp({Key? key}) : super(key: key);

  @override
  _SignInHttpState createState() => _SignInHttpState();
}

class _SignInHttpState extends State<SignInHttp> {
  AccountData formData = AccountData();
  int _selectedFruit = 4;

  @override
  void initState() {
    super.initState();
    // var list = Future.value(WeatherService.list())
    //     .then((result) => print('Result: ${result.first.toJson()}'));
    load();
  }

  void load() async {
    debugPrint('load data...');
    var list = await WeatherService.list();
    debugPrint('Result: ${list.first.toJson()}');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Sign in Form')),
      body: Form(
          child: Scrollbar(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(children: [
            ...[
              TextFormField(
                autofocus: true,
                textInputAction: TextInputAction.next,
                decoration: const InputDecoration(
                  filled: true,
                  hintText: 'Your email address',
                  labelText: 'Email',
                ),
                onChanged: (value) {
                  formData.email = value;
                },
              ),
              TextFormField(
                decoration: const InputDecoration(
                  filled: true,
                  labelText: 'Password',
                ),
                obscureText: true,
                onChanged: (value) {
                  formData.password = value;
                },
              ),
              TextButton(child: const Text('Sign in'), onPressed: login
                  // () async {
                  //   // Use a JSON encoded string to send
                  //   var statusCode = 200;
                  //   // s: {'content-type': 'application/json'});
                  //   // Use a JSON encoded string to send
                  //   // switch (statusCode) {
                  //   //   200 => 'Successfully signed in.',
                  //   //   401 => 'Unable to sign in.',
                  //   //   _ => 'Something went wrong. Please try again.'
                  //   // }

                  //   _showDialog('Successfully signed in.' +
                  //       ' ' +
                  //       formData.email.toString());
                  // },
                  ),
              Container(
                height: 216,
                padding: const EdgeInsets.only(top: 6.0),
                // The Bottom margin is provided to align the popup above the system navigation bar.
                margin: EdgeInsets.only(
                  bottom: MediaQuery.of(context).viewInsets.bottom,
                ),
                // Provide a background color for the popup.
                color: CupertinoColors.systemBackground.resolveFrom(context),
                // Use a SafeArea widget to avoid system overlaps.
                child: SafeArea(
                  top: false,
                  child: CupertinoPicker(
                    magnification: 1.22,
                    squeeze: 1.2,
                    useMagnifier: true,
                    itemExtent: _kItemExtent,
                    // This sets the initial item.
                    scrollController: FixedExtentScrollController(
                      initialItem: _selectedFruit,
                    ),
                    // This is called when selected item is changed.
                    onSelectedItemChanged: (int selectedItem) {
                      setState(() {
                        _selectedFruit = selectedItem;
                      });
                    },
                    children:
                        List<Widget>.generate(_fruitNames.length, (int index) {
                      return Center(child: Text(_fruitNames[index]));
                    }),
                  ),
                ),
              )
            ].expand(
              (widget) => [
                widget,
                const SizedBox(
                  height: 24,
                )
              ],
            )
          ]),
        ),
      )),
    );
  }

  void _showDialog(String message) {
    showDialog(
        context: context,
        builder: (context) => AlertDialog(
              title: Text(message),
              actions: [
                TextButton(
                    onPressed: () => Navigator.of(context).pop(),
                    child: const Text('OK'))
              ],
            ));
  }

  void login() {
    if (formData.email!.isEmpty || formData.password!.isEmpty) {
      // context.showSnackBar('请输入邮箱和密码');
      return;
    }
    var jsonStr = formData.toJson();
    print(jsonStr);
    // var loginTask = accountService.authenticate(
    //     txtEmailController.text, txtPasswordController.text);
    // var result = await context.showLoading<ServiceResponse<AccountDTO>>('登陆中...',loginTask);

    // context.showLoading('登录中...');
  }
}
