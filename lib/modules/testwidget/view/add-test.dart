import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getwidget/components/accordion/gf_accordion.dart';

import '../controller/test_controller.dart';

class AddTestPageView extends GetResponsiveView<TestController> {
  @override
  TestController controller = Get.put(TestController());
  final _formfield = GlobalKey<FormState>();

  AddTestPageView({super.key});
  @override
  Widget builder() {
    return Form(
      key: _formfield,
      child: Container(
          child: SingleChildScrollView(
              child: Column(children: [
         Text('AddNewTest'.tr,
            style: TextStyle(
                fontSize: 26,
                fontWeight: FontWeight.bold,
                decoration: TextDecoration.none,
                color: Color.fromARGB(255, 42, 42, 114),
                fontFamily: "Pacifico")),
        Material(
          child: Padding(
            padding: const EdgeInsets.all(6),
            child: Container(
              decoration: BoxDecoration(
                  border: Border.all(
                      color: const Color.fromARGB(255, 194, 192, 192)),
                  borderRadius: BorderRadius.circular(10)),
              child: GFAccordion(
                title: "ChooseTypeTest".tr,
                textStyle: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                    color: Color.fromARGB(255, 246, 123, 127),
                    decoration: TextDecoration.none),
                contentChild: Column(
                    children: controller.contents
                        .map((e) => shap(e.typeName.toString(), e.Id!))
                        .toList()
                    //    [
                    //       shap('IT  Test',Icons.integration_instructions_outlined ),
                    // shap('Arabic Test',Icons.abc_sharp),
                    // shap('Math Test', Icons.calculate_outlined),
                    //        shap('Medical Test',Icons.medical_services_outlined),
                    //        shap('Chamistry Test', Icons.biotech_sharp),
                    //    shap('Phaysis Test', Icons.airline_stops_outlined)
                    //   ],
                    ),
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
                  labelText: 'AddQuestion'.tr,
                  labelStyle: TextStyle(
                      color: Color.fromARGB(255, 246, 123, 127),
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
                  controller.Addtest.value.test = value;
                  controller.nowTest.value.test = value;
                  //////save for id test
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
                decoration:  InputDecoration(
                  labelText: 'AddCorrectAnswer'.tr,
                  labelStyle: TextStyle(
                      color: Color.fromARGB(255, 246, 123, 127),
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
                onChanged: (String value) {
                  controller.answer1.value.answer = value;
                  controller.answer1.value.CorrectAnswer = true;
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
                decoration:  InputDecoration(
                  labelText: 'AddFirstChoose'.tr,
                  labelStyle: TextStyle(
                      color: Color.fromARGB(255, 246, 123, 127),
                      fontWeight: FontWeight.bold),
                ),
                onChanged: (String value) {
                  controller.answer2.value.answer = value;
                  controller.answer2.value.CorrectAnswer = false;
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
                decoration:  InputDecoration(
                  labelText: 'AddSecondChoose'.tr,
                  labelStyle: TextStyle(
                      color: Color.fromARGB(255, 246, 123, 127),
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
                onChanged: (String value) {
                  controller.answer3.value.answer = value;
                  controller.answer3.value.CorrectAnswer = false;
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
                decoration:  InputDecoration(
                  labelText: 'AddThiredChoose'.tr,
                  labelStyle: TextStyle(
                      color: Color.fromARGB(255, 246, 123, 127),
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
                onChanged: (String value) {
                  controller.answer4.value.answer = value;
                  controller.answer4.value.CorrectAnswer = false;
                },
              ),
            ),
          ),
        ),
        Tooltip(
          message: 'SaveTest'.tr,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Align(
              alignment: Alignment.topRight,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromARGB(255, 42, 42, 114),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(126)),
                    padding: const EdgeInsets.symmetric(
                        vertical: 17, horizontal: 17)),
                onPressed: () async {
                  if (_formfield.currentState!.validate()) {
                    await controller.addQution(controller.nowTest.value);

                    var idTest =
                        await controller.GetId(controller.nowTest.value.test!);

                    controller.answer1.value.IdTest = idTest;
                    await controller.addAnswer(controller.answer1.value);
                    controller.answer2.value.IdTest = idTest;
                    await controller.addAnswer(controller.answer2.value);
                    controller.answer3.value.IdTest = idTest;
                    await controller.addAnswer(controller.answer3.value);
                    controller.answer4.value.IdTest = idTest;
                    await controller.addAnswer(controller.answer4.value);

                    print("DataAdded".tr);
                  }
                },
                child:  Text('Save'.tr),
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
                                border: Border.all(color: Colors.blueAccent)),
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
                                            "el".tr,
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
                                          controller.textadd,
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
      ]))),
    );
  }

  Widget shap(String title, int id
      // IconData iconData
      ) {
    return Padding(
      padding: const EdgeInsets.all(6.0),
      child: Material(
        child: InkWell(
          onTap: () {
            controller.nowTest.value.IdContent = id;
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
