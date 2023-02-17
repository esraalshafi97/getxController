import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:getx_controller/app/modules/home/controllers/weight_picker_controller.dart';
import 'package:getx_controller/app/modules/home/views/widgets/weight_picker.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  WeightPickerController _curretnWeightPickerController=WeightPickerController();
  WeightPickerController _targetWeightPickerController=WeightPickerController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('HomeView'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'كم وزنك الحالي؟',
                  textDirection: TextDirection.rtl,
                  style: Get.textTheme.headlineMedium!.copyWith(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: GetBuilder<WeightPickerController>(
                init: _curretnWeightPickerController,
                initState: (state) {
                  ///ToDo:
                  _curretnWeightPickerController.updateSelectedWeight( 100.0);
                },
                builder: (controller) {
                  return WeightPicker(
                    controller: controller,
                  );
                }),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'الوزن المستهدف؟',
                  textDirection: TextDirection.rtl,
                  style: Get.textTheme.headlineMedium!.copyWith(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: GetBuilder<WeightPickerController>(
                init: _targetWeightPickerController,
                initState: (state) {
                  ///ToDo:
                  _targetWeightPickerController.updateSelectedWeight(100.0);

                  // targetWeightController.onInit();
                },

                builder: (controller) {
                  return WeightPicker(
                    controller:  controller,
                  );
                }),
          ),
        ],
      )
    );
  }
}
