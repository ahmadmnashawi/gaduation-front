import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/test_controller.dart';

class AddTestPageView extends GetResponsiveView<TestController> {
  final _formfield = GlobalKey<FormState>();

  AddTestPageView({super.key});
  @override
  Widget builder() {
    return Form(
      key: _formfield,
      child: Material(
          child: SingleChildScrollView(
              child: Column(children: [
        Text('AddNewTest'.tr,
            style: const TextStyle(
                fontSize: 26,
                fontWeight: FontWeight.bold,
                decoration: TextDecoration.none,
                color: Color.fromARGB(255, 42, 42, 114),
                fontFamily: "Pacifico")),
        Material(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: SizedBox(
              width: 350,
              height: 60,
              child: TextFormField(
                decoration: InputDecoration(
                  labelText: 'AddQuestion'.tr,
                  labelStyle: const TextStyle(
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
                decoration: InputDecoration(
                  labelText: 'AddCorrectAnswer'.tr,
                  labelStyle: const TextStyle(
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
                decoration: InputDecoration(
                  labelText: 'AddFirstChoose'.tr,
                  labelStyle: const TextStyle(
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
                decoration: InputDecoration(
                  labelText: 'AddSecondChoose'.tr,
                  labelStyle: const TextStyle(
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
                decoration: InputDecoration(
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
                    await controller.addAllQution();
                  }
                },
                child: Text('Save'.tr),
              ),
            ),
          ),
        ),
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
