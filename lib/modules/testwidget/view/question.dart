import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:graduationproject/modules/sheard/auth_service.dart';
import 'package:graduationproject/modules/testwidget/view/add-test.dart';

import '../controller/test_controller.dart';

// ignore: must_be_immutable
class QuestionPageView extends GetResponsiveView<TestController> {
  List<Question>? listAllQustion;
  QuestionPageView({super.key, this.listAllQustion});
  @override
  Widget builder() {
    return SingleChildScrollView(
      child: Material(
        color: Colors.white,
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InkWell(
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
                Get.find<AuthService>().isAdmin() ||
                        Get.find<AuthService>().getDataFromStorage()!.Id == 2
                    ? Padding(
                        padding: const EdgeInsets.all(4),
                        child: IconButton(
                            onPressed: () async {
                              await controller.getContent();
                              Get.dialog(Align(
                                  alignment: Alignment.center,
                                  child: Container(
                                      decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          border:
                                              Border.all(color: Colors.white)),
                                      width: 400,
                                      height: 400,
                                      child: AddTestPageView())));
                            },
                            icon: const Icon(
                              Icons.add_box_rounded,
                              size: 30,
                              color: Color.fromARGB(255, 246, 123, 127),
                            )),
                      )
                    : const SizedBox()
              ],
            ),
            Obx(() => Column(
                children: controller.AllQustion.map((element) => shapeQuestion(
                    element.Qustion.toString(), element.AllChose)).toList())),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(
                onPressed: () {
                  controller.numberQustion.value = controller.AllQustion.length;
                  controller.result.value = 0;
                  controller.result.value = controller.AllQustion.where((r) =>
                      controller.ListCorrectvalue.any((t) =>
                          t.toLowerCase().trim() ==
                          r.cor!.toLowerCase().trim())).toList().length;

                  Get.dialog(Align(
                    alignment: Alignment.center,
                    child: Container(
                      width: 250,
                      height: 250,
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
                                          Obx(() => Text(
                                                controller.numberQustion
                                                    .toString(),
                                                style: const TextStyle(
                                                    fontSize: 18,
                                                    fontWeight: FontWeight.bold,
                                                    color: Color.fromARGB(
                                                        255, 246, 123, 127),
                                                    decoration:
                                                        TextDecoration.none),
                                              )),
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
                                          Obx(() => Text(
                                                controller.result.value
                                                    .toString(),
                                                style: const TextStyle(
                                                    fontSize: 18,
                                                    fontWeight: FontWeight.bold,
                                                    color: Color.fromARGB(
                                                        255, 246, 123, 127),
                                                    decoration:
                                                        TextDecoration.none),
                                              )),
                                        ],
                                      ),
                                    ),
                                  ),
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
                  style: const TextStyle(
                      fontSize: 20, color: Color.fromARGB(255, 246, 123, 127)),
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
                                  if (!controller.ListCorrectvalue.contains(
                                      value.toString())) {
                                    controller.ListCorrectvalue.add(
                                        value.toString());
                                  }
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
