import 'package:flutter/material.dart';
import '../../services/WeatherService.dart';
import 'AccountData.dart';

class SignInHttp extends StatefulWidget {
  const SignInHttp({Key? key}) : super(key: key);

  @override
  _SignInHttpState createState() => _SignInHttpState();
}

class _SignInHttpState extends State<SignInHttp> {
  AccountData formData = AccountData();

  @override
  void initState() {
    super.initState();
    // var list = Future.value(WeatherService.list())
    //     .then((result) => print('Result: ${result.first.toJson()}'));
    load();
  }

  void load() async {
    print('load data...');
    var list = await WeatherService.list();
    print('Result: ${list.first.toJson()}');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Sign in Form")),
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
