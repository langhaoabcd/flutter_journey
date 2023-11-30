import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../states/CartState.dart';

class MyCart extends StatelessWidget {
  const MyCart({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cart'),
        backgroundColor: Colors.blue,
      ),
      body: Container(
        color: Colors.white,
        child: const Column(
          children: [
            Expanded(
                child: Padding(
              padding: EdgeInsets.all(2),
              child: _CartList(),
            )),
            Divider(
              height: 4,
              color: Colors.black,
            ),
            _CartTotal(),
          ],
        ),
      ),
    );
  }
}

class _CartList extends StatelessWidget {
  const _CartList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var cart = context.watch<CartModel>();
    print('wath cart');
    print(cart);
    return ListView.builder(
        itemCount: cart.items.length,
        itemBuilder: (context, index) => ListTile(
              leading: const Icon(Icons.dock),
              trailing: IconButton(
                  icon: const Icon(Icons.remove_circle_outline),
                  onPressed: () {
                    cart.remove(cart.items[index]);
                  }),
              title: Text(
                cart.items[index].name,
              ),
            ));
  }
}

class _CartTotal extends StatelessWidget {
  const _CartTotal({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      child: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Consumer<CartModel>(
                builder: (context, cart, child) => Text('${cart.totalPrice}')),
            const SizedBox(
              width: 24,
            ),
            FilledButton(
              onPressed: () {
                return null;
              },
              style: TextButton.styleFrom(foregroundColor: Colors.white),
              child: const Text("BUY"),
            ),
          ],
        ),
      ),
    );
  }
}
