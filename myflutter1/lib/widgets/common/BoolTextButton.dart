import 'package:flutter/material.dart';

class BoolTextButton extends StatelessWidget {
  const BoolTextButton({
    Key? key,
    required this.result,
    this.text = '取消',
  }) : super(key: key);

  final String text;
  final bool result;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        Navigator.of(context).pop(result);
      },
      child: Text(text),
    );
  }
}
