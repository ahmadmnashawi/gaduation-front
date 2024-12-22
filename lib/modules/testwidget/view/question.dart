import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/test_controller.dart';

class QuestionPageView extends GetResponsiveView<TestController> {
  @override
  TestController controller = Get.put(TestController());

  QuestionPageView({super.key});

  @override
  Widget builder() {
    int number = 0;
    return SingleChildScrollView(
      child: Container(
        child: Column(
          children: [
            Material(
              child: InkWell(
                onTap: () => Get.back(),
                child: const Align(
                  alignment: Alignment.topLeft,
                  child: Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Icon(Icons.arrow_back_ios,
                        size: 20, color: Colors.grey),
                  ),
                ),
              ),
            ),
            // Text(controller.nowTest.value.content!.typeName.toString(),
            //     style: const TextStyle(
            //         fontSize: 30,
            //         fontWeight: FontWeight.bold,
            //         decoration: TextDecoration.none,
            //         color: Color.fromARGB(255, 42, 42, 114),
            //         fontFamily: "Pacifico")),
            // Column(
            //     children: controller.ListTestByContent.map((e) =>
            //             shapeQuestion(e.test!.test.toString(), e.answers!))
            //         .toList()),
            Column(
                children: controller.AllQustion.map((element) => shapeQuestion(
                    element.Qustion.toString(), element.AllChose)).toList()),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(
                onPressed: () {
                  controller.result.value = 0;
                  for (var element in controller.AllQustion) {
                    for (var element1 in controller.ListCorrectvalue) {
                      if (element.AllChose.contains(element1) ||
                          element.cor == element1) {
                        if (element.cor == element1) {
                          controller.result++;
                        }
                      }
                    }
                  }
                  Get.dialog(Align(
                    alignment: Alignment.center,
                    child: Container(
                      width: 250,
                      height: 370,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(color: Colors.blueAccent)),
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            const SizedBox(
                              height: 10,
                            ),
                            Align(
                                alignment: Alignment.center,
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    "Result".tr,
                                    style: const TextStyle(
                                        fontSize: 22,
                                        fontWeight: FontWeight.bold,
                                        fontFamily: "Pacifico",
                                        color: Color.fromARGB(255, 42, 42, 114),
                                        decoration: TextDecoration.none),
                                  ),
                                )),
                            Align(
                              alignment: Alignment.center,
                              child: Column(
                                children: [
                                  Align(
                                    alignment: Alignment.center,
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Row(
                                        children: [
                                          Text(
                                            "NumberQuestionIs".tr,
                                            style: const TextStyle(
                                                fontSize: 18,
                                                fontWeight: FontWeight.bold,
                                                color: Colors.black54,
                                                decoration:
                                                    TextDecoration.none),
                                          ),
                                          Text(
                                            controller.numberQustion.toString(),
                                            style: const TextStyle(
                                                fontSize: 18,
                                                fontWeight: FontWeight.bold,
                                                color: Color.fromARGB(
                                                    255, 246, 123, 127),
                                                decoration:
                                                    TextDecoration.none),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  Align(
                                    alignment: Alignment.center,
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Row(
                                        children: [
                                          Text(
                                            "CorrectValueIs".tr,
                                            style: const TextStyle(
                                                fontSize: 18,
                                                fontWeight: FontWeight.bold,
                                                color: Colors.black54,
                                                decoration:
                                                    TextDecoration.none),
                                          ),
                                          Text(
                                            controller.result.toString(),
                                            style: const TextStyle(
                                                fontSize: 18,
                                                fontWeight: FontWeight.bold,
                                                color: Color.fromARGB(
                                                    255, 246, 123, 127),
                                                decoration:
                                                    TextDecoration.none),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  //  Align(
                                  //     alignment: Alignment.center,
                                  //     child: Padding(
                                  //       padding: EdgeInsets.all(8.0),
                                  //       child: Text(
                                  //         "TheCorrectAnswer".tr,
                                  //         style: TextStyle(
                                  //             fontSize: 22,
                                  //             fontWeight: FontWeight.bold,
                                  //             fontFamily: "Pacifico",
                                  //             color: Color.fromARGB(
                                  //                 255, 42, 42, 114),
                                  //             decoration: TextDecoration.none),
                                  //       ),
                                  //     )),
                                  // Column(
                                  //   children: controller.ListCorrectvalue.map(
                                  //       (element) => Padding(
                                  //             padding: const EdgeInsets.all(6),
                                  //             child: Text(
                                  //               element.toString(),
                                  //               style: const TextStyle(
                                  //                   fontSize: 20,
                                  //                   fontWeight: FontWeight.bold,
                                  //                   color: Colors.black54,
                                  //                   decoration:
                                  //                       TextDecoration.none),
                                  //             ),
                                  //           )).toList(),
                                  // )
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ));
                },
                style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30)),
                    padding: const EdgeInsets.symmetric(
                        vertical: 20, horizontal: 50)),
                child: Text(
                  'Result'.tr,
                  style: const TextStyle(fontSize: 20, color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget shapeQuestion(String q, List<String> chose) {
    final selectedvaluedata = ''.obs;
    return Padding(
      padding: const EdgeInsets.all(6),
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: Colors.grey),
          borderRadius: BorderRadius.circular(15),
        ),
        child: Padding(
          padding: const EdgeInsets.all(6),
          child: Column(children: [
            Align(
              alignment: Alignment.topLeft,
              child: Padding(
                padding: const EdgeInsets.all(5),
                child: Text(q,
                    style: const TextStyle(
                      fontSize: 23,
                      fontWeight: FontWeight.bold,
                      decoration: TextDecoration.none,
                      color: Colors.black54,
                    )),
              ),
            ),
            Column(
                children: chose
                    .map((e) => Row(
                          children: [
                            Material(
                                child: Obx(
                              () => Radio(
                                activeColor:
                                    const Color.fromARGB(255, 42, 42, 114),
                                fillColor: MaterialStateProperty.all(
                                  const Color.fromARGB(255, 42, 42, 114),
                                ),
                                value: e,
                                onChanged: (value) {
                                  selectedvaluedata.value = value.toString();
                                  if (controller.ListCorrectvalue.contains(
                                      value.toString())) {
                                    controller.ListCorrectvalue.remove(
                                        value.toString());
                                  } else {
                                    controller.ListCorrectvalue.add(
                                        value.toString());
                                  }

                                  // controller.onChangevalue(
                                  //     value, e.CorrectAnswer);
                                },
                                groupValue: selectedvaluedata.value,
                              ),
                            )),
                            const SizedBox(
                              width: 8,
                            ),
                            Text(
                              e.toString(),
                              style: const TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  decoration: TextDecoration.none),
                            ),
                          ],
                        ))
                    .toList()),
          ]),
        ),
      ),
    );
  }
}

class Question {
  String? Qustion;
  List<String> AllChose = [];
  String? cor;
  String? selectedval;
  Question(String Q, String correct, String one, String two, String three) {
    Qustion = Q;
    cor = correct;
    AllChose.add(one);
    AllChose.add(two);
    AllChose.add(three);
  }
}
