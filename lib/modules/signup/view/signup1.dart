import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../genereted/sheard/util.dart';
import '../controller/signup.dart';

class signupage extends GetResponsiveView<SignUpController> {
  @override
  final _formfield = GlobalKey<FormState>();
  final emailcontroller = TextEditingController();
  final passcontroller = TextEditingController();

  Uint8List? image;

  signupage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                child: Icon(Icons.arrow_back_ios, size: 20, color: Colors.grey),
              ),
            ),
          ),
          const SizedBox(
            width: 10,
            height: 25,
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              'SignUp'.tr,
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 40,
                  color: Color.fromARGB(255, 42, 42, 114),
                  fontFamily: "Pacifico"),
            ),
          ),
          const SizedBox(
            width: 10,
            height: 30,
          ),
          Padding(
              padding: const EdgeInsets.fromLTRB(0, 0, 10, 10),
              child: Text(
                'CreateYourAccount'.tr,
                textAlign: TextAlign.left,
                style: TextStyle(color: Colors.grey[600]),
              )),
          Center(
              child: Column(
            children: [
              const SizedBox(width: 170),
              Material(child: Imageprofile(controller)),
            ],
          )),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: SizedBox(
              width: 450,
              child: TextFormField(
                decoration: InputDecoration(
                    prefixIcon: const Icon(
                      Icons.person_outline,
                      color: Color.fromARGB(255, 246, 123, 127),
                    ),
                    labelText: 'EnterYourName'.tr,
                    enabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                          width: 3, color: Color.fromARGB(255, 42, 42, 114)),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                          width: 3, color: Color.fromARGB(255, 42, 42, 114)),
                      borderRadius: BorderRadius.circular(15),
                    )),
                onChanged: (value) {
                  controller.user.value.Name = value;
                },
                validator: (value) {
                  // for number
                  if (value!.isEmpty ||
                      !RegExp(r'^[a-z A-Z]+$').hasMatch(value)) {
                    return "EnterCorrectName".tr;
                  } else {
                    return null;
                  }
                },
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: SizedBox(
              width: 450,
              child: TextFormField(
                decoration: InputDecoration(
                    prefixIcon: const Icon(
                      Icons.person_outline,
                      color: Color.fromARGB(255, 246, 123, 127),
                    ),
                    labelText: 'EnterUserName'.tr,
                    enabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                          width: 3, color: Color.fromARGB(255, 42, 42, 114)),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                          width: 3, color: Color.fromARGB(255, 42, 42, 114)),
                      borderRadius: BorderRadius.circular(15),
                    )),
                onChanged: (value) {
                  controller.user.value.UserName = value;
                },
                validator: (value) {
                  if (value!.isEmpty ||
                      !RegExp(r'^[a-z A-Z]+$').hasMatch(value)) {
                    return "EnterCorrectUserName".tr;
                  } else {
                    return null;
                  }
                },
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: SizedBox(
                width: 450,
                child: Obx(() => TextField(
                      controller: TextEditingController(
                        text: DateFormat("dd.MM.yyyy")
                            .format(controller.selectedDate.value)
                            .toString(),
                      ),
                      decoration: InputDecoration(
                          prefixIcon: const Icon(
                            Icons.date_range,
                            color: Color.fromARGB(255, 246, 123, 127),
                          ),
                          labelText: 'DateBirth'.tr,
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
                      onTap: () async {
                        await controller.chooseDate(context);
                      },
                    ))),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: SizedBox(
              width: 450,
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
                          width: 3, color: Color.fromARGB(255, 42, 42, 114)),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                          width: 3, color: Color.fromARGB(255, 42, 42, 114)),
                      borderRadius: BorderRadius.circular(15),
                    )),
                onChanged: (value) {
                  controller.user.value.Email = value;
                },
                validator: (value) {
                  bool emailvalue = RegExp(
                          r"^[a-zA-Z0-9.!#$%&'*+-/+?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                      .hasMatch(value!);
                  if (value.isEmpty) {
                    return " EnterEmail".tr;
                  } else if (!emailvalue) {
                    return " EnterCorrectEmail".tr;
                  }
                  return null;
                },
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
                    onChanged: (value) {
                      controller.user.value.Password = value;
                    },
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "EnterPassword".tr;
                      } else if (passcontroller.text.length < 6 &&
                          passcontroller.text.length > 15) {
                        return "PasswordLengthShouldBeMoreThan6Charachters".tr;
                      }
                      return null;
                    },
                  ),
                ),
              )),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: SizedBox(
              width: 450,
              child: TextFormField(
                decoration: InputDecoration(
                    prefixIcon: const Icon(
                      Icons.cast_for_education,
                      color: Color.fromARGB(255, 246, 123, 127),
                    ),
                    labelText: 'EnterEducation'.tr,
                    enabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                          width: 3, color: Color.fromARGB(255, 42, 42, 114)),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                          width: 3, color: Color.fromARGB(255, 42, 42, 114)),
                      borderRadius: BorderRadius.circular(15),
                    )),
                onChanged: (value) {
                  controller.user.value.Study = value;
                },
                validator: (value) {
                  if (value!.isEmpty ||
                      !RegExp(r'^[a-z A-Z]+$').hasMatch(value)) {
                    return "EnterCorrectEducation".tr;
                  } else {
                    return null;
                  }
                },
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: SizedBox(
              width: 450,
              child: TextFormField(
                decoration: InputDecoration(
                    prefixIcon: const Icon(
                      Icons.location_city,
                      color: Color.fromARGB(255, 246, 123, 127),
                    ),
                    labelText: 'EnterAdress'.tr,
                    enabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                          width: 3, color: Color.fromARGB(255, 42, 42, 114)),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                          width: 3, color: Color.fromARGB(255, 42, 42, 114)),
                      borderRadius: BorderRadius.circular(15),
                    )),
                onChanged: (value) {
                  controller.user.value.Address = value;
                },
                validator: (value) {
                  if (value!.isEmpty ||
                      !RegExp(r'^[a-z A-Z]+$').hasMatch(value)) {
                    return "EnterCorrectAdress".tr;
                  } else {
                    return null;
                  }
                },
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: SizedBox(
              width: 450,
              child: TextFormField(
                decoration: InputDecoration(
                    prefixIcon: const Icon(
                      Icons.money,
                      color: Color.fromARGB(255, 246, 123, 127),
                    ),
                    labelText: 'EnterPayBal'.tr,
                    enabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                          width: 3, color: Color.fromARGB(255, 42, 42, 114)),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                          width: 3, color: Color.fromARGB(255, 42, 42, 114)),
                      borderRadius: BorderRadius.circular(15),
                    )),
                onChanged: (value) {
                  controller.user.value.Paypal = value;
                },
                validator: (value) {
                  if (value!.isEmpty ||
                      !RegExp(r"^[a-zA-Z0-9.!#$%&'*+-/+?^_`{|}~]")
                          .hasMatch(value)) {
                    return "EnterCorrectPaybal".tr;
                  } else {
                    return null;
                  }
                },
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ElevatedButton(
              onPressed: () {
                if (_formfield.currentState!.validate()) {
                  print("Data Added Successfully");
                  controller.user.value.Age =
                      controller.selectedDate.value.toString();
                  controller.signUpUser();
                  // emailcontroller.clear();
                  // passcontroller.clear();
                  // Get.to(HomePage());
                }
              },
              style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromARGB(255, 42, 42, 114),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30)),
                  padding:
                      const EdgeInsets.symmetric(vertical: 20, horizontal: 50)),
              child: Text(
                'Confirm'.tr,
                style: TextStyle(fontSize: 20, color: Colors.white),
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
                                    padding: EdgeInsets.all(8.0),
                                    child: Align(
                                        alignment: Alignment.center,
                                        child: Padding(
                                          padding: EdgeInsets.all(8.0),
                                          child: Text(
                                            "Help".tr,
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
    ));
  }

  Widget Imageprofile(SignUpController controller) {
    return Center(
      child: Stack(
        children: <Widget>[
          Obx(() => CircleAvatar(
                radius: 80.0,
                //  borderRadius: BorderRadius.circular(100),
                child: controller.stringPickImage.value.isNotEmpty
                    ? Utility.imageFromBase64String(
                        controller.stringPickImage.value, 200, 200)
                    : image == null
                        ? Image.asset(
                            'assets/images/boy.gif',
                            width: 200,
                            height: 200,
                          )
                        : Utility.imageFromBase64String(
                            Utility.base64String(image!), 200, 200),
              )),
          Positioned(
              bottom: 20.0,
              right: 20.0,
              child: InkWell(
                onTap: () async {
                  openBottomSheet(controller);
                },
                child: const Icon(
                  Icons.camera_alt,
                  color: Color.fromARGB(255, 245, 146, 149),
                  size: 28.0,
                ),
              ))
        ],
      ),
    );
  }
}

