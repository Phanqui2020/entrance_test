import 'package:entrance_test/Utils/app_text_style.dart';
import 'package:entrance_test/screen/categories/model/categories_response_model.dart';
import 'package:flutter/material.dart';

class CategoryItemWidget extends StatelessWidget {
  CategoryItemWidget({Key? key, required this.model, this.onItemClick})
      : super(key: key);
  CategoriesResponseModel model;
  final Function()? onItemClick;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onItemClick,
      child: Container(
        alignment: Alignment.center,
        decoration: BoxDecoration(
          gradient: model.isSelected ?
              const LinearGradient(
                begin: Alignment.bottomLeft,
                end: Alignment.topRight,
                colors: [
                  Color(0xFF8A32A9),
                  Color(0xFF8A00FF),
                ],
              ): null,
          border: Border.all(color: Colors.white.withOpacity(0.12)),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Text(model.name!, style: AppTextStyle.bodyMedium,),
      ),
    );
  }
}
