import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class MyLogin extends StatelessWidget {
  const MyLogin({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Login'),
          backgroundColor: Colors.blue,
        ),
        body: Center(
          child: Column(
            children: [
              const Text("Welcome"),
              TextFormField(
                  decoration: const InputDecoration(hintText: 'username')),
              TextFormField(
                  decoration: const InputDecoration(hintText: 'password')),
              const SizedBox(height: 24),
              ElevatedButton(
                  onPressed: () => context.pushReplacement("/catalog"),
                  style:
                      ElevatedButton.styleFrom(backgroundColor: Colors.yellow),
                  child: const Text("ENTER"))
            ],
          ),
        ));
  }
}
