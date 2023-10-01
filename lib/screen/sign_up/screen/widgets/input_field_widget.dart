import 'package:entrance_test/Utils/app_text_style.dart';
import 'package:entrance_test/Utils/device_dimension.dart';
import 'package:flutter/material.dart';

class InputFieldWidget extends StatefulWidget {
  const InputFieldWidget(
      {Key? key,
      required this.controller,
      required this.onTextChange,
      this.onValidationText,
      this.secureText = false,
      required this.hintText})
      : super(key: key);
  final TextEditingController controller;
  final Function(String value) onTextChange;
  final String? Function(String? value)? onValidationText;
  final bool secureText;
  final String hintText;

  @override
  State<InputFieldWidget> createState() => _InputFieldWidgetState();
}

class _InputFieldWidgetState extends State<InputFieldWidget> {
  late bool isShowText = false;

  @override
  void initState() {
    isShowText = widget.secureText;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: TextFormField(
        obscureText: isShowText,
        validator: widget.onValidationText,
        cursorColor: const Color(0xFF647FFF),
        style: AppTextStyle.bodyLarge,
        decoration: InputDecoration(
            labelStyle: AppTextStyle.bodySmall
                .copyWith(color: Colors.white.withOpacity(0.5)),
            labelText: widget.hintText,
            focusedBorder: const UnderlineInputBorder(
                borderSide: BorderSide(color: Color(0xFF647FFF))),
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
