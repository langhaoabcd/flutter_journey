import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../states/CounterState.dart';

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
                // Consumer<Counter>(
                //     builder: (context, counter, child) => Text(
                //           '${counter.counter}',
                //           style: Theme.of(context).textTheme.headlineMedium,
                //         ))
                Text(
                  // Calls `context.watch` to make [Count] rebuild when
                  // [Counter] changes.
                  '${context.watch<Counter>().counter}',
                    key: const Key('counterState'),
                    style: Theme.of(context).textTheme.headlineMedium)
              ],
            ),
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              // do somethin
              // context.select((value) => null;)
              // Calls `context.read` instead of `context.watch` so
              // that it does not rebuild when [Counter] changes.
              context.read<Counter>().increment();
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
