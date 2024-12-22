import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:graduationproject/modules/profile/controller/profile_controller.dart';
import 'package:graduationproject/modules/profile/view/profile.dart';

import '../../genereted/sheard/util.dart';
import '../../sheard/text_feild_GP.dart';

class EditProfileview extends GetResponsiveView<ProfileController> {
  final _formfield = GlobalKey<FormState>();
  final emailcontroller = TextEditingController();
  final passcontroller = TextEditingController();
  Uint8List? image;

  EditProfileview({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Form(
        key: _formfield,
        child: Column(children: [
          Row(
            children: [
              InkWell(
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
              Align(
                alignment: Alignment.centerLeft,
                child: Text('EditProfile'.tr,
                    style: const TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                        decoration: TextDecoration.none,
                        color: Color.fromARGB(255, 246, 123, 127),
                        fontFamily: "Pacifico")),
              ),
            ],
          ),
          const SizedBox(
            width: 10,
            height: 30,
          ),
          Padding(
              padding: const EdgeInsets.fromLTRB(0, 0, 10, 10),
              child: Text(
                'EditYourAccount'.tr,
                textAlign: TextAlign.left,
                style: TextStyle(
                    color: Colors.grey[400], fontWeight: FontWeight.bold),
              )),
          // Center(
          //     child: Column(
          //   children: [
          //     const SizedBox(width: 170),
          //     Material(child: Imageprofile(controller)),
          //   ],
          // )),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: SizedBox(
              width: 450,
              child: TextFieldGPWidget(
                obscureText: false,
                type: TextInputType.name,
                label: 'Name'.tr,
                validator: (value) {
                  if (value!.isEmpty ||
                      !RegExp(r'^[a-z A-Z]+$').hasMatch(value)) {
                    return "EnterCorrectName".tr;
                  } else {
                    return null;
                  }
                },
                dufaltText: controller.user.value.Name ?? '',
                prefIcon: Icons.person_outline,
                onChanged: (val) {
                  controller.user.value.Name = val;
                },
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: SizedBox(
              width: 450,
              child: TextFieldGPWidget(
                obscureText: false,
                type: TextInputType.text,
                label: 'EnterNewUserName'.tr,
                validator: (value) {
                  if (value!.isEmpty ||
                      !RegExp(r'^[a-z A-Z]+$').hasMatch(value)) {
                    return "EnterCorrectUserName".tr;
                  } else {
                    return null;
                  }
                },
                dufaltText: controller.user.value.UserName ?? '',
                prefIcon: Icons.person_outline,
                onChanged: (val) {
                  controller.user.value.UserName = val;
                },
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: SizedBox(
              width: 450,
              child: TextFieldGPWidget(
                obscureText: false,
                type: TextInputType.text,
                label: 'EnterYourNewAge'.tr,
                validator: (value) {
                  if (value!.isEmpty ||
                      !RegExp(r'^[1-9]{1}+$').hasMatch(value)) {
                    return 'EnterYourNewAge'.tr;
                  } else {
                    return null;
                  }
                },
                dufaltText: controller.user.value.Age ?? '',
                prefIcon: Icons.numbers,
                onChanged: (val) {
                  controller.user.value.Age = val;
                },
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: SizedBox(
              width: 450,
              child: TextFieldGPWidget(
                obscureText: false,
                type: TextInputType.text,
                label: 'EnterNewEmail'.tr,
                validator: (value) {
                  bool emailvalue = RegExp(
                          r"^[a-zA-Z0-9.!#$%&'*+-/+?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                      .hasMatch(value!);
                  if (value.isEmpty) {
                    return 'EnterNewEmail'.tr;
                  } else if (!emailvalue) {
                    return "EnterCorrectEmail".tr;
                  }
                  return null;
                },
                dufaltText: controller.user.value.Email ?? '',
                prefIcon: Icons.email,
                onChanged: (val) {
                  controller.user.value.Email = val;
                },
              ),
            ),
          ),
          Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                width: 450,
                child: Obx(
                  () => TextFieldGPWidget(
                    obscureText: false,
                    type: TextInputType.text,
                    label: 'EnterNewPassword'.tr,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "EnterPassword".tr;
                      } else if (passcontroller.text.length < 6) {
                        return "PasswordLengthShouldBeMoreThan6Charachters".tr;
                      }
                      return null;
                    },
                    dufaltText: controller.user.value.Password ?? '',
                    prefIcon: Icons.lock,
                    onChanged: (val) {
                      controller.user.value.Password = passcontroller.text;
                    },
                  ),
                ),
              )),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: SizedBox(
              width: 450,
              child: TextFieldGPWidget(
                obscureText: false,
                type: TextInputType.text,
                label: 'EnterNewEducation'.tr,
                validator: (value) {
                  if (value!.isEmpty ||
                      !RegExp(r'^[a-z A-Z]+$').hasMatch(value)) {
                    return "EnterCorrectEducation".tr;
                  } else {
                    return null;
                  }
                },
                dufaltText: controller.user.value.Study ?? '',
                prefIcon: Icons.cast_for_education,
                onChanged: (val) {
                  controller.user.value.Study = val;
                },
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: SizedBox(
              width: 450,
              child: TextFieldGPWidget(
                obscureText: false,
                type: TextInputType.text,
                label: 'EnterNewAdress'.tr,
                validator: (value) {
                  if (value!.isEmpty ||
                      !RegExp(r'^[a-z A-Z]+$').hasMatch(value)) {
                    return "EnterCorrectAdress".tr;
                  } else {
                    return null;
                  }
                },
                dufaltText: controller.user.value.Address ?? '',
                prefIcon: Icons.location_city,
                onChanged: (val) {
                  controller.user.value.Address = val;
                },
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: SizedBox(
                width: 450,
                child: TextFieldGPWidget(
                  obscureText: false,
                  type: TextInputType.text,
                  label: 'EnterNewPayBal'.tr,
                  validator: (value) {
                    if (value!.isEmpty ||
                        !RegExp(r"^[a-zA-Z0-9.!#$%&'*+-/+?^_`{|}~]")
                            .hasMatch(value)) {
                      return "EnterCorrectPaybal".tr;
                    } else {
                      return null;
                    }
                  },
                  dufaltText: controller.user.value.Paypal ?? '',
                  prefIcon: Icons.money,
                  onChanged: (val) {
                    controller.user.value.Paypal = val;
                  },
                )),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ElevatedButton(
              onPressed: () {
                controller.Updateprofile();
                Get.snackbar(
                  'Finish'.tr,
                  "UpdatingValues".tr,
                  icon: const Icon(Icons.person, color: Colors.white),
                  snackPosition: SnackPosition.BOTTOM,
                  backgroundColor: const Color.fromARGB(255, 246, 123, 127),
                  borderRadius: 20,
                  margin: const EdgeInsets.all(15),
                  colorText: Colors.white,
                  duration: const Duration(seconds: 4),
                  isDismissible: true,
                  forwardAnimationCurve: Curves.easeOutBack,
                );
                Get.to(Profileview());
                // if (_formfield.currentState!.validate()) {
                //   print("Data Added Successfully");

                //   Get.to(HomePage());
                // }
              },
              style: ElevatedButton.styleFrom(
                  shadowColor: const Color.fromARGB(255, 42, 42, 114),
                  backgroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30)),
                  padding:
                      const EdgeInsets.symmetric(vertical: 20, horizontal: 50)),
              child: Text(
                'UpdateProfile'.tr,
                style: const TextStyle(
                    fontSize: 20,
                    color: Color.fromARGB(255, 246, 123, 127),
                    fontWeight: FontWeight.bold),
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
                                            controller.texteditprofile,
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
        ]),
      ),
    ));
  }

  Widget Imageprofile(ProfileController controller) {
    return Center(
      child: Stack(
        children: <Widget>[
          Obx(() => CircleAvatar(
                radius: 80.0,
                //  borderRadius: BorderRadius.circular(100),
                child: controller.stringPickImage.value.isNotEmpty
                    ? Utility.imageFromBase64String(
                        controller.stringPickImage.value, 200, 200)
                    : controller.user.value.Image == null
                        ? Image.asset(
                            'assets/images/boy.gif',
                            width: 200,
                            height: 200,
                          )
                        : Utility.imageFromBase64String(
                            Utility.base64String(controller.user.value.Image!),
                            200,
                            200),
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

void openBottomSheet(ProfileController controller) {
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
              style: const TextStyle(fontSize: 18),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
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
