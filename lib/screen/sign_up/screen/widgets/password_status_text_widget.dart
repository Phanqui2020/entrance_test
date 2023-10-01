import 'package:flutter/material.dart';

class PasswordStatusTextWidget extends StatelessWidget {
  const PasswordStatusTextWidget({Key? key, required this.text, required this.textStyle}) : super(key: key);
  final String text;
  final TextStyle textStyle;

  @override
  Widget build(BuildContext context) {
    return Text(text, style: textStyle,);
  }
}
