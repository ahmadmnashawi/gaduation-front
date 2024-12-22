import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/test_controller.dart';

class TestPageView extends GetResponsiveView {
  @override
  TestController controller = Get.put(TestController());

  TestPageView({super.key});
  @override
  Widget builder() {
    return Container(
      child: SingleChildScrollView(
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
              Tooltip(
                message: 'lp'.tr,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Align(
                    alignment: Alignment.bottomRight,
                    child: Material(
                      child: IconButton(
                          onPressed: () {
                            Get.dialog(Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Align(
                                alignment: Alignment.center,
                                child: Container(
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(20),
                                      border:
                                          Border.all(color: Colors.blueAccent)),
                                  child: SingleChildScrollView(
                                    child: Column(
                                      children: [
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Align(
                                              alignment: Alignment.center,
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.all(8.0),
                                                child: Text(
                                                  "el".tr,
                                                  style: const TextStyle(
                                                      fontSize: 25,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontFamily: "Pacifico",
                                                      color: Color.fromARGB(
                                                          255, 42, 42, 114),
                                                      decoration:
                                                          TextDecoration.none),
                                                ),
                                              )),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.fromLTRB(
                                              10, 8, 10, 10),
                                          child: Column(
                                            children: <Widget>[
                                              Text(
                                                controller.text,
                                                textAlign: TextAlign.left,
                                                style: const TextStyle(
                                                    fontSize: 18,
                                                    decoration:
                                                        TextDecoration.none,
                                                    fontWeight: FontWeight.bold,
                                                    color: Colors.black87),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ));
                          },
                          icon: const Icon(
                            Icons.help_outline_outlined,
                            size: 30,
                            color: Color.fromARGB(255, 246, 123, 127),
                          )),
                    ),
                  ),
                ),
              )
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
          Column(children: controller.Listtsst.map((e) => shap(e)).toList()),
          // Center(
          //   child: Column(
          //       children: controller.ListTestContent.map(
          //           (e) => shap(e.typeName.toString(), e.Id!)).toList()),
          // ),
          // Row(
          //   children: [
          //     Tooltip(
          //       message: 'AddNewTest'.tr,
          //       child: Padding(
          //         padding: const EdgeInsets.all(8.0),
          //         child: Align(
          //           alignment: Alignment.topRight,
          //           child: ElevatedButton(
          //             style: ElevatedButton.styleFrom(
          //                 backgroundColor:
          //                     const Color.fromARGB(255, 246, 123, 127),
          //                 shape: RoundedRectangleBorder(
          //                     borderRadius: BorderRadius.circular(126)),
          //                 padding: const EdgeInsets.symmetric(
          //                     vertical: 17, horizontal: 17)),
          //             onPressed: () {
          //               Get.dialog(Align(
          //                   alignment: Alignment.center,
          //                   child: Container(
          //                       decoration: BoxDecoration(
          //                           color: Colors.white,
          //                           borderRadius: BorderRadius.circular(10),
          //                           border:
          //                               Border.all(color: Colors.blueAccent)),
          //                       width: 400,
          //                       height: 400,
          //                       child: AddTestPageView())));
          //             },
          //             child: Text('AddTest'.tr),
          //           ),
          //         ),
          //       ),
          //     ),
          //   ],
          // ),
        ]),
      ),
    );
  }

  Widget shap(String title
      // IconData iconData
      ) {
    return Padding(
      padding: const EdgeInsets.all(6.0),
      child: Material(
        child: InkWell(
          onTap: () async {
            controller.type.value = title;
            controller.test();
            // await controller.getTestForContent(id);
            // Get.to(QuestionPageView());
          },
          child: Container(
            height: 75,
            width: 300,
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
                    child: Text(title,
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
