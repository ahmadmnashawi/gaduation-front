import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:graduationproject/modules/MenuGame/view/all_games/timer/controller/timer_controller.dart';

class TimerPageView extends GetResponsiveView<TimerController> {
  TimerPageView({super.key});
  @override
  Widget builder() {
    return Container(
      child: Row(children: [
        // const SizedBox(
        //   width: 180,
        // ),
        const SizedBox(
          width: 8,
        ),
        Container(
          height: 35,
          width: 120,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: const Color.fromARGB(255, 195, 95, 212),
          ),
          child: Row(
            children: [
              Obx(() => Center(
                    child: Text(
                      '  ${controller.time.value}',
                      style: const TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  )),
              const Text(' :Timer', style: TextStyle(color: Colors.white))
            ],
          ),
        ),
      ]),
    );
  }
}
