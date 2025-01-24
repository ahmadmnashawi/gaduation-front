import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getwidget/getwidget.dart';

import '../controller/menu.dart';

class ContentPage extends GetResponsiveView<HomeController> {
  ContentPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: Align(
          alignment: Alignment.topLeft,
          child: Text(
            'hp'.tr,
            style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 25,
                color: Color.fromARGB(255, 42, 42, 114),
                fontFamily: "Pacifico"),
          ),
        ),
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Align(
              alignment: Alignment.topRight,
              child: GFButton(
                shape: GFButtonShape.pills,
                color: const Color.fromARGB(255, 42, 42, 114),
                onPressed: () {
                  controller.GetAllContent();
                  Get.dialog(Align(
                    alignment: Alignment.topRight,
                    child: Container(
                      width: 200,
                      height: 900,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(color: Colors.blueAccent)),
                      child: SingleChildScrollView(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            const SizedBox(
                              height: 10,
                            ),
                            Align(
                                alignment: Alignment.center,
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    "cs".tr,
                                    style: const TextStyle(
                                        fontSize: 25,
                                        fontWeight: FontWeight.bold,
                                        fontFamily: "Pacifico",
                                        color: Color.fromARGB(255, 42, 42, 114),
                                        decoration: TextDecoration.none),
                                  ),
                                )),
                            Obx(() => Wrap(
                                  children: controller.Contents.map((element) =>
                                      buildContent(element.typeName.toString(),
                                          element.Id!)).toList(),
                                ))
                          ],
                        ),
                      ),
                    ),
                  ));
                },
                text: "cs".tr,
                textStyle: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
            ),
          ),
        ],
      )
    ]);
  }

  Widget buildContent(String content, int idcontentt) => Padding(
        padding: const EdgeInsets.all(8.0),
        child: Material(
          child: InkWell(
            onTap: () {
              controller.idcontent.value = idcontentt;
              controller.GetpostByType();
            },
            child: Container(
              height: 40,
              decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 248, 150, 153),
                  borderRadius: BorderRadius.circular(14)),
              child: Center(
                child: Text(
                  content,
                  style: const TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ),
        ),
      );
}
