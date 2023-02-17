import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter/services.dart';
import 'package:getx_controller/app/modules/home/controllers/weight_picker_controller.dart';


class WeightPicker extends StatelessWidget {


  final WeightPickerController controller;


  WeightPicker({
    Key? key,
    required this.controller,
  }) : super(key: key) {
    // Update Selected Weight
  // controller.updateCurrentWeight();
  }

  @override
  Widget build(BuildContext context) {

    return Row(
      children: [
        Expanded(
          child: Stack(
            children: [
              Positioned.fill(
                left: 20,
                child: ListWheelScrollView.useDelegate(
                  itemExtent: 20,
                  perspective: 0.00000001,
                  controller: controller.leftScrollController,
                  physics: const FixedExtentScrollPhysics(),
                  onSelectedItemChanged: (index) {
                    controller.selectedWeightKilosIndex!.value = index;
                    // Update Selected Weight
                    controller.updateCurrentWeight();
                 //   print(controller.selectedWeight.value);
                  },
                  childDelegate: ListWheelChildLoopingListDelegate(
                    children: List.generate(
                     controller.leftPickerItemCount!,
                          (index) {

                          return Row(
                            children: [
                              AnimatedContainer(
                                duration: const Duration(milliseconds: 100),
                                width: 60,
                                height: index ==
                                    controller
                                        .selectedWeightKilosIndex!.value
                                    ? 4
                                    : 3,
                                decoration: BoxDecoration(
                                  color: index ==
                                      controller
                                          .selectedWeightKilosIndex!.value
                                      ? Theme.of(context).colorScheme.primary
                                      : const Color.fromRGBO(
                                      217, 217, 217, 0.31),
                                ),
                              ),
                              const SizedBox(width: 8),
                              Text(
                                '${controller.highestWeight - index}',
                                style: Theme.of(context)
                                    .textTheme
                                    .headlineMedium!
                                    .copyWith(
                                  fontSize: 13,
                                  fontWeight: FontWeight.w900,
                                  color: (index ==
                                      controller
                                          .selectedWeightKilosIndex!
                                          .value ||
                                      index ==
                                          (controller.selectedWeightKilosIndex!
                                              .value -
                                              1) %
                                             controller.leftPickerItemCount! ||
                                      index ==
                                          (controller.selectedWeightKilosIndex!
                                              .value +
                                              1) %
                                              controller.leftPickerItemCount! )
                                      ? Colors.transparent
                                      : const Color.fromRGBO(
                                      217, 217, 217, 0.31),
                                ),
                              ),
                            ],
                          );

                      },
                    ),
                  ),
                ),
              ),
              Positioned.fill(
                left: Get.width * 0.22,
                top: -18,
                child: Center(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        'كيلو ',
                        textDirection: TextDirection.rtl,
                        style: Theme.of(context)
                            .textTheme
                            .headlineMedium!
                            .copyWith(
                          fontSize: 12,
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                      Container(
                        height: 50,
                        width: 80,
                        decoration: BoxDecoration(
                          color: Theme.of(context).colorScheme.primary,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Center(
                          child: Text(
                              '${controller.selectedWeight!.value.toInt()}',
                              style: Theme.of(context)
                                  .textTheme
                                  .headlineMedium!
                                  .copyWith(
                                fontWeight: FontWeight.w900,
                                fontSize: 25,
                              ),
                            )

                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        Directionality(
          textDirection: TextDirection.rtl,
          child: Expanded(
            child: Stack(
              children: [
                Positioned(
                  right: 20,
                  left: 0,
                  top: 0,
                  bottom: 0,
                  child: ListWheelScrollView.useDelegate(
                    itemExtent: 20,
                    perspective: 0.00000001,
                    controller: controller.rightScrollController,
                    physics: const FixedExtentScrollPhysics(),
                    onSelectedItemChanged: (index) {
                      controller.selectedWeightGramsIndex!.value = index;
                      // Update Selected Weight
                      controller.updateCurrentWeight();
                      print(controller.selectedWeight!.value);
                    },
                    childDelegate: ListWheelChildLoopingListDelegate(
                      children: List.generate(
                        controller.rightPickerItemCount,
                            (index) {

                            return Row(
                              children: [
                                AnimatedContainer(
                                  duration: const Duration(milliseconds: 100),
                                  width: 60,
                                  height: index ==
                                      controller
                                          .selectedWeightGramsIndex!.value
                                      ? 4
                                      : 3,
                                  decoration: BoxDecoration(
                                    color: index ==
                                        controller
                                            .selectedWeightGramsIndex!.value
                                        ? Theme.of(context).colorScheme.primary
                                        : const Color.fromRGBO(
                                        217, 217, 217, 0.31),
                                  ),
                                ),
                                const SizedBox(width: 8),
                                Text(
                                  index == 0 ? '0' : '${1000 - (index * 100)}',
                                  style: Theme.of(context)
                                      .textTheme
                                      .headlineMedium!
                                      .copyWith(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w900,
                                    color: (index ==
                                        controller
                                            .selectedWeightGramsIndex!
                                            .value ||
                                        index ==
                                            (controller.selectedWeightGramsIndex!
                                                .value -
                                                1) %
                                                controller.rightPickerItemCount ||
                                        index ==
                                            (controller.selectedWeightGramsIndex!
                                                .value +
                                                1) %
                                                controller.rightPickerItemCount)
                                        ? Colors.transparent
                                        : const Color.fromRGBO(
                                        217, 217, 217, 0.31),
                                  ),
                                ),
                              ],
                            );

                        },
                      ),
                    ),
                  ),
                ),
                Positioned(
                  left: 0,
                  right: Get.width * 0.22,
                  top: -18,
                  bottom: 0,
                  child: Center(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          'غرام ',
                          textDirection: TextDirection.rtl,
                          style: Theme.of(context)
                              .textTheme
                              .headlineMedium!
                              .copyWith(
                            fontSize: 12,
                            fontWeight: FontWeight.w900,
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            if (controller.rightScrollController.selectedItem != 0) {
                              controller.rightScrollController
                                  .animateToItem(
                                0,
                                duration: const Duration(milliseconds: 300),
                                curve: Curves.bounceIn,
                              )
                                  .then((value) => HapticFeedback.vibrate());
                            }
                          },
                          child: Container(
                            height: 50,
                            width: 80,
                            decoration: BoxDecoration(
                              color: Theme.of(context).colorScheme.primary,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Center(
                              child: Text(
                                  controller.selectedWeightGramsIndex!.value == 0
                                      ? '000'
                                      : '${1000 - (controller.selectedWeightGramsIndex!.value * 100)}',
                                  style: Theme.of(context)
                                      .textTheme
                                      .headlineMedium!
                                      .copyWith(
                                    fontWeight: FontWeight.w900,
                                    fontSize: 21,
                                  ),
                                )
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }


}
