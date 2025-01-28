import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:graduationproject/modules/sheard/auth_service.dart';

import '../../../app/model/testDto.dart';
import '../controller/test_controller.dart';

class TestPageView extends GetResponsiveView<TestController> {
  TestPageView({super.key});
  @override
  Widget builder() {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color.fromARGB(255, 185, 97, 123),
        onPressed: Get.find<AuthService>().isAdmin() ||
                Get.find<AuthService>().getDataFromStorage()!.Id == 2
            ? () {
                Get.dialog(
                  Align(
                    alignment: Alignment.center,
                    child: Container(
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(color: Colors.white)),
                      width: 400,
                      height: 250,
                      child: Material(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              'Add Test Type'.tr,
                              style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 25,
                                  color: Color.fromARGB(255, 42, 42, 114),
                                  fontFamily: "Pacifico"),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: SizedBox(
                                width: 350,
                                height: 60,
                                child: TextFormField(
                                  decoration: InputDecoration(
                                    labelText: 'Test Type'.tr,
                                    labelStyle: const TextStyle(
                                        color:
                                            Color.fromARGB(255, 246, 123, 127),
                                        fontWeight: FontWeight.bold),
                                  ),
                                  validator: (value) {
                                    if (value!.isEmpty ||
                                        !RegExp(r"^[a-zA-Z0-9.!#$%&'*+-/+?^_`{|}~]")
                                            .hasMatch(value)) {
                                      return "EnterCorrectText".tr;
                                    } else {
                                      return null;
                                    }
                                  },
                                  onChanged: (value) {
                                    controller.newTest.value.test = value;
                                  },
                                ),
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                SizedBox(),
                                Row(
                                  children: [
                                    Tooltip(
                                      message: 'SaveTest'.tr,
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Align(
                                          alignment: Alignment.topRight,
                                          child: ElevatedButton(
                                            style: ElevatedButton.styleFrom(
                                                backgroundColor:
                                                    const Color.fromARGB(
                                                        255, 42, 42, 114),
                                                shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            126)),
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        vertical: 17,
                                                        horizontal: 17)),
                                            onPressed: () async {
                                              controller.Listtsst.add(TestDto(
                                                  test: controller
                                                      .newTest.value));
                                              controller.Listtsst.refresh();
                                              Get.back();
                                            },
                                            child: Text('Save'.tr),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Tooltip(
                                      message: 'Close'.tr,
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Align(
                                          alignment: Alignment.topRight,
                                          child: ElevatedButton(
                                            style: ElevatedButton.styleFrom(
                                                backgroundColor:
                                                    const Color.fromARGB(
                                                        255, 42, 42, 114),
                                                shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            126)),
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        vertical: 17,
                                                        horizontal: 17)),
                                            onPressed: () async {
                                              Get.back();
                                            },
                                            child: Text('Close'.tr),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              }
            : () {
                Get.showSnackbar(const GetSnackBar(
                  duration: Duration(seconds: 2),
                  title: 'Access',
                  message: 'You Dont Have Permission',
                ));
              },
        child: const Icon(Icons.add),
      ),
      body: SingleChildScrollView(
        child: Column(children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
            ],
          ),
          Text('Tests'.tr,
              style: const TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  decoration: TextDecoration.none,
                  color: Color.fromARGB(255, 42, 42, 114),
                  fontFamily: "Pacifico")),
          Center(
            child: Text('ShowYourTestsDoYouWant'.tr,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  decoration: TextDecoration.none,
                  color: Colors.grey,
                )),
          ),
          const SizedBox(
            height: 40,
          ),
          Obx(() =>
              Wrap(children: controller.Listtsst.map((e) => shap(e)).toList())),
          // Obx(
          //   () => Wrap(
          //       children:
          //           controller.ListTestByContent.map((e) => shap(e)).toList()),
          // ),
        ]),
      ),
    );
  }

  Widget shap(TestDto test
      // IconData iconData
      ) {
    return Padding(
      padding: const EdgeInsets.all(6.0),
      child: Material(
        child: InkWell(
          onTap: () async {
            controller.type.value = test.test!.test ?? "";
            controller.test();
            // await controller.getTestForContent(id);
            // Get.to(QuestionPageView());
          },
          child: Container(
            height: 75,
            width: Get.width / 2.1,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(30), //border corner radius
              boxShadow: [
                BoxShadow(
                  color: const Color.fromARGB(255, 185, 97, 123)
                      .withOpacity(0.5), //color of shadow
                  spreadRadius: 3, //spread radius
                  blurRadius: 7, // blur radius
                  offset: const Offset(0, 2),
                ),
              ],
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  const SizedBox(
                    width: 40,
                  ),
                  //  Padding(
                  //    padding: EdgeInsets.all(8.0),
                  //       child: Center(
                  //         child: Icon(
                  //          iconData ,
                  //                    size: 40,
                  //                    color: Color.fromARGB(255, 246, 123, 127),
                  //         ),
                  //       ),
                  //  ),
                  const SizedBox(
                    width: 20,
                  ),
                  Center(
                    child: Text(test.test!.test ?? "",
                        style: const TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          decoration: TextDecoration.none,
                          color: Colors.black54,
                        )),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
