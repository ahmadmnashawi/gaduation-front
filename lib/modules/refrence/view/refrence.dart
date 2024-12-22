import 'dart:js' as js;

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getwidget/getwidget.dart';

import '../../../app/model/content.dart';
import '../controller/refrence_controller.dart';

class RefrencePageView extends GetResponsiveView<RerenceController> {
  @override
  RerenceController controller = Get.put(RerenceController());
  final _formfield = GlobalKey<FormState>();

  RefrencePageView({super.key});
  @override
  Widget builder() {
    return SizedBox(
        height: 600,
        child: SingleChildScrollView(
            child: Form(
          key: _formfield,
          child: Column(
            children: [
              Row(
                children: [
                  Material(
                    child: InkWell(
                      onTap: () => Get.back(),
                      child: const Align(
                        alignment: Alignment.topLeft,
                        child: Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Icon(Icons.arrow_back_ios,
                              size: 17, color: Colors.grey),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 18,
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(96, 8, 8, 8),
                    child: Center(
                      child: Text('AllRefrenceses'.tr,
                          style: const TextStyle(
                              fontSize: 30,
                              fontWeight: FontWeight.bold,
                              decoration: TextDecoration.none,
                              color: Color.fromARGB(255, 42, 42, 114),
                              fontFamily: "Pacifico")),
                    ),
                  ),
                ],
              ),
              // Column(
              //     children: controller.refrences.map((e) => shap22(e)).toList()),
              Obx(() => Column(
                    children:
                        controller.contenst.map((e) => shap22(e)).toList(),
                  )),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Tooltip(
                    message: 'AddNewRefrence'.tr,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Align(
                        alignment: Alignment.topRight,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              backgroundColor:
                                  const Color.fromARGB(255, 246, 123, 127),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(126)),
                              padding: const EdgeInsets.symmetric(
                                  vertical: 17, horizontal: 17)),
                          onPressed: () {
                            Get.dialog(Align(
                                alignment: Alignment.center,
                                child: Container(
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(10),
                                      border:
                                          Border.all(color: Colors.blueAccent)),
                                  width: 400,
                                  height: 350,
                                  child: SingleChildScrollView(
                                    child: Column(children: [
                                      Text(
                                        'AddNewRefrence'.tr,
                                        style: const TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold,
                                            fontFamily: "Pacifico",
                                            color: Color.fromARGB(
                                                255, 42, 42, 114),
                                            decoration: TextDecoration.none),
                                      ),
                                      Material(
                                        child: GFAccordion(
                                          title: "GroupType".tr,
                                          textStyle: const TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 20,
                                              color: Color.fromARGB(
                                                  255, 246, 123, 127),
                                              decoration: TextDecoration.none),
                                          contentChild: Column(
                                            children: controller.contenst
                                                .map((element) => TextButton(
                                                    onPressed: () {
                                                      controller.Addrefrence
                                                              .value.IdContent =
                                                          element.Id;
                                                    },
                                                    child: Text(
                                                        element.typeName
                                                            .toString(),
                                                        style: const TextStyle(
                                                            fontSize: 18,
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            color:
                                                                Colors.black54,
                                                            decoration:
                                                                TextDecoration
                                                                    .none))))
                                                .toList(),
                                          ),
                                        ),
                                      ),
                                      Material(
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: SizedBox(
                                            width: 350,
                                            height: 60,
                                            child: TextFormField(
                                              decoration: InputDecoration(
                                                labelText: 'AddRefrence'.tr,
                                                labelStyle: const TextStyle(
                                                    color: Color.fromARGB(
                                                        255, 246, 123, 127),
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                              onChanged: (value) {
                                                controller.valuetext.value =
                                                    value;
                                                // controller.addBookType.value.bookType =
                                                //     value;
                                              },
                                            ),
                                          ),
                                        ),
                                      ),
                                      Material(
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: SizedBox(
                                            width: 350,
                                            height: 60,
                                            child: TextFormField(
                                              decoration: InputDecoration(
                                                labelText: 'Name Refreanc'.tr,
                                                labelStyle: const TextStyle(
                                                    color: Color.fromARGB(
                                                        255, 246, 123, 127),
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                              onChanged: (value) {
                                                controller.Addrefrence.value
                                                    .referenceName = value;
                                                // controller.addBookType.value.bookType =
                                                //     value;
                                              },
                                            ),
                                          ),
                                        ),
                                      ),
                                      Center(
                                        child: GFButton(
                                          onPressed: () {
                                            if (controller
                                                .valuetext.value.isEmpty) {
                                              Get.snackbar(
                                                'Error'.tr,
                                                "PleaseInputValue".tr,
                                                icon: const Icon(Icons.person,
                                                    color: Colors.white),
                                                snackPosition:
                                                    SnackPosition.BOTTOM,
                                                backgroundColor:
                                                    const Color.fromARGB(
                                                        255, 246, 123, 127),
                                                borderRadius: 20,
                                                margin:
                                                    const EdgeInsets.all(15),
                                                colorText: Colors.white,
                                                duration:
                                                    const Duration(seconds: 4),
                                                isDismissible: true,
                                                forwardAnimationCurve:
                                                    Curves.easeOutBack,
                                              );
                                            } else {
                                              controller
                                                      .Addrefrence.value.Link =
                                                  controller.valuetext.value;
                                              controller.AddRefrence();
                                              Get.back();
                                              controller.getAllRefrence();
                                            }

                                            // controller.AddBookType(
                                            //     controller.addBookType.value);
                                          },
                                          text: "Added".tr,
                                          color: const Color.fromARGB(
                                              255, 42, 42, 114),
                                          shape: GFButtonShape.pills,
                                        ),
                                      ),
                                    ]),
                                  ),
                                )));
                          },
                          child: Text('AddRefrence'.tr),
                        ),
                      ),
                    ),
                  )
                ],
              ),
              Material(
                child: Tooltip(
                  message: 'HelpAboutPage'.tr,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Align(
                      alignment: Alignment.bottomRight,
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
                                                  "Help".tr,
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
                                                controller.textallrefrence,
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
        )));
  }

  Widget shap22(Content r) {
    return Material(
      child: Padding(
        padding: const EdgeInsets.all(6),
        child: Container(
          decoration: BoxDecoration(
              border:
                  Border.all(color: const Color.fromARGB(255, 194, 192, 192)),
              borderRadius: BorderRadius.circular(10)),
          child: Material(
            child: InkWell(
              onTap: () {
                controller.getRefrence(r.Id!);
              },
              child: GFAccordion(
                title: r.typeName!,
                textStyle: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    color: Color.fromARGB(255, 246, 123, 127),
                    decoration: TextDecoration.none),
                contentChild: Obx(() => Column(
                    children: controller.ListRefrence.where(
                            (p0) => p0.IdContent == r.Id)
                        .map((element) => Column(
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Align(
                                      alignment: Alignment.topLeft,
                                      child: Text(
                                        element.referenceName.toString(),
                                        softWrap: true,
                                        style: const TextStyle(
                                            fontSize: 12,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.black54),
                                      ),
                                    ),
                                  ],
                                ),
                                Align(
                                  alignment: Alignment.topLeft,
                                  child: InkWell(
                                    onTap: () {
                                      js.context.callMethod(
                                          'openn'.tr, [element.Link!]);
                                    },
                                    child: Text(
                                      element.Link.toString(),
                                      style: const TextStyle(
                                          color: Colors.blue,
                                          decoration: TextDecoration.none,
                                          fontSize: 17,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                )
                              ],
                            ))
                        .toList())),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
