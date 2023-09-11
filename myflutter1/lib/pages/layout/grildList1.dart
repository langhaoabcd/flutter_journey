import 'dart:math';

import 'package:flutter/material.dart';

class GrildList1 extends StatelessWidget {
  const GrildList1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Grid List"),
      ),
      body: ListView(
        children: [
          Container(
            key: const ValueKey("1"),
            height: 200,
            margin: const EdgeInsets.symmetric(vertical: 20),
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                Container(
                  width: 160,
                  color: Colors.red,
                ),
                Container(
                  width: 160,
                  color: Colors.blue,
                ),
                Container(
                  width: 160,
                  color: Colors.green,
                ),
                Container(
                  width: 160,
                  color: Colors.yellow,
                ),
                Container(
                  width: 160,
                  color: Colors.orange,
                ),
              ],
            ),
          ),
          Container(
              key: const ValueKey("2"),
              height: 400,
              margin: const EdgeInsets.symmetric(vertical: 20),
              child:
                  // GridView.count(
                  //   crossAxisCount: 2,
                  //   children: List.generate(10, (index) {
                  //     return Center(
                  //       child: Container(
                  //         child: Text(
                  //           'Item $index',
                  //           style: Theme.of(context).textTheme.headlineSmall,
                  //         ),
                  //       ),
                  //     );
                  //   })))
                  GridView.builder(
                      itemCount: 10,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2, childAspectRatio: 1.0),
                      itemBuilder: (context, index) {
                        return Container(
                          color:
                              Color((Random().nextDouble() * 0xFFFFFF).toInt())
                                  .withOpacity(1.0),
                          child: Center(
                            child: Text('Item $index'),
                          ),
                        );
                      }))
        ],
      ),
    );
  }
}
