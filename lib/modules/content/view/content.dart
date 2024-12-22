import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getwidget/getwidget.dart';
import 'package:graduationproject/app/model/content.dart';

import '../controller/content_controller.dart';

class Contentpage extends GetResponsiveView<ContentController> {
  final _formfield = GlobalKey<FormState>();
  Contentpage({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Form(
        key: _formfield,
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                                size: 20, color: Colors.grey),
                          ),
                        ),
                      ),
                    ),
                    Align(
                        alignment: Alignment.topLeft,
                        child: Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text(
                            "alc".tr,
                            style: TextStyle(
                                fontSize: 25,
                                fontWeight: FontWeight.bold,
                                fontFamily: "Pacifico",
                                color: Color.fromARGB(255, 42, 42, 114),
                                decoration: TextDecoration.none),
                          ),
                        )),
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
                                        border: Border.all(
                                            color: Colors.blueAccent)),
                                    child: SingleChildScrollView(
                                      child: Column(
                                        children: [
                                          const SizedBox(
                                            height: 10,
                                          ),
                                          Padding(
                                            padding: EdgeInsets.all(8.0),
                                            child: Align(
                                                alignment: Alignment.center,
                                                child: Padding(
                                                  padding: EdgeInsets.all(8.0),
                                                  child: Text(
                                                    "Help".tr,
                                                    style: TextStyle(
                                                        fontSize: 25,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        fontFamily: "Pacifico",
                                                        color: Color.fromARGB(
                                                            255, 42, 42, 114),
                                                        decoration:
                                                            TextDecoration
                                                                .none),
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
                                                      fontWeight:
                                                          FontWeight.bold,
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
            const SizedBox(
              height: 10,
            ),
            Align(
              alignment: Alignment.topRight,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: GFButton(
                  shape: GFButtonShape.pills,
                  color: const Color.fromARGB(255, 42, 42, 114),
                  onPressed: () {
                    Get.dialog(Align(
                        alignment: Alignment.center,
                        child: Container(
                            width: 320,
                            height: 200,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10),
                                border: Border.all(color: Colors.blueAccent)),
                            child: Column(
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.all(10.0),
                                      child: Align(
                                        alignment: Alignment.topLeft,
                                        child: Text(
                                          "adc".tr,
                                          style: TextStyle(
                                              fontSize: 20,
                                              fontWeight: FontWeight.bold,
                                              fontFamily: "Pacifico",
                                              color: Color.fromARGB(
                                                  255, 42, 42, 114),
                                              decoration: TextDecoration.none),
                                        ),
                                      ),
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
                                                    padding:
                                                        const EdgeInsets.all(
                                                            8.0),
                                                    child: Align(
                                                      alignment:
                                                          Alignment.center,
                                                      child: Container(
                                                        decoration: BoxDecoration(
                                                            color: Colors.white,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        20),
                                                            border: Border.all(
                                                                color: Colors
                                                                    .blueAccent)),
                                                        child:
                                                            SingleChildScrollView(
                                                          child: Column(
                                                            children: [
                                                              const SizedBox(
                                                                height: 10,
                                                              ),
                                                              Padding(
                                                                padding:
                                                                    EdgeInsets
                                                                        .all(
                                                                            8.0),
                                                                child: Align(
                                                                    alignment:
                                                                        Alignment
                                                                            .center,
                                                                    child:
                                                                        Padding(
                                                                      padding:
                                                                          EdgeInsets.all(
                                                                              8.0),
                                                                      child:
                                                                          Text(
                                                                        "Help"
                                                                            .tr,
                                                                        style: TextStyle(
                                                                            fontSize:
                                                                                25,
                                                                            fontWeight: FontWeight
                                                                                .bold,
                                                                            fontFamily:
                                                                                "Pacifico",
                                                                            color: Color.fromARGB(
                                                                                255,
                                                                                42,
                                                                                42,
                                                                                114),
                                                                            decoration:
                                                                                TextDecoration.none),
                                                                      ),
                                                                    )),
                                                              ),
                                                              Padding(
                                                                padding:
                                                                    const EdgeInsets
                                                                            .fromLTRB(
                                                                        10,
                                                                        8,
                                                                        10,
                                                                        10),
                                                                child: Column(
                                                                  children: <
                                                                      Widget>[
                                                                    Text(
                                                                      controller
                                                                          .addtext,
                                                                      textAlign:
                                                                          TextAlign
                                                                              .left,
                                                                      style: const TextStyle(
                                                                          fontSize:
                                                                              18,
                                                                          decoration: TextDecoration
                                                                              .none,
                                                                          fontWeight: FontWeight
                                                                              .bold,
                                                                          color:
                                                                              Colors.black87),
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
                                                  color: Color.fromARGB(
                                                      255, 246, 123, 127),
                                                )),
                                          ),
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                                Material(
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: SizedBox(
                                      width: 400,
                                      child: TextFormField(
                                        decoration: InputDecoration(
                                          labelText: 'anc'.tr,
                                          labelStyle: TextStyle(
                                              color: Color.fromARGB(
                                                  255, 246, 123, 127),
                                              fontWeight: FontWeight.bold),
                                        ),
                                        validator: (value) {
                                          // for number
                                          if (value!.isEmpty ||
                                              !RegExp(r'^[a-z A-Z]+$')
                                                  .hasMatch(value)) {
                                            return "EnterCorrectName".tr;
                                          } else {
                                            return null;
                                          }
                                        },
                                        onChanged: (value) {
                                          if (!controller.contents.any(
                                              (element) =>
                                                  element.typeName == value)) {
                                            controller.addcontent.value
                                                .typeName = value;
                                          } else {
                                            Get.snackbar(
                                              'Error'.tr,
                                              "anc".tr,
                                              //  icon: Icon(Icons.person, color: Colors.white),
                                              snackPosition:
                                                  SnackPosition.BOTTOM,
                                              backgroundColor:
                                                  const Color.fromARGB(
                                                      255, 209, 143, 143),
                                              borderRadius: 20,
                                              margin: const EdgeInsets.all(15),
                                              colorText: Colors.white,
                                              duration:
                                                  const Duration(seconds: 4),
                                              isDismissible: true,
                                              //  dismissDirection: SnackDismissDirection.HORIZONTAL,
                                              forwardAnimationCurve:
                                                  Curves.easeOutBack,
                                            );
                                          }
                                        },
                                      ),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Align(
                                    alignment: Alignment.bottomRight,
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: ElevatedButton(
                                        onPressed: () async {
                                          if (_formfield.currentState!
                                              .validate()) {
                                            print("Data Added Successfully");
                                            // controller.show.value = true;
                                            if (!controller.contents.contains(
                                                controller.addcontent.value)) {
                                              await controller
                                                  .addcontentelement(controller
                                                      .addcontent.value);
                                              await Get.snackbar(
                                                ' Added',
                                                " The Content Is Added",
                                                //  icon: Icon(Icons.person, color: Colors.white),
                                                snackPosition:
                                                    SnackPosition.BOTTOM,
                                                backgroundColor: Color.fromARGB(
                                                    255, 246, 123, 127),
                                                borderRadius: 20,
                                                margin:
                                                    const EdgeInsets.all(15),
                                                colorText: Colors.white,
                                                duration:
                                                    const Duration(seconds: 4),
                                                isDismissible: true,
                                                //  dismissDirection: SnackDismissDirection.HORIZONTAL,
                                                forwardAnimationCurve:
                                                    Curves.easeOutBack,
                                              );
                                            }
                                          } else {
                                            await Get.snackbar(
                                              'Error'.tr,
                                              "anc".tr,
                                              //  icon: Icon(Icons.person, color: Colors.white),
                                              snackPosition:
                                                  SnackPosition.BOTTOM,
                                              backgroundColor:
                                                  const Color.fromARGB(
                                                      255, 209, 143, 143),
                                              borderRadius: 20,
                                              margin: const EdgeInsets.all(15),
                                              colorText: Colors.white,
                                              duration:
                                                  const Duration(seconds: 4),
                                              isDismissible: true,
                                              //  dismissDirection: SnackDismissDirection.HORIZONTAL,
                                              forwardAnimationCurve:
                                                  Curves.easeOutBack,
                                            );
                                          }
                                        },
                                        style: ElevatedButton.styleFrom(
                                            backgroundColor:
                                                const Color.fromARGB(
                                                    255, 42, 42, 114),
                                            shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(120)),
                                            padding: const EdgeInsets.symmetric(
                                                vertical: 15, horizontal: 15)),
                                        child: Text(
                                          'Save'.tr,
                                          style: TextStyle(color: Colors.white),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ))));
                  },
                  text: "adc".tr,
                  textStyle: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                  icon: const Icon(
                    Icons.add,
                    size: 17,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            Obx(() => Column(
                children: controller.contents
                    .map((element) => CardContent(context, element))
                    .toList())),
          ],
        ),
      ),
    );
  }

  Widget CardContent(BuildContext context, Content content) {
    return Padding(
      padding: const EdgeInsets.all(6),
      child: GFBorder(
        radius: const Radius.circular(20),
        color: const Color.fromARGB(
          255,
          246,
          123,
          127,
        ),
        dashedLine: const [4, 0],
        type: GFBorderType.rRect,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            height: 40,
            color: const Color.fromARGB(255, 252, 253, 252),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Center(
                  child: Text(
                    content.typeName!,
                    style: const TextStyle(
                        fontSize: 20,
                        decoration: TextDecoration.none,
                        fontWeight: FontWeight.bold,
                        color: Colors.black54),
                  ),
                ),
                Material(
                    child: IconButton(
                        onPressed: () async {
                          await controller.delcontentelement(content);
                        },
                        icon: const Icon(
                          Icons.close,
                          //    color: Color.fromARGB(255, 245, 74, 62),
                        )))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
