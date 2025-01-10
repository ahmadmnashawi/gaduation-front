import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:graduationproject/api/ui/help_page.dart';

import '../../../api/ui/util.dart';
import '../../../app/model/content.dart';
import '../../sheard/text_feild_GP.dart';
import '../controller/group_controller.dart';
import 'post_Group.dart';

class AddGroup extends GetResponsiveView<GroupController> {
  AddGroup({super.key});
  @override
  Widget builder() {
    return Scaffold(
      body: SingleChildScrollView(
        child: Form(
          key: controller.formFieldGroup,
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
                    padding: const EdgeInsets.all(8.0),
                    child: Center(
                      child: Text(
                        "add".tr,
                        style: const TextStyle(
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
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                    decoration: BoxDecoration(
                        border: Border.all(
                            color: const Color.fromARGB(255, 194, 192, 192)),
                        borderRadius: BorderRadius.circular(10)),
                    child: Obx(() => DropdownButton<Content>(
                        isExpanded: true,
                        underline: const SizedBox(),
                        value: controller.selectContentGroup.value,
                        items: controller.contents
                            .map((element) => DropdownMenuItem<Content>(
                                value: element,
                                child: Text(element.typeName.toString(),
                                    style: const TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black54,
                                        decoration: TextDecoration.none))))
                            .toList(),
                        onChanged: (value) {
                          controller.selectContentGroup.value = value!;
                        }))),
              ),
              imageProfile(),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Material(
                    child: SizedBox(
                        width: 450,
                        child: TextFieldGPWidget(
                          obscureText: false,
                          type: TextInputType.text,
                          dufaltText:
                              controller.addnewGroup.value.groupName ?? '',
                          label: 'NameGroup'.tr,
                          validator: (value) {
                            if (value!.isEmpty ||
                                !RegExp(r"^[a-zA-Z0-9.!#$%&'*+-/+?^_`{|}~]")
                                    .hasMatch(value)) {
                              return "EnterCorrectText".tr;
                            } else {
                              return null;
                            }
                          },
                          prefIcon: Icons.abc_outlined,
                          onChanged: (value) {
                            controller.addnewGroup.value.groupName = value;
                          },
                        ))),
              ),
              SizedBox(
                  width: 450,
                  child: TextFieldGPWidget(
                    obscureText: false,
                    type: TextInputType.multiline,
                    dufaltText: controller.addnewGroup.value.Description ?? '',
                    label: 'DescrintionAbout'.tr,
                    validator: (value) {
                      if (value!.isEmpty ||
                          !RegExp(r"^[a-zA-Z0-9.!#$%&'*+-/+?^_`{|}~]")
                              .hasMatch(value)) {
                        return "EnterCorrectText".tr;
                      } else {
                        return null;
                      }
                    },
                    prefIcon: Icons.text_fields,
                    onChanged: (value) {
                      controller.addnewGroup.value.Description = value;
                    },
                  )),
              const SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Align(
                  alignment: Alignment.topRight,
                  child: TextButton(
                      onPressed: () {
                        Get.dialog(Align(
                          alignment: Alignment.center,
                          child: Container(
                            width: 500,
                            height: 370,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10),
                                border: Border.all(color: Colors.blueAccent)),
                            child: SingleChildScrollView(
                              child: Column(
                                children: [
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Align(
                                      alignment: Alignment.center,
                                      child: Padding(
                                        //////////////////////////////////////////
                                        padding: const EdgeInsets.all(8.0),
                                        child: Text(
                                          "Addposttt".tr,
                                          style: const TextStyle(
                                              fontSize: 18,
                                              fontWeight: FontWeight.bold,
                                              fontFamily: "Pacifico",
                                              color: Colors.blueGrey,
                                              decoration: TextDecoration.none),
                                        ),
                                      )),
                                  Container(
                                    child: PostGrpoup(),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ));
                      },
                      child: Text(
                        'areyou'.tr,
                        style: const TextStyle(
                            color: Colors.black54,
                            fontSize: 16,
                            fontWeight: FontWeight.bold),
                      )),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ElevatedButton(
                  onPressed: () async {
                    if (controller.formFieldGroup.currentState!.validate()) {
                      print("DataAdded".tr);
                      await controller.AddGroup();
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
                    'AddGroup'.tr,
                    style: const TextStyle(fontSize: 20, color: Colors.white),
                  ),
                ),
              ),
              HelpPage(
                title: controller.textaddgroup,
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget imageProfile() {
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
                        : controller.addnewGroup.value.Image == null
                            ? Image.asset(
                                'assets/images/boy.gif',
                                width: 200,
                                height: 200,
                              )
                            : Utility.imageFromBase64String(
                                Utility.base64String(
                                    controller.addnewGroup.value.Image!),
                                200,
                                200),
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
              style: const TextStyle(fontSize: 18),
            ),
          ),
          const SizedBox(
            height: 20,
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
    ),
    backgroundColor: Colors.white,
    elevation: 0,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(10),
    ),
  );
}
