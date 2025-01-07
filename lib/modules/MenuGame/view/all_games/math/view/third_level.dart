import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../Menu_game.dart';
import '../controller/math_controller.dart';

class ThirdLevelMath extends GetView<MathController> {
  const ThirdLevelMath({super.key});
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          image: DecorationImage(
              image: const AssetImage(
                'assets/images/d.png',
              ),
              fit: BoxFit.cover,
              colorFilter: ColorFilter.mode(
                  Colors.white.withOpacity(0.25), BlendMode.modulate))),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                const SizedBox(
                  width: 180,
                ),
                Container(
                  height: 35,
                  width: 120,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: Colors.blueGrey,
                  ),
                  child: Row(
                    children: [
                      Obx(() => Center(
                            child: Text(
                              '  ${controller.time.value}',
                              style: const TextStyle(
                                  color: Colors.white,
                                  decoration: TextDecoration.none,
                                  fontSize: 18),
                            ),
                          )),
                      const Text(' الوقت ',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              decoration: TextDecoration.none))
                    ],
                  ),
                ),
              ],
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
          const SizedBox(
            height: 15,
          ),
          Container(
            decoration: BoxDecoration(
              border: Border.all(
                color: const Color.fromARGB(255, 246, 123, 127),
              ),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Obx(() => Text(
                    controller.word3Level[controller.indexLevel.value - 1],
                    style: const TextStyle(
                        color: Colors.black54,
                        fontSize: 30,
                        decoration: TextDecoration.none)))),
          ),
          const SizedBox(
            height: 30,
          ),
          Obx(() => Column(
                children: controller
                    .answer3Level[controller.indexLevel.value - 1]
                    .map((e) => shapeAnswer(e))
                    .toList(),
              ))
        ],
      ),
    );
  }

  Widget shapeAnswer(String value) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(8, 8, 8, 8),
      child: SizedBox(
        height: 45,
        child: ElevatedButton(
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(
                  const Color.fromARGB(255, 246, 123, 127)),
            ),
            onPressed: () async {
              if (controller.time.value.toString() != '00:01') {
                if (value ==
                    controller.right3Answer[controller.indexLevel.value - 1]) {
                  controller.score.value = controller.score.value + 1;
                  print(controller.score.value);
                }

                if (controller.indexLevel.value < 4) {
                  await controller.saveScore(controller.score.value, 3);
                  controller.indexLevel.value = controller.indexLevel.value + 1;
                  if (controller.indexLevel.value == 4) {
                    controller.indexLevel.value = 1;
                    Get.dialog(
                      Align(
                          alignment: Alignment.center,
                          child: Container(
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(12),
                                  border: Border.all(color: Colors.blueGrey)),
                              width: 400,
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Text(
                                    ' تهانينا لقد تجاوزت جميع المراحل والنتيجة ${controller.score.value}/9 \n اضغط نعم للعودة لواجهة الالعاب',
                                    style: const TextStyle(
                                        fontSize: 20,
                                        decoration: TextDecoration.none,
                                        color:
                                            Color.fromARGB(255, 246, 123, 127)),
                                  ),
                                  Row(
                                    children: [
                                      const SizedBox(
                                        width: 40,
                                      ),
                                      TextButton(
                                          onPressed: () {
                                            Get.back();
                                            controller.score.value = 0;
                                            Get.to(MenuGamePageView());
                                          },
                                          child: const Text('yes',
                                              style: TextStyle(
                                                  color: Colors.blueGrey))),
                                      TextButton(
                                          onPressed: () {
                                            Get.back();
                                          },
                                          child: const Text('No',
                                              style: TextStyle(
                                                  color: Colors.blueGrey))),
                                    ],
                                  ),
                                ],
                              ))),
                    );
                  }
                }
              } else {
                Result('T');
              }
            },
            child: Text(value,
                style: const TextStyle(
                    fontSize: 25,
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
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: Colors.blueGrey)),
              width: 400,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Text(
                    'Time Off Do You Want To contuine and restart the score? ',
                    style: TextStyle(
                        fontSize: 20,
                        decoration: TextDecoration.none,
                        color: Color.fromARGB(255, 246, 123, 127)),
                  ),
                  Row(
                    children: [
                      const SizedBox(
                        width: 40,
                      ),
                      TextButton(
                          onPressed: () {
                            // controller.score.value = 0;
                            controller.onReady();
                          },
                          child: const Text('yes',
                              style: TextStyle(color: Colors.blueGrey))),
                      TextButton(
                          onPressed: () {
                            Get.to(MenuGamePageView());
                            controller.onClose();
                          },
                          child: const Text('No',
                              style: TextStyle(color: Colors.blueGrey))),
                    ],
                  ),
                ],
              ))),
    );
  }
}
