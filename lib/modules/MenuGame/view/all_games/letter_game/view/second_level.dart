import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/letter_controller.dart';
import 'third_level.dart';

class SecondLevel extends GetView<LetterController> {
  const SecondLevel({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.amber[50],
      body: Container(
        height: Get.height,
        color: Colors.primaries[Random().nextInt(Colors.primaries.length)],
        child: Column(
          children: [
            InkWell(
              onTap: () => Get.back(),
              child: const Align(
                alignment: Alignment.topLeft,
                child: Padding(
                  padding: EdgeInsets.all(8.0),
                  child:
                      Icon(Icons.arrow_back_ios, size: 20, color: Colors.grey),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  const SizedBox(
                    width: 25,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      height: 35,
                      width: 120,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: const Color.fromARGB(255, 255, 238, 87)),
                      child: Row(
                        children: [
                          const Text('   الوقت :',
                              style: TextStyle(color: Colors.white)),
                          Obx(() => Center(
                                child: Text(
                                  '  ${controller.time.value}',
                                  style: const TextStyle(
                                    color: Colors.white,
                                  ),
                                ),
                              )),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      height: 35,
                      width: 120,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: const Color.fromARGB(255, 255, 238, 87)),
                      child: Row(
                        children: [
                          const Text('    المتبقي :',
                              style: TextStyle(color: Colors.white)),
                          Obx(() => Center(
                                child: Text(
                                  '  ${controller.wordLevel2[controller.game1Level.value - 1].skipWhile((item) => controller.empty.contains(item)).length}',
                                  style: const TextStyle(
                                    color: Colors.white,
                                  ),
                                ),
                              )),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      height: 35,
                      width: 120,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: const Color.fromARGB(255, 255, 238, 87)),
                      child: Row(
                        children: [
                          const Text('   الصحيح  :',
                              style: TextStyle(color: Colors.white)),
                          Obx(() => Center(
                                child: Text(
                                  '  ${controller.empty.length}',
                                  style: const TextStyle(
                                    color: Colors.white,
                                  ),
                                ),
                              )),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Text('المستوى الثاني'),
            const SizedBox(
              height: 30,
            ),
            Center(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    const SizedBox(
                      width: 100,
                    ),
                    IconButton(
                      onPressed: () {
                        if (controller.time.value.toString() != '00:01') {
                          var singleWord = controller.letters.join();
                          print(controller
                              .wordLevel2[controller.game1Level.value - 1]
                              .first);
                          if (controller
                                  .wordLevel2[controller.game1Level.value - 1]
                                  .contains(singleWord) &&
                              !controller.empty.contains(singleWord)) {
                            controller.empty.add(singleWord);
                            if (controller
                                    .wordLevel2[controller.game1Level.value - 1]
                                    .length ==
                                controller.empty.length) {
                              Result('G',
                                  'تهانينا اجتزت هذا المستوى هل تريد الانتقال للمستوى التالي؟');
                            }
                            controller.letters.clear();
                          } else {
                            dialog('خاطئة', Icons.close, Colors.red);
                            controller.letters.clear();
                          }
                        } else {
                          Result('T', 'انتهى الوقت هل تريد اعادة اللعبة');
                        }
                      },
                      icon: const Icon(
                        Icons.next_plan_sharp,
                        color: Colors.black54,
                        size: 40,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: IconButton(
                          onPressed: () {
                            controller.letters.remove(controller.letters.last);
                          },
                          icon: const Icon(
                            Icons.backspace_outlined,
                            color: Colors.black54,
                            size: 35,
                          )),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Obx(
                        () => Text(
                          '   ${controller.letters.join()}',
                          style: const TextStyle(
                              fontSize: 30,
                              fontWeight: FontWeight.bold,
                              color: Colors.black54),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 70,
            ),
            SizedBox(
              height: 250,
              child: Center(
                child: Obx(() => Column(
                      children: [
                        letterButton(controller
                            .letterLevel2[controller.game1Level.value - 1]
                            .first),
                        Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: controller
                                .letterLevel2[controller.game1Level.value - 1]
                                .skip(1)
                                .map((e) => letterButton(e))
                                .toList()),
                      ],
                    )),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                "قم  بانشاء  كلمة  من الحرو ف",
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
            )
          ],
        ),
      ),
    );
  }

  Future Result(String txt, String Word) {
    return Get.dialog(Align(
        alignment: Alignment.center,
        child: Container(
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: const Color.fromARGB(255, 240, 230, 230),
            border: Border.all(color: Colors.purple, width: 1),
            borderRadius: BorderRadius.circular(10),
          ),
          width: 400,
          height: 150,
          child: txt == 'T'
              ? Column(
                  children: [
                    Text(
                      Word,
                      style: const TextStyle(
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
                              controller.initLetter();
                            },
                            child: const Text('نعم',
                                style: TextStyle(color: Colors.grey))),
                      ],
                    ),
                  ],
                )
              : Column(
                  children: [
                    Text(
                      Word,
                      style: const TextStyle(
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
                            onPressed: () async {
                              Get.back();
                              if (controller.game1Level.value < 4) {
                                print(controller.game1Level.value + 1);
                                await controller.saveScore(
                                    controller.game1Level.value, 2);
                                controller.game1Level.value =
                                    controller.game1Level.value + 1;

                                controller.initLetter();
                                if (controller.game1Level.value == 4) {
                                  controller.game1Level.value = 1;

                                  controller.initLetter();

                                  Get.to(ThirdLevel());
                                }
                              }
                            },
                            child: const Text('نعم',
                                style: TextStyle(
                                    color: Color.fromARGB(255, 80, 137, 212)))),
                      ],
                    ),
                  ],
                ),
        )));
  }

  Future dialog(String text, IconData icon, Color color) {
    return Get.dialog(Center(
      child: Container(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: const Color.fromARGB(255, 240, 230, 230),
          border: Border.all(color: Colors.purple, width: 1),
          borderRadius: BorderRadius.circular(10),
        ),
        width: 150,
        height: 120,
        child: Row(
          children: [
            Icon(
              icon,
              color: color,
            ),
            Text(text,
                style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 30,
                    color: Colors.black54,
                    decoration: TextDecoration.none)),
          ],
        ),
      ),
    ));
  }

  Widget letterButton(String letter) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color.fromARGB(255, 223, 70, 197),
              shape: const CircleBorder(),
              padding: const EdgeInsets.all(28),
            ),
            onPressed: () {
              controller.letters.add(letter);
              print(controller.letters.toString());
            },
            child: Text(
              letter,
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
