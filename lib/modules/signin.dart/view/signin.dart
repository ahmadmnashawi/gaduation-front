import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../routes/app_pages.dart';
import '../controller/signin_controller.dart';
//import 'package:getwidget/getwidget.dart';

class SignInViewPage extends GetView<SignIncontroller> {
  @override
  final _formfield = GlobalKey<FormState>();
  final emailcontroller = TextEditingController();
  final passcontroller = TextEditingController();

  SignInViewPage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Form(
          key: _formfield,
          child: Column(children: [
            InkWell(
              onTap: () => Get.back(),
              child: const Align(
                alignment: Alignment.topLeft,
                child: Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Icon(Icons.arrow_back_ios,
                      size: 20, color: Color.fromARGB(255, 42, 42, 114)),
                ),
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            Center(
              child: Text(
                'welcom'.tr,
                style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 40,
                    color: Color.fromARGB(255, 42, 42, 114),
                    fontFamily: "Pacifico"),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                  width: 400,
                  height: 250,
                  child: Image.asset('assets/images/9.png')),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                width: 450,
                child: Material(
                  child: TextFormField(
                    controller: emailcontroller,
                    decoration: InputDecoration(
                        prefixIcon: const Icon(
                          Icons.email,
                          color: Color.fromARGB(255, 246, 123, 127),
                        ),
                        labelText: 'EnterEmail'.tr,
                        enabledBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                              width: 3,
                              color: Color.fromARGB(255, 42, 42, 114)),
                          borderRadius: BorderRadius.circular(15),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                              width: 3,
                              color: Color.fromARGB(255, 42, 42, 114)),
                          borderRadius: BorderRadius.circular(15),
                        )),
                    validator: (value) {
                      bool emailvalue = RegExp(
                              r"^[a-zA-Z0-9.!#$%&'*+-/+?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                          .hasMatch(value!);
                      if (value.isEmpty) {
                        return "EnterEmail".tr;
                      } else if (!emailvalue) {
                        return "EnterCorrectEmail".tr;
                      }
                      return null;
                    },
                    onChanged: (Value) {
                      controller.email.value = Value;
                    },
                  ),
                ),
              ),
            ),
            Padding(
                padding: const EdgeInsets.all(8.0),
                child: SizedBox(
                  width: 450,
                  child: Obx(
                    () => TextFormField(
                      controller: passcontroller,
                      obscureText: controller.passtoggle.value,
                      decoration: InputDecoration(
                          prefixIcon: const Icon(
                            Icons.lock,
                            color: Color.fromARGB(255, 246, 123, 127),
                          ),
                          suffixIcon: InkWell(
                            onTap: () {
                              controller.passtoggle.value =
                                  !controller.passtoggle.value;
                            },
                            child: Icon(controller.passtoggle.value
                                ? Icons.visibility
                                : Icons.visibility_off),
                          ),
                          labelText: 'EnterPassword'.tr,
                          enabledBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                                width: 3,
                                color: Color.fromARGB(255, 42, 42, 114)),
                            borderRadius: BorderRadius.circular(15),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                                width: 3,
                                color: Color.fromARGB(255, 42, 42, 114)),
                            borderRadius: BorderRadius.circular(15),
                          )),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "EnterPassword".tr;
                        }
                        // } else if (passcontroller.text.length < 6) {
                        //   return "PasswordLengthShouldBeMoreThan6Charachters".tr;
                        // }
                        return null;
                      },
                      onChanged: (value) {
                        controller.password.value = value;
                      },
                    ),
                  ),
                )),
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 0, 8, 0),
              child: Align(
                  alignment: Alignment.bottomRight,
                  child: TextButton(
                      onPressed: () {
                        Get.rootDelegate.toNamed(Routes.password);
                      },
                      child: Text(
                        'ForgetYourPassword'.tr,
                        style: TextStyle(color: Colors.grey[600]),
                      ))),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(8, 35, 8, 8),
              child: ElevatedButton(
                onPressed: () {
                  if (_formfield.currentState!.validate()) {
                    controller.SignIn();
                  }
                },
                style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromARGB(255, 42, 42, 114),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30)),
                    padding: const EdgeInsets.symmetric(
                        vertical: 20, horizontal: 50)),
                child: Text(
                  'SignIn'.tr,
                  style: const TextStyle(fontSize: 20, color: Colors.white),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(
                onPressed: () {
                  Get.rootDelegate.toNamed(Routes.signup);
                },
                style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromARGB(255, 42, 42, 114),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30)),
                    padding: const EdgeInsets.symmetric(
                        vertical: 20, horizontal: 50)),
                child: Text(
                  'SignUp'.tr,
                  style: const TextStyle(fontSize: 20, color: Colors.white),
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
                                  border: Border.all(color: Colors.blueAccent)),
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
                                            padding: const EdgeInsets.all(8.0),
                                            child: Text(
                                              "Help".tr,
                                              style: const TextStyle(
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
                                            controller.text,
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
            )
          ]),
        ),
      ),
    );
  }
}
