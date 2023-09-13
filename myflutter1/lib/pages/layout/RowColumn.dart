import 'package:flutter/material.dart';

class RowColumn extends StatelessWidget {
  const RowColumn({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text("Layout Row Column")),
        body: ListView(
          children: [
            const Text("Row widgets"),
            _buildRow(),
            const Text("Column widgets"),
            _buildColumn(),
          ],
        ));
  }

  _buildRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Expanded(
          child: Image.asset("res/images/pic1.jpg"),
        ),
        Expanded(
          child: Image.asset("res/images/pic2.jpg"),
        ),
        Expanded(
          child: Image.asset("res/images/pic3.jpg"),
        ),
      ],
    );
  }

  _buildColumn() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Image.asset("res/images/pic4.jpg"),
        Image.asset("res/images/pic3.jpg"),
        Image.asset("res/images/pic2.jpg"),
      ],
    );
  }
}
