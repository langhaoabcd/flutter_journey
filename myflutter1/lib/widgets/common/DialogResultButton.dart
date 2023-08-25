import 'package:flutter/material.dart';

class DialogResultButton extends StatelessWidget {
  const DialogResultButton(
      {Key? key, required this.result, this.text = '取消', this.onPressed})
      : super(key: key);
  final String text;
  final dynamic result;
  final VoidCallback? onPressed;
  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        onPressed?.call();
        Navigator.of(context).pop(result);
      },
      child: Text(text),
    );
  }
}
