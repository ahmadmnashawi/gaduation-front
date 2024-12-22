import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../Menu_game.dart';
import '../controller/math_controller.dart';
import 'math9.dart';

class MathNew8PageView extends GetResponsiveView<MathController> {
  MathController controller=Get.put(MathController());
  MathNew8PageView({super.key});

  @override
  Widget builder() {
    return SingleChildScrollView(
      child: Container(
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
                        const Text(' الوقت',
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
            Text(
              'النتيجه :${controller.score3}',
              style: const TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                  fontFamily: "Pacifico",
                  color: Colors.blueGrey,
                  decoration: TextDecoration.none),
            ),
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
                child: Column(
                  children: [
                    Text("توفي رجل وترك لأولاده الثلاثة 17 جمل نصفهم الأول ",
                        style: TextStyle(
                            color: Colors.black54,
                            fontSize: 23,
                            decoration: TextDecoration.none)),
                    Text("وثلثهم الثاني وتسعهم للثالث ، فكيف",
                        style: TextStyle(
                            color: Colors.black54,
                            fontSize: 23,
                            decoration: TextDecoration.none)),
                    Text(" يتم تقسيم الجمال بين الأولاد ؟",
                        style: TextStyle(
                            color: Colors.black54,
                            fontSize: 23,
                            decoration: TextDecoration.none)),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            ShapeAnswer("الاول 6,الثاني 2,الثالث 9"),
            ShapeAnswer("الاول 2, الثاني 9, الثالث 6"),
            ShapeAnswer("الاول 9,الثاني 6,الثالث 2"),
          ],
        ),
      ),
    );
  }

  Widget ShapeAnswer(String value) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(8, 8, 8, 8),
      child: SizedBox(
        width: 240,
        height: 70,
        child: ElevatedButton(
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(
                  const Color.fromARGB(255, 246, 123, 127)),
            ),
            onPressed: () {
              if (controller.time.value.toString() != '00:01') {
                if (value == "الاول 9,الثاني 6,الثالث 2") {
                  controller.score3.value += 10;
                  correct();
                } else {
                 Get.to(MathNew9PageView());
                }
              } else {
                Result('T');
              }
            },
            child: Center(
              child: Text(value,
                  style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.white)),
            )),
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
              height: 70,
              child: txt == 'T'
                  ? Column(
                      children: [
                        const Text(
                          'Time Off Do You Want To Contuine ? ',
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
                                 
                                  controller.onReady();
                                   Get.to(MathNew9PageView());
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
                    )
                  : Column(
                      children: [
                        const Text(
                          'Error Value Do You Want Retry ?',
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
                                  Get.back();
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

  Future correct() {
    return Get.dialog(Align(
      alignment: Alignment.center,
      child: Container(
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: Colors.blueGrey)),
        width: 400,
        height: 100,
        child: Column(children: [
          const Text(
            'هل تريد الانتقال للمرحله التاليه؟',
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
                    Get.to(MathNew9PageView());
                    controller.onReady();
                  },
                  child: const Text('نعم',
                      style: TextStyle(color: Colors.blueGrey))),
              TextButton(
                  onPressed: () {
                    Get.to(MenuGamePageView());
                    controller.onClose();
                  },
                  child: const Text('لا',
                      style: TextStyle(color: Colors.blueGrey))),
            ],
          ),
        ]),
      ),
    ));
  }
}
