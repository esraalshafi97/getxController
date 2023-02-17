import 'package:flutter/material.dart';
import 'package:get/get.dart';


class WeightPickerController extends  GetxController {
 RxDouble? selectedWeight ;
 RxInt? selectedWeightKilosIndex ;
 RxInt? selectedWeightGramsIndex;

final int lowestWeight = 25;
final int highestWeight = 400;

int? leftPickerItemCount;

final int rightPickerItemCount = 10;

 late FixedExtentScrollController leftScrollController ;

 late FixedExtentScrollController rightScrollController;

@override
void onInit() {
// TODO: implement onInit
  super.onInit();
   leftPickerItemCount = highestWeight - lowestWeight + 1;
   leftScrollController =
  FixedExtentScrollController(
      initialItem: lowestWeight);
  rightScrollController =
      FixedExtentScrollController(
          initialItem: 000);

}

void updateCurrentWeight() {
  selectedWeight!.value =
      (highestWeight - selectedWeightKilosIndex!.value) +
          (1 - (selectedWeightGramsIndex!.value / 10)) -
          1;
  update();
}

void updateSelectedWeight(double selectedWeightValue) {
  selectedWeight = selectedWeightValue.obs ;
  selectedWeightGramsIndex=0.obs;
  selectedWeightKilosIndex =
      (highestWeight - selectedWeightValue).toInt().obs;
  update();

  print('current gram: ${ selectedWeight!.value}');
}
}