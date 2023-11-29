import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:myfltter1/views/provider_cart/models/catalog_model.dart';
import 'package:provider/provider.dart';

import '../../states/CartState.dart';

class MyCatalog extends StatelessWidget {
  const MyCatalog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: CustomScrollView(
      slivers: [
        _MyAppBar(),
        const SliverToBoxAdapter(
          child: SizedBox(
            height: 12,
          ),
        ),
        SliverList(
            delegate: SliverChildBuilderDelegate(
                (context, index) => _MyListItem(index)))
      ],
    ));
  }
}

class _MyAppBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return SliverAppBar(
      title: const Text('Catalog'),
      floating: true,
      actions: [
        IconButton(
          iconSize: 20,
          icon: const Icon(Icons.add),
          onPressed: () => context.go("/catalog/cart"),
        )
      ],
    );
  }
}

class _MyListItem extends StatelessWidget {
  final int index;
  const _MyListItem(this.index);

  @override
  Widget build(BuildContext context) {
    var item = context.select<CatalogModel, Item>(
      (catalog) => catalog.getByPosition(index),
    );

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: LimitedBox(
        maxHeight: 48,
        child: Row(children: [
          AspectRatio(
            aspectRatio: 1,
            child: Container(
              color: item.color,
            ),
          ),
          const SizedBox(
            width: 24,
          ),
          Expanded(
              child: Text(
            item.name,
            style: TextStyle(fontSize: 18),
          )),
          const SizedBox(
            width: 24,
          ),
          _AddButtom(
            item: item,
          ),
        ]),
      ),
    );
  }
}

class _AddButtom extends StatelessWidget {
  final Item item;
  const _AddButtom({required this.item});

  @override
  Widget build(BuildContext context) {
    var isInCart =
        context.select<CartModel, bool>((cart) => cart.items.contains(item));
    print('select cart');
    print(isInCart);
    return TextButton(
        onPressed: isInCart
            ? null
            : () {
                var cart = context.read<CartModel>();
                cart.add(item);
                print('read cart');
                print(cart);
              },
        style: ButtonStyle(
            overlayColor: MaterialStateProperty.resolveWith((states) {
          return null;
        })),
        child: isInCart ? const Text("ADDED") : const Text("ADD"));
  }
}
