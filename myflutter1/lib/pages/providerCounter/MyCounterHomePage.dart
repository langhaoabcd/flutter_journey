import 'package:flutter/material.dart';
import 'package:myfltter1/pages/providerCounter/Counter.dart';
import 'package:provider/provider.dart';

class MyCounterHomePage extends StatelessWidget {
  const MyCounterHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          useMaterial3: true,
        ),
        home: Scaffold(
          appBar: AppBar(
            title: const Text("Title"),
          ),
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text('ou have pushed the button this many times:'),
                Consumer<Counter>(
                    builder: (context, counter, child) => Text(
                          '${counter.counter}',
                          style: Theme.of(context).textTheme.headlineMedium,
                        ))
              ],
            ),
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              // do somethin
              // context.select((value) => null;)
              var counter = context.read<Counter>();
              counter.increment();
              print('increment ok');
              // var cart = context.watch<Counter>();
              // var isInCart = context.select<Counter, bool>(
              //     // Here, we are only interested whether [item] is inside the cart.
              //     (cart) => cart.counter > 1);
              // print('xxx' + isInCart.toString());
            },
            tooltip: 'Increment',
            child: const Icon(Icons.add),
          ),
        ));
  }
}
