import 'package:entrance_test/Utils/app_text_style.dart';
import 'package:entrance_test/Utils/device_dimension.dart';
import 'package:entrance_test/screen/categories/controller/categories_controller.dart';
import 'package:entrance_test/screen/categories/page/widget/category_item_widget.dart';
import 'package:entrance_test/widget/enable_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CategoriesScreen extends StatefulWidget {
  const CategoriesScreen({Key? key}) : super(key: key);

  @override
  State<CategoriesScreen> createState() => _CategoriesScreenState();
}

class _CategoriesScreenState extends State<CategoriesScreen> {
  late final CategoriesController _controller;

  @override
  void initState() {
    _controller = Get.put(CategoriesController());
    _controller.getCategories();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white),
        forceMaterialTransparency: true,
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Obx(
              () => EnableWidget(
                enable: _controller.isEnableNextScene.value,
                child: GestureDetector(
                  onTap: () async => await _controller.saveCategories(),
                  child: Text(
                    "Done",
                    style: AppTextStyle.bodyMedium,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
      body:
      Stack(
        children: [
          const SizedBox(
            width: double.infinity,
            height: double.infinity,
            child: Image(image: AssetImage('assets/images/background.jpeg'), fit: BoxFit.cover),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: DeviceDimension.screenHeight*0.7,
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Color(0x1D0C0B0B),
                    Colors.black,
                    Colors.black,
                    Colors.black,
                  ],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
              ),
              child: Column(
                children: [
                  Container(
                    height: DeviceDimension.screenHeight*0.7,
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Welcome to Flutter Test!",
                          style: AppTextStyle.titleLarge,
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                          "Please select categories what you would like to see on your feed. You can set this later on Filter.",
                          style: AppTextStyle.bodyMedium,
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        GetBuilder<CategoriesController>(
                          builder: (controller) {
                            return Expanded(
                              child: GridView.count(
                                padding: const EdgeInsets.only(top: 0),
                                crossAxisCount: 3,
                                children: List.generate(
                                  controller.listCategory.length,
                                      (index) => Padding(
                                    padding: const EdgeInsets.all(3.0),
                                    child: CategoryItemWidget(
                                        onItemClick: () {
                                          controller.onItemClick(index: index);
                                        },
                                        model: controller.listCategory[index]),
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
