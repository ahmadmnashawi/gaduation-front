import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getwidget/components/accordion/gf_accordion.dart';

import '../../genereted/sheard/util.dart';
import '../../sheard/text_feild_GP.dart';
import '../controller/profile_controller.dart';

class EditPostview extends GetResponsiveView<ProfileController> {
  @override
  ProfileController controller = Get.put(ProfileController());
  final _formfield = GlobalKey<FormState>();
  Uint8List? image;
  List<String> Contents = ['hi'.tr, 'ma'.tr, 'ar'.tr, 'eng'.tr, 'div'.tr];

  EditPostview({super.key});
  // var dropdownvalue;
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Padding(
        padding: const EdgeInsets.all(6),
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                  border: Border.all(
                      color: const Color.fromARGB(255, 194, 192, 192)),
                  borderRadius: BorderRadius.circular(10)),
              child: GFAccordion(
                title: "PostType".tr,
                textStyle: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    color: Color.fromARGB(255, 246, 123, 127),
                    decoration: TextDecoration.none),
                contentChild: Obx(() => Column(
                      children: controller.Contents.map((element) => TextButton(
                          onPressed: () {
                            controller.postidnew.value.IdContent = element.Id;
                          },
                          child: Text(element.typeName.toString(),
                              style: const TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black54,
                                  decoration: TextDecoration.none)))).toList(),
                    )),
              ),
            ),
            Material(
                child: SizedBox(
                    width: 300,
                    child: TextFieldGPWidget(
                      obscureText: false,
                      type: TextInputType.text,
                      label: 'Description'.tr,
                      validator: (value) {
                        if (value!.isEmpty ||
                            !RegExp(r"^[a-zA-Z0-9.!#$%&'*+-/+?^_`{|}~]")
                                .hasMatch(value)) {
                          return "EnterCorrectText".tr;
                        } else {
                          return null;
                        }
                      },
                      dufaltText: controller.postidnew.value.Description ?? "",
                      prefIcon: Icons.text_fields,
                      onChanged: (value) {
                        controller.postidnew.value.Description = value;
                      },
                    ))),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    shadowColor: const Color.fromARGB(255, 42, 42, 114),
                    backgroundColor: const Color.fromARGB(255, 42, 42, 114)),
                onPressed: () {
                  controller.UpdatePost();
                },
                child: Text(
                  'Save'.tr,
                  style: const TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold),
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
                                              controller.texteditpost,
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
      ),
    );
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
                    : controller.postidnew.value.Image == null
                        ? Image.asset(
                            'assets/images/boy.gif',
                            width: 200,
                            height: 200,
                          )
                        : Utility.imageFromBase64String(
                            Utility.base64String(
                                controller.postidnew.value.Image!),
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
