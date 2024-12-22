import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:graduationproject/modules/MenuGame/Menu_game.dart';

import '../controller/foucs_controller.dart';
import 'foucs3.dart';

class FoucsGameView1 extends GetResponsiveView<FoucsController> {
  FoucsGameView1({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: SizedBox(
        height: 700,
        child: Column(
          children: [
            const SizedBox(
              width: 100,
            ),
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
            Text(
              'النتيجه :${controller.score}',
              style: const TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                  fontFamily: "Pacifico",
                  color: Colors.blueGrey,
                  decoration: TextDecoration.none),
            ),
            const SizedBox(
              height: 20,
            ),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Center(
                child: Text('  How Number The SquareIn This Photo ?',
                    style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                        color: Color.fromARGB(255, 117, 115, 115))),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(10, 10, 8, 8),
              child: Container(
                  width: 500,
                  height: 250,
                  color: Colors.white,
                  child: Image.asset('assets/images/20.png')),
            ),
            const SizedBox(
              height: 30,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ShapeAnswer('7'),
                ShapeAnswer('8'),
                ShapeAnswer('9'),
              ],
            )
          ],
        ),
      ),
    ));
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
            onPressed: () {
              if (controller.time.value.toString() != '00:01') {
                if (value == '8') {
                  controller.score.value += 10;
                  Get.to(FoucsGameView3());
                } else {
                  Get.to(FoucsGameView3());
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
                  color: Colors.white, borderRadius: BorderRadius.circular(10)),
              child: txt == 'T'
                  ? Column(
                      children: [
                        const Text(
                          'Time Off Do You Want To contuine ? ',
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
                                  controller.onReady();
                                  Get.to(FoucsGameView3());
                                },
                                child: const Text('yes',
                                    style: TextStyle(color: Colors.grey))),
                            TextButton(
                                onPressed: () {
                                  var guser = controller.auth
                                      .getGameUser()!
                                      .where((element) => element.IdGame == 4)
                                      .first;
                                  guser.Score = controller.score.value;
                                  controller.auth.updateUserGame(guser);
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
                                  Get.to(FoucsGameView3());
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
