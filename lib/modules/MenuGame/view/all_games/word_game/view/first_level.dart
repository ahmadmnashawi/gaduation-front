import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:graduationproject/modules/MenuGame/view/all_games/word_game/controller/word_controller.dart';

import '../../../../../menu/view/HomePage.dart';
import '../../../../Menu_game.dart';
import 'second_level.dart';

class FirstLevelWord extends GetView<SplashScreencontroller> {
  const FirstLevelWord({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: context.height,
        color: Colors.primaries[Random().nextInt(Colors.primaries.length)],
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                InkWell(
                  onTap: () {
                    Get.to(HomePage());
                  },
                  child: const Align(
                    alignment: Alignment.topLeft,
                    child: Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Icon(Icons.arrow_back_ios,
                          size: 20, color: Colors.grey),
                    ),
                  ),
                ),
                Row(
                  children: [
                    const SizedBox(width: 90),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        width: 120,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: const Color.fromARGB(255, 7, 29, 67),
                        ),
                        child: Row(
                          children: [
                            Obx(() => Center(
                                  child: Text(
                                    '  ${controller.emptyList.length}',
                                    style: const TextStyle(
                                      color: Colors.white,
                                    ),
                                  ),
                                )),
                            const Text(' : Correct',
                                style: TextStyle(color: Colors.white))
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        width: 120,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: const Color.fromARGB(255, 7, 29, 67),
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
                  ],
                ),
                const Text(
                  'Gusses The Word Accouring To Photo',
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(8),
              child: Container(
                  height: context.height / 4,
                  width: context.width / 4,
                  color: Colors.white,
                  child: Obx(() => Image.asset(controller
                      .image1Level[controller.indexLevel.value - 1]))),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 15),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const SizedBox(),
                      Obx(() => Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              controller.allWord.join(),
                              style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold),
                            ),
                          )),
                      Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.fromLTRB(8, 15, 8, 8),
                            child: Center(
                              child: Center(
                                child: ElevatedButton(
                                    style: ButtonStyle(
                                      backgroundColor:
                                          MaterialStateProperty.all(
                                              Color.fromARGB(255, 7, 29, 67)),
                                    ),
                                    onPressed: () {
                                      if (controller.time.value.toString() !=
                                          '00:01') {
                                        var singleWord =
                                            controller.allWord.join();
                                        print(controller
                                            .word1Level[
                                                controller.indexLevel.value - 1]
                                            .first);
                                        if (controller.word1Level[controller
                                                        .indexLevel.value -
                                                    1]
                                                .contains(singleWord) &&
                                            !controller.emptyList
                                                .contains(singleWord)) {
                                          controller.emptyList.add(singleWord);
                                          if (controller
                                                  .word1Level[controller
                                                          .indexLevel.value -
                                                      1]
                                                  .length ==
                                              controller.emptyList.length) {
                                            dialog(
                                                'Congratulations, You Win This Level\nDo You Want To Go To Next Level',
                                                () async {
                                              Get.back();
                                              if (controller.indexLevel.value <
                                                  4) {
                                                print(controller
                                                        .indexLevel.value +
                                                    1);
                                                await controller.saveScore(
                                                    controller.indexLevel.value,
                                                    1);
                                                controller.indexLevel.value =
                                                    controller
                                                            .indexLevel.value +
                                                        1;
                                                controller.initLetter();
                                                if (controller
                                                        .indexLevel.value ==
                                                    4) {
                                                  controller.indexLevel.value =
                                                      1;
                                                  controller.initLetter();
                                                  controller.score.value +=
                                                      controller
                                                          .word1Level[controller
                                                                  .indexLevel
                                                                  .value -
                                                              1]
                                                          .length;
                                                  Get.to(SecondLevelWord());
                                                }
                                              }
                                            }, () {
                                              Get.to(MenuGamePageView());
                                              controller.onClose();
                                            });
                                          }
                                          controller.allWord.clear();
                                        } else {
                                          dialog('Error Word Try Again Please',
                                              () {
                                            Get.back();
                                          }, () {
                                            Get.to(MenuGamePageView());
                                          });
                                          controller.allWord.clear();
                                        }
                                      } else {
                                        //time off
                                        dialog(
                                            'Time Off Do You Want To countinue ? ',
                                            () {
                                          Get.back();
                                          controller.initLetter();
                                        }, () {
                                          Get.to(MenuGamePageView());
                                          controller.onClose();
                                        });
                                        controller.allWord.clear();
                                      }
                                    },
                                    child: const Text('Ok',
                                        style: TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.white))),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(8, 15, 8, 8),
                            child: Center(
                              child: ElevatedButton(
                                  style: ButtonStyle(
                                    backgroundColor: MaterialStateProperty.all(
                                        Color.fromARGB(255, 7, 29, 67)),
                                  ),
                                  onPressed: () {
                                    controller.allWord
                                        .remove(controller.allWord.last);
                                  },
                                  child: const Icon(Icons.backspace_outlined,
                                      size: 25, color: Colors.white)),
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                  Wrap(
                      children: controller.letters
                          .map((e) => letterShape(e))
                          .toList()),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget letterShape(String letter) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(8, 8, 8, 8),
      child: ElevatedButton(
          style: ButtonStyle(
            backgroundColor:
                MaterialStateProperty.all(Color.fromARGB(255, 123, 160, 222)),
          ),
          onPressed: () {
            controller.allWord.add(letter);
          },
          child: Text(letter,
              style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.white))),
    );
  }

  Future dialog(String txt, VoidCallback? onYes, VoidCallback? onNo) {
    return Get.dialog(Align(
      alignment: Alignment.center,
      child: Container(
        width: 500,
        height: 90,
        color: Colors.white,
        child: Column(
          children: [
            Center(
              child: Text(
                txt,
                style: const TextStyle(
                    fontSize: 20,
                    decoration: TextDecoration.none,
                    color: Color.fromARGB(255, 123, 160, 222)),
              ),
            ),
            TextButton(
                onPressed: onYes!,
                child: const Text('yes',
                    style: TextStyle(color: Color.fromARGB(255, 7, 29, 67)))),
            TextButton(
                onPressed: onNo!,
                child: const Text('No',
                    style: TextStyle(color: Color.fromARGB(255, 7, 29, 67))))
          ],
        ),
      ),
    ));
  }
}
