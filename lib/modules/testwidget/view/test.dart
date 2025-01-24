import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../app/model/testDto.dart';
import '../controller/test_controller.dart';

class TestPageView extends GetResponsiveView<TestController> {
  TestPageView({super.key});
  @override
  Widget builder() {
    return SingleChildScrollView(
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
