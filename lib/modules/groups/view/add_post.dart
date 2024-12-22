import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../genereted/sheard/util.dart';
import '../controller/group_controller.dart';

class Addpostviewas extends GetResponsiveView<GroupController> {
  @override
  GroupController controller = Get.put(GroupController());
  final _formfield = GlobalKey<FormState>();
  Uint8List? image;

  Addpostviewas({super.key});

  // var dropdownvalue;
  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formfield,
      child: Column(children: [
        Material(
          child: InkWell(
            onTap: () => Get.back(),
            child: const Align(
              alignment: Alignment.topLeft,
              child: Padding(
                padding: EdgeInsets.all(8.0),
                child: Icon(Icons.arrow_back_ios, size: 20, color: Colors.grey),
              ),
            ),
          ),
        ),
        Center(
            child: Column(
          children: [
            const SizedBox(width: 170),
            Material(child: Imageprofile(controller)),
          ],
        )),
        Material(
            child: SizedBox(
          width: 300,
          child: TextFormField(
            decoration: InputDecoration(
              labelText: 'des'.tr,
              labelStyle: const TextStyle(
                  color: Colors.black45, fontWeight: FontWeight.bold),
              hintText: 'des'.tr,
              prefixIcon: const Icon(
                Icons.text_fields,
                color: Color.fromARGB(255, 245, 146, 149),
              ),
            ),
            onChanged: (value) {
              controller.newpost.value.Description = value;
            },
            validator: (value) {
              if (value!.isEmpty ||
                  !RegExp(r"^[a-zA-Z0-9.!#$%&'*+-/+?^_`{|}~]")
                      .hasMatch(value)) {
                return "EnterCorrectt".tr;
              } else {
                return null;
              }
            },
          ),
        )),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
                shadowColor: const Color.fromARGB(255, 42, 42, 114),
                // padding:
                //         const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
                backgroundColor: const Color.fromARGB(255, 42, 42, 114)),
            onPressed: () {
              if (_formfield.currentState!.validate()) {
                print("DataAdded".tr);
                controller.AddPost(true);
              }
            },
            child: Text(
              'Save'.tr,
              style: const TextStyle(
                  color: Colors.white, fontWeight: FontWeight.bold),
            ),
          ),
        ),
      ]),
    );
  }

  Widget Imageprofile(GroupController controller) {
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

void openBottomSheet(GroupController controller) {
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
              'Choose'.tr,
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
                    child: const Icon(Icons.camera),
                  ),
                  Text('Camera'.tr),
                ],
              ),
              const SizedBox(
                width: 10,
              ),
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
