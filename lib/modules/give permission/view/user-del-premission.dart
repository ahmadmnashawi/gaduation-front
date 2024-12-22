import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getwidget/getwidget.dart';

import '../../../app/model/userAccsesbuility.dart';
import '../controller/premission_controller.dart';

class Delpremission extends GetResponsiveView<PermissionController> {
  @override
  PermissionController controller = Get.put(PermissionController());
  List<String> permission = [
    'Admain All permission',
    'Admain All',
    'Admain Library',
    'Admain post',
    'Admain Group'
  ];

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
          Material(
            child: Padding(
              padding: const EdgeInsets.all(6),
              child: Container(
                decoration: BoxDecoration(
                    border: Border.all(
                        color: const Color.fromARGB(255, 194, 192, 192)),
                    borderRadius: BorderRadius.circular(10)),
                child: GFAccordion(
                  title: "Choose User",
                  textStyle: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      color: Color.fromARGB(255, 246, 123, 127),
                      decoration: TextDecoration.none),
                  contentChild: Column(
                    children: controller.AllUser.map((element) => TextButton(
                        onPressed: () {
                          controller.getGetUserPermission(element.Id!);
                          controller.currentUser.value = element;
                        },
                        child: Text(element.toString(),
                            style: const TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: Colors.black54,
                                decoration: TextDecoration.none)))).toList(),
                  ),
                ),
              ),
            ),
          ),
          // Column(
          //     children: controller.listuserAccssebility
          //         .map((element) =>
          //             checkShose(element.accessibility.toString(), element))
          //         .toList()
          //     // children: [
          //     //   checkShose(' All Permission'),
          //     //   checkShose('Add New Group'),
          //     //   checkShose('Add New Refrence'),
          //     //   checkShose('Add New Library'),
          //     //   checkShose('Delete Librarys'),
          //     //   checkShose('Delete Groups'),
          //     //    checkShose('Delete Refrence'),
          //     // ],
          //     ),
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
          Tooltip(
            message: 'Help About Page',
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
                                  border: Border.all(color: Colors.blueAccent)),
                              child: SingleChildScrollView(
                                child: Column(
                                  children: [
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    const Padding(
                                      padding: EdgeInsets.all(8.0),
                                      child: Align(
                                          alignment: Alignment.center,
                                          child: Padding(
                                            padding: EdgeInsets.all(8.0),
                                            child: Text(
                                              "Help",
                                              style: TextStyle(
                                                  fontSize: 25,
                                                  fontWeight: FontWeight.bold,
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
                                            controller.textdel,
                                            textAlign: TextAlign.left,
                                            style: const TextStyle(
                                                fontSize: 18,
                                                decoration: TextDecoration.none,
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
                                                                  u);
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
