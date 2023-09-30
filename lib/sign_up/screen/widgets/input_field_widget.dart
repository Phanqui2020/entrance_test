import 'package:entrance_test/Utils/app_text_style.dart';
import 'package:entrance_test/Utils/device_dimension.dart';
import 'package:flutter/material.dart';

class InputFieldWidget extends StatefulWidget {
  const InputFieldWidget(
      {Key? key,
      required this.controller,
      required this.onTextChange,
      required this.onValidationText,
      required this.secureText})
      : super(key: key);
  final TextEditingController controller;
  final Function(String value) onTextChange;
  final Function(String value) onValidationText;
  final bool secureText;

  @override
  State<InputFieldWidget> createState() => _InputFieldWidgetState();
}

class _InputFieldWidgetState extends State<InputFieldWidget> {
  bool isShowText = false;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: TextField(
        cursorColor: const Color(0xFF647FFF),
        style: AppTextStyle.bodyLarge,
        decoration: InputDecoration(
          focusedBorder: const UnderlineInputBorder(
            borderSide: BorderSide(color: Color(0xFF647FFF))
          ),
            suffixIcon: widget.secureText
                ? IconButton(
                    icon: isShowText
                        ? const Icon(Icons.remove_red_eye_outlined)
                        : const Icon(Icons.remove_red_eye_rounded),
                    onPressed: () {
                      setState(() {
                        isShowText = !isShowText;
                      });
                    },
                  )
                : null),
        controller: widget.controller,
      ),
    );
  }
}