void openBottomSheet(SignUpController controller) {
  Get.bottomSheet(
    Container(
      height: 120.0,
      width: 500,
      margin: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
      child: Column(
        children: [
          const SizedBox(height: 20),
          Center(
            child: Text(
              'ChoosePhoto'.tr,
              style: TextStyle(fontSize: 18),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              // Row(
              //   children: [
              //     FloatingActionButton(
              //       backgroundColor: const Color.fromARGB(255, 246, 123, 127),
              //       foregroundColor: Colors.white,
              //       mini: true,
              //       onPressed: () {
              //         controller.pickImageFun();
              //       },
              //       child: const Icon(Icons.camera),
              //     ),
              //     const Text('Camera'),
              //   ],
              // ),
              // const SizedBox(
              //   width: 10,
              // ),
              Row(
                children: [
                  FloatingActionButton(
                    backgroundColor: const Color.fromARGB(255, 246, 123, 127),
                    foregroundColor: Colors.white,
                    mini: true,
                    onPressed: () {
                      controller.pickImageFun();
                    },
                    child: const Icon(Icons.image),
                  ),
                  Text('Gallery'.tr),
                ],
              )
            ],
          ),
          // OutlinedButton(
          //   onPressed: () {
          //     Get.back();
          //   },
          //   child: const Text('Close'),
          // ),
        ],
      ),
    ),
    backgroundColor: Colors.white,
    elevation: 0,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(10),
    ),
  );
}
