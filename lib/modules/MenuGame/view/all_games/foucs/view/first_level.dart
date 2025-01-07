import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:graduationproject/modules/MenuGame/view/all_games/foucs/controller/foucs_controller.dart';
import 'package:graduationproject/modules/MenuGame/view/all_games/foucs/view/second_level.dart';

import '../../../../Menu_game.dart';

class FirstLevelFoucs extends GetView<FoucsController> {
  const FirstLevelFoucs({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey[100],
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          InkWell(
            onTap: () => Get.back(),
            child: const Align(
              alignment: Alignment.topLeft,
              child: Padding(
                padding: EdgeInsets.all(8.0),
                child: Icon(Icons.arrow_back_ios, size: 20, color: Colors.grey),
              ),
            ),
          ),
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  height: 35,
                  width: 120,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: const Color.fromARGB(255, 240, 145, 211),
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
                      const Text(' : Timer',
                          style: TextStyle(
                              color: Color.fromARGB(255, 233, 227, 227)))
                    ],
                  ),
                ),
              ),
              Obx(() => Text(
                    'النتيجه :${controller.score.value}',
                    style: const TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                        fontFamily: "Pacifico",
                        color: Colors.blueGrey,
                        decoration: TextDecoration.none),
                  )),
            ],
          ),
          Obx(() => Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Center(
                      child: Text(
                        controller.word1Level[controller.indexLevel.value - 1],
                        style: const TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                            color: Color.fromARGB(255, 117, 115, 115)),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(10, 10, 8, 8),
                    child: SizedBox(
                        width: 900,
                        height: 250,
                        child: Image.asset(controller
                            .image1Level[controller.indexLevel.value - 1])),
                  ),
                ],
              )),
          Obx(() => Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: controller.answer1Level[controller.indexLevel.value - 1]
                  .map((e) => ShapeAnswer(e))
                  .toList())),
          const SizedBox(),
        ],
      ),
    );
  }

  Widget ShapeAnswer(String value) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(8, 8, 8, 8),
      child: SizedBox(
        width: 100,
        height: 50,
        child: ElevatedButton(
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(
                  const Color.fromARGB(255, 240, 145, 211)),
            ),
            onPressed: () async {
              if (controller.time.value.toString() != '00:01') {
                if (value ==
                    controller.right1Answer[controller.indexLevel.value - 1]) {
                  controller.score.value = controller.score.value + 1;
                  print(controller.score.value);
                }

                if (controller.indexLevel.value < 4) {
                  await controller.saveScore(controller.score.value, 1);
                  controller.indexLevel.value = controller.indexLevel.value + 1;
                  if (controller.indexLevel.value == 4) {
                    controller.indexLevel.value = 1;

                    Get.to(const SecondLevelFoucs());
                  }
                }
              } else {
                Result('T');
              }
            },
            child: Text(value,
                style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.white))),
      ),
    );
  }

  Future Result(String txt) {
    return Get.dialog(
      Align(
          alignment: Alignment.center,
          child: Container(
              width: 400,
              height: 70,
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(12)),
              child: txt == 'T'
                  ? Column(
                      children: [
                        const Text(
                          'Time Off Do You Want To contunie ? ',
                          style: TextStyle(
                              fontSize: 20,
                              decoration: TextDecoration.none,
                              color: Color.fromARGB(255, 233, 82, 208)),
                        ),
                        Row(
                          children: [
                            const SizedBox(
                              width: 40,
                            ),
                            TextButton(
                                onPressed: () {
                                  Get.back();
                                },
                                child: const Text('yes',
                                    style: TextStyle(color: Colors.grey))),
                            TextButton(
                                onPressed: () {
                                  Get.to(MenuGamePageView());
                                  controller.onClose();
                                },
                                child: const Text('No',
                                    style: TextStyle(color: Colors.grey))),
                          ],
                        ),
                      ],
                    )
                  : Column(
                      children: [
                        const Text(
                          'Error Value Do You Want Retry ?',
                          style: TextStyle(
                              fontSize: 20,
                              decoration: TextDecoration.none,
                              color: Color.fromARGB(255, 233, 82, 208)),
                        ),
                        Row(
                          children: [
                            const SizedBox(
                              width: 40,
                            ),
                            TextButton(
                                onPressed: () {
                                  Get.back();
                                  controller.onReady();
                                },
                                child: const Text('yes',
                                    style: TextStyle(
                                        color: Color.fromARGB(
                                            255, 80, 137, 212)))),
                            TextButton(
                                onPressed: () {
                                  Get.to(MenuGamePageView());
                                  controller.onClose();
                                },
                                child: const Text('No',
                                    style: TextStyle(
                                        color: Color.fromARGB(
                                            255, 80, 137, 212)))),
                          ],
                        ),
                      ],
                    ))),
    );
  }
}
