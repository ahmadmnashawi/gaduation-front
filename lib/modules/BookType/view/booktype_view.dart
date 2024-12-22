import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getwidget/components/border/gf_border.dart';
import 'package:getwidget/components/button/gf_button.dart';
import 'package:getwidget/shape/gf_button_shape.dart';
import 'package:getwidget/types/gf_border_type.dart';

import '../../../app/model/book_type.dart';
import '../../settings/view/settings.dart';
import '../controller/booktype_controller.dart';

class BookTypePageView extends GetResponsiveView<BookTypeController> {
  final _formfield = GlobalKey<FormState>();
  @override
  final controller = Get.find<BookTypeController>();
  BookTypePageView({super.key});
  //  final textfield=TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Form(
          key: _formfield,
          child: Column(
            children: [
              Material(
                child: InkWell(
                  onTap: () => Get.to(SettingPageView()),
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
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "bts".tr,
                      style: const TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                          fontFamily: "Pacifico",
                          color: Color.fromARGB(255, 42, 42, 114),
                          decoration: TextDecoration.none),
                    ),
                  )),
              Align(
                  alignment: Alignment.center,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "albt".tr,
                      style: const TextStyle(
                          fontSize: 20,
                          fontFamily: "Pacifico",
                          color: Colors.grey,
                          decoration: TextDecoration.none),
                    ),
                  )),

              // CardBookType('history', context, 9),
              // CardBookType('Medicine', context, 9),
              // CardBookType('Culture', context, 9),
              // CardBookType('Arabic', context, 9),
              // CardBookType('Love', context, 9),
              // CardBookType('Math', context, 9),
              Obx(() => Column(
                  children: controller.AllBookType.map((element) =>
                          CardBookType(
                              element.bookType.toString(), context, element))
                      .toList())),
              Row(
                children: [
                  Tooltip(
                    message: 'and'.tr,
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
                            onPressed: controller.auth.isAdmin()
                                ? () {
                                    Get.dialog(Align(
                                        alignment: Alignment.center,
                                        child: Container(
                                          decoration: BoxDecoration(
                                              color: Colors.white,
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              border: Border.all(
                                                  color: Colors.blueAccent)),
                                          width: 400,
                                          height: 200,
                                          child: Column(children: [
                                            Text(
                                              "and".tr,
                                              style: const TextStyle(
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.bold,
                                                  fontFamily: "Pacifico",
                                                  color: Color.fromARGB(
                                                      255, 42, 42, 114),
                                                  decoration:
                                                      TextDecoration.none),
                                            ),
                                            Material(
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.all(8.0),
                                                child: SizedBox(
                                                  width: 350,
                                                  height: 60,
                                                  child: TextFormField(
                                                    decoration: InputDecoration(
                                                      icon: const Icon(
                                                        Icons.library_books,
                                                        color: Color.fromARGB(
                                                            255, 246, 123, 127),
                                                      ),
                                                      labelText: 'aty'.tr,
                                                      labelStyle:
                                                          const TextStyle(
                                                              color: Color
                                                                  .fromARGB(
                                                                      255,
                                                                      246,
                                                                      123,
                                                                      127),
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold),
                                                    ),
                                                    onChanged: (value) {
                                                      controller
                                                          .addBookType
                                                          .value
                                                          .bookType = value;
                                                    },
                                                    validator: (value) {
                                                      // for number
                                                      if (value!.isEmpty ||
                                                          !RegExp(r'^[a-z A-Z]+$')
                                                              .hasMatch(
                                                                  value)) {
                                                        return "EnterCorrectName"
                                                            .tr;
                                                      } else {
                                                        return null;
                                                      }
                                                    },
                                                  ),
                                                ),
                                              ),
                                            ),
                                            Center(
                                              child: GFButton(
                                                onPressed: () {
                                                  if (_formfield.currentState!
                                                      .validate()) {
                                                    print(
                                                        "Data Added Successfully");
                                                    controller.AddBookType(
                                                        controller
                                                            .addBookType.value);
                                                  } else {
                                                    Get.snackbar(
                                                      'Error'.tr,
                                                      "anc".tr,
                                                      //  icon: Icon(Icons.person, color: Colors.white),
                                                      snackPosition:
                                                          SnackPosition.BOTTOM,
                                                      backgroundColor:
                                                          const Color.fromARGB(
                                                              255,
                                                              209,
                                                              143,
                                                              143),
                                                      borderRadius: 20,
                                                      margin:
                                                          const EdgeInsets.all(
                                                              15),
                                                      colorText: Colors.white,
                                                      duration: const Duration(
                                                          seconds: 4),
                                                      isDismissible: true,
                                                      //  dismissDirection: SnackDismissDirection.HORIZONTAL,
                                                      forwardAnimationCurve:
                                                          Curves.easeOutBack,
                                                    );
                                                  }
                                                },
                                                text: "Added".tr,
                                                color: const Color.fromARGB(
                                                    255, 42, 42, 114),
                                                shape: GFButtonShape.pills,
                                              ),
                                            ),
                                          ]),
                                        )));
                                  }
                                : () {
                                    Get.showSnackbar(const GetSnackBar(
                                      duration: Duration(seconds: 2),
                                      title: 'Access',
                                      message: 'You Dont Have Permission',
                                    ));
                                  },
                            child: const Icon(Icons.add)),
                      ),
                    ),
                  ),
                  Tooltip(
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
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget CardBookType(String name, BuildContext context, BookType? book) {
    return Padding(
      padding: const EdgeInsets.all(6),
      child: SizedBox(
        width: 350,
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
              height: 21,
              color: const Color.fromARGB(255, 252, 253, 252),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const SizedBox(
                    width: 6,
                  ),
                  Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      name,
                      style: const TextStyle(
                          fontSize: 20,
                          decoration: TextDecoration.none,
                          fontWeight: FontWeight.bold,
                          color: Colors.black54),
                    ),
                  ),
                  Material(
                      child: IconButton(
                          onPressed: controller.auth.isAdmin()
                              ? () async {
                                  Get.dialog(Align(
                                      alignment: Alignment.center,
                                      child: Container(
                                          width: 280,
                                          height: 120,
                                          decoration: BoxDecoration(
                                              color: Colors.white,
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              border: Border.all(
                                                  color: Colors.blueAccent)),
                                          child: Column(
                                            children: [
                                              Center(
                                                child: Text(
                                                  'AreYouSureRemove'.tr,
                                                  style: const TextStyle(
                                                      fontSize: 18,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontFamily: "Pacifico",
                                                      color: Color.fromARGB(
                                                          255, 42, 42, 114),
                                                      decoration:
                                                          TextDecoration.none),
                                                ),
                                              ),
                                              const SizedBox(
                                                height: 20,
                                              ),
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  GFButton(
                                                    color: const Color.fromARGB(
                                                        255, 246, 123, 127),
                                                    onPressed: () {
                                                      controller
                                                          .delBookType(book!);
                                                    },
                                                    text: "Delete".tr,
                                                    shape: GFButtonShape.pills,
                                                  ),
                                                  const SizedBox(
                                                    width: 2,
                                                  ),
                                                  GFButton(
                                                    color: const Color.fromARGB(
                                                        255, 246, 123, 127),
                                                    onPressed: () {
                                                      Get.to(
                                                          BookTypePageView());
                                                    },
                                                    text: "Cancle".tr,
                                                    shape: GFButtonShape.pills,
                                                  ),
                                                ],
                                              )
                                            ],
                                          ))));
                                }
                              : () {
                                  Get.showSnackbar(const GetSnackBar(
                                    duration: Duration(seconds: 2),
                                    title: 'Access',
                                    message: 'You Dont Have Permission',
                                  ));
                                },
                          icon: const Icon(
                            Icons.delete,
                            color: Colors.red,
                            //    color: Color.fromARGB(255, 245, 74, 62),
                          )))
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
