import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getwidget/getwidget.dart';

import '../../genereted/sheard/util.dart';
import '../controller/group_controller.dart';

class EditGrpoup extends GetResponsiveView<GroupController> {
  final _formfield = GlobalKey<FormState>();
  Uint8List? image;

  EditGrpoup({super.key});

  @override
  Widget builder() {
    return Scaffold(
      body: SingleChildScrollView(
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
                              size: 20, color: Colors.grey),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 100,
                  ),
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Center(
                      child: Text(
                        " UpdateGroup".tr,
                        style: TextStyle(
                            fontSize: 26,
                            fontWeight: FontWeight.bold,
                            fontFamily: "Pacifico",
                            color: Color.fromARGB(255, 42, 42, 114),
                            decoration: TextDecoration.none),
                      ),
                    ),
                  ),
                ],
              ),
              // Center(
              //     child: Column(
              //   children: [
              //     const SizedBox(width: 170),
              //     Material(child: Imageprofile(controller)),
              //   ],
              // )),
              Material(
                child: Padding(
                  padding: const EdgeInsets.all(6),
                  child: Container(
                    decoration: BoxDecoration(
                        border: Border.all(
                            color: const Color.fromARGB(255, 194, 192, 192)),
                        borderRadius: BorderRadius.circular(10)),
                    child: GFAccordion(
                      title: controller.currentGroup.value.content!.typeName
                          .toString(),
                      textStyle: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          color: Color.fromARGB(255, 246, 123, 127),
                          decoration: TextDecoration.none),
                      contentChild: Column(
                        children: controller.contents
                            .map((element) => TextButton(
                                onPressed: () {
                                  controller.currentGroup.value.IdContent =
                                      element.Id;
                                  controller.currentGroup.value.content =
                                      element;
                                },
                                child: Text(element.typeName.toString(),
                                    style: const TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black54,
                                        decoration: TextDecoration.none))))
                            .toList(),
                      ),
                    ),
                  ),
                ),
              ),

              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Material(
                    child: SizedBox(
                  width: 450,
                  child: TextFormField(
                    initialValue: controller.currentGroup.value.groupName,
                    decoration:  InputDecoration(
                      labelText: 'EditNameGroup'.tr,
                      labelStyle: TextStyle(
                          color: Colors.black45, fontWeight: FontWeight.bold),
                      hintText: 'NameGroup'.tr,
                      prefixIcon: Icon(
                        Icons.abc_outlined,
                        color: Color.fromARGB(255, 245, 146, 149),
                      ),
                    ),
                    onChanged: (value) {
                      controller.currentGroup.value.groupName = value;
                    },
                    validator: (value) {
                      if (value!.isEmpty ||
                          !RegExp(r"^[a-zA-Z0-9.!#$%&'*+-/+?^_`{|}~]")
                              .hasMatch(value)) {
                        return "EnterCorrect".tr;
                      } else {
                        return null;
                      }
                    },
                  ),
                )),
              ),
              SizedBox(
                width: 450,
                child: TextFormField(
                  initialValue: controller.currentGroup.value.Description,
                  decoration:  InputDecoration(
                    labelText: ' EditDescrintiona'.tr,
                    labelStyle: TextStyle(
                        color: Colors.black45, fontWeight: FontWeight.bold),
                    hintText: 'DescrintionAbout'.tr,
                    prefixIcon: Icon(
                      Icons.text_fields,
                      color: Color.fromARGB(255, 245, 146, 149),
                    ),
                  ),
                  keyboardType: TextInputType.multiline,
                  minLines: 1, //Normal textInputField will be displayed
                  maxLines: 5, // when user presses enter it will adapt to it
                  onChanged: (value) {
                    controller.currentGroup.value.Description = value;
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
              ),
              const SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ElevatedButton(
                  onPressed: () {
                    if (_formfield.currentState!.validate()) {
                      print("DataAdded".tr);
                      controller.UpdateGroup();
                    }
                  },
                  style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromARGB(255, 245, 146, 149),
                      shape: RoundedRectangleBorder(
                          //backgroundColor:Colors.accents,
                          borderRadius: BorderRadius.circular(30)),
                      padding: const EdgeInsets.symmetric(
                          vertical: 20, horizontal: 50)),
                  child: Text(
                    'EditGroupp'.tr,
                    style: TextStyle(fontSize: 20, color: Colors.white),
                  ),
                ),
              ),
              Material(
                child: Tooltip(
                  message: 'lp'.tr,
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
                                          padding: EdgeInsets.all(8.0),
                                          child: Align(
                                              alignment: Alignment.center,
                                              child: Padding(
                                                padding: EdgeInsets.all(8.0),
                                                child: Text(
                                                  "el".tr,
                                                  style: TextStyle(
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
                                                controller.texteditg,
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
      ),
    );
  }

  Widget Imageprofile(GroupController controller) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Center(
        child: Stack(
          children: <Widget>[
            Obx(() => Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    width: 500,
                    decoration: BoxDecoration(
                        border: Border.all(
                            color: const Color.fromARGB(255, 192, 189, 189))),
                    //    radius: 80.0,
                    //  borderRadius: BorderRadius.circular(100),
                    child: controller.stringPickImage.value.isNotEmpty
                        ? Utility.imageFromBase64String(
                            controller.stringPickImage.value, 200, 200)
                        : image == null
                            ? Image.asset(
                                'assets/images/group.png',
                                width: 200,
                                height: 200,
                                fit: BoxFit.fill,
                              )
                            : Utility.imageFromBase64String(
                                Utility.base64String(image!), 200, 200),
                  ),
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
              'ChoosePostt'.tr,
              style: TextStyle(fontSize: 18),
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
                   Text('Galleryy'.tr),
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
