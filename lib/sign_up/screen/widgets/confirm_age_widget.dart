import 'package:flutter/material.dart';

import '../../../Utils/app_text_style.dart';

class ConfirmAgeWidget extends StatefulWidget {
  const ConfirmAgeWidget({Key? key, this.onChanged}) : super(key: key);
  final ValueChanged<bool?>? onChanged;

  @override
  State<ConfirmAgeWidget> createState() => _ConfirmAgeWidgetState();
}

class _ConfirmAgeWidgetState extends State<ConfirmAgeWidget> {
  bool isSelected = false;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        GestureDetector(
          onTap: () {
            setState(() {
              isSelected = !isSelected;
            });
          },
          child: Container(
            alignment: Alignment.center,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(2.0),
                border: Border.all(color: const Color(0xFF647FFF))),
            child: isSelected ? const Icon(Icons.check, color: Colors.white,) : const Icon(Icons.check,),
          ),
        ),
        const SizedBox(width: 10,),
        Text(
          'I am over 16 years of age',
          style: AppTextStyle.bodyMedium,
        ),
      ],
    );
  }

  OutlinedBorder shapeBorder() {
    return RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(5),
    );
  }
}
