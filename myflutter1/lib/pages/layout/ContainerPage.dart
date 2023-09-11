import 'package:flutter/material.dart';

class ContainerPage extends StatelessWidget {
  const ContainerPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Flutter layout Container1"),
      ),
      body: Center(
        child: _buildImageColumn(),
      ),
    );
  }

  Widget _buildImageColumn() {
    return Container(
      decoration: const BoxDecoration(
        color: Color.fromARGB(66, 193, 149, 149),
      ),
      child: Column(
        children: [
          _buildImgRow(1),
          _buildImgRow(3),
        ],
      ),
    );
  }

  Widget _buildImgRow(int i) => Row(
        children: [
          _buiDecoratedImage(i),
          _buiDecoratedImage(i + 1),
        ],
      );
}

_buiDecoratedImage(int i) => Expanded(
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(width: 10, color: Colors.green),
          borderRadius: const BorderRadius.all(Radius.circular(8)),
        ),
        margin: const EdgeInsets.all(4),
        child: Image.asset('res/images/pic$i.jpg'),
      ),
    );
