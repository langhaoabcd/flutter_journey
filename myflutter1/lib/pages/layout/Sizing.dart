import 'package:flutter/material.dart';

class Sizing extends StatelessWidget {
  const Sizing({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text("Sizing Page")),
        body: ListView(children: [
          Text("1.超出屏幕"),
          buildOverflowingRow(),
          Text("2.控制超出"),
          buildExpandedImages(),
          Text("3.增加flex属性"),
          buildExpandedImagesWithFlex(),
        ]));
  }

  //溢出屏幕会出现黄黑线
  buildOverflowingRow() {
    return Row(mainAxisAlignment: MainAxisAlignment.center, children: [
      Image.asset('res/images/pic1.jpg'),
      Image.asset('res/images/pic2.jpg'),
      Image.asset('res/images/pic3.jpg'),
    ]);
  }

  buildExpandedImages() {
    return Row(mainAxisAlignment: MainAxisAlignment.center, children: [
      Expanded(
        child: Image.asset('res/images/pic1.jpg'),
      ),
      Expanded(child: Image.asset('res/images/pic2.jpg')),
      Expanded(child: Image.asset('res/images/pic3.jpg')),
    ]);
  }

  buildExpandedImagesWithFlex() {
    return Row(mainAxisAlignment: MainAxisAlignment.center, children: [
      Expanded(
        child: Image.asset('res/images/pic1.jpg'),
      ),
      Expanded(flex: 2, child: Image.asset('res/images/pic2.jpg')),
      Expanded(child: Image.asset('res/images/pic3.jpg')),
    ]);
  }
}
