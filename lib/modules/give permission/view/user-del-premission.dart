import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getwidget/getwidget.dart';

import '../../../app/model/user.dart';
import '../../../app/model/userAccsesbuility.dart';
import '../controller/premission_controller.dart';

class Delpremission extends GetResponsiveView<PermissionController> {
  Delpremission({super.key});
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Material(
            child: InkWell(
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
          ),
          const Text(
            "Remove Permission",
            style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
                fontFamily: "Pacifico",
                color: Color.fromARGB(255, 42, 42, 114),
                decoration: TextDecoration.none),
          ),
          Padding(
            padding: const EdgeInsets.all(4),
            child: Container(
                decoration: BoxDecoration(
                    border: Border.all(
                        color: const Color.fromARGB(255, 194, 192, 192)),
                    borderRadius: BorderRadius.circular(10)),
                child: Obx(() => DropdownButton<User>(
                    isExpanded: true,
                    underline: const SizedBox(),
                    value: controller.currentUser.value,
                    items: controller.AllUser.map((element) =>
                            DropdownMenuItem<User>(
                                value: element,
                                child: Text(element.Name.toString(),
                                    style: const TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black54,
                                        decoration: TextDecoration.none))))
                        .toList(),
                    onChanged: (element) {
                      controller.getGetUserPermission(element!.Id!);
                      controller.currentUser.value = element;
                    }))),
          ),
          Center(
            child: Material(
              child: GFButton(
                color: const Color.fromARGB(255, 42, 42, 114),
                onPressed: () {},
                text: "Save",
                textStyle: const TextStyle(color: Colors.white),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget checkShose(String text, UserAccessibility u) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: 40,
        decoration: BoxDecoration(
            border: Border.all(color: const Color.fromARGB(255, 194, 192, 192)),
            borderRadius: BorderRadius.circular(10)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                text,
                style: const TextStyle(
                    color: Colors.black54,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    decoration: TextDecoration.none),
              ),
            ),
            Material(
                child: IconButton(
                    onPressed: () {
                      Align(
                        alignment: Alignment.topRight,
                        child: Tooltip(
                          message: 'delete Library',
                          child: IconButton(
                              onPressed: () {
                                Get.dialog(Align(
                                    alignment: Alignment.center,
                                    child: Container(
                                        width: 200,
                                        height: 100,
                                        decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            border: Border.all(
                                                color: Colors.blueAccent)),
                                        child: SingleChildScrollView(
                                            child: Column(
                                          children: [
                                            const Text(
                                              "Are Sure To Remove?",
                                              style: TextStyle(
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.bold,
                                                  fontFamily: "Pacifico",
                                                  color: Color.fromARGB(
                                                      255, 42, 42, 114),
                                                  decoration:
                                                      TextDecoration.none),
                                            ),
                                            Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: Center(
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    TextButton(
                                                        onPressed: () {
                                                          controller
                                                              .delUserpremission(
                                                                  1, 2, '', 1);
                                                        },
                                                        child: const Text(
                                                          'Yes',
                                                          style: TextStyle(
                                                              color: Color
                                                                  .fromARGB(
                                                                      255,
                                                                      245,
                                                                      146,
                                                                      149)),
                                                        )),
                                                    TextButton(
                                                        onPressed: () {
                                                          Get.back();
                                                        },
                                                        child: const Text(
                                                          'No',
                                                          style: TextStyle(
                                                              color: Color
                                                                  .fromARGB(
                                                                      255,
                                                                      245,
                                                                      146,
                                                                      149)),
                                                        )),
                                                  ],
                                                ),
                                              ),
                                            )
                                          ],
                                        )))));
                              },
                              icon: const Icon(
                                Icons.close,
                                color: Colors.black54,
                              )),
                        ),
                      );
                    },
                    icon: const Icon(
                      Icons.delete,
                      size: 20,
                      color: Colors.red,
                    )))
          ],
        ),
      ),
    );
  }
}
