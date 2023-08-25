import 'package:flutter/material.dart';

class XiDengLogo extends StatelessWidget {
  const XiDengLogo({Key? key, this.width, this.height}) : super(key: key);
  final double? width;
  final double? height;
  @override
  Widget build(BuildContext context) {
    return Image(
      image: const AssetImage('res/images/xd_logo_02.png'),
      height: height,
      width: width,
    );
  }
}
