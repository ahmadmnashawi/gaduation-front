import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:getwidget/components/button/gf_button.dart';
import 'package:getwidget/getwidget.dart';
import 'package:graduationproject/app/model/group.dart';
import 'package:graduationproject/app/model/library.dart';
import 'package:graduationproject/app/model/user.dart';

import '../controller/premission_controller.dart';

class Givepermission extends GetResponsiveView<PermissionController> {
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Column(
        children: [
          Material(
            child: InkWell(
              onTap: () => Get.back(),
              child: const Align(
                alignment: Alignment.topLeft,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child:
                      Icon(Icons.arrow_back_ios, size: 20, color: Colors.grey),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(4),
            child: Container(
                decoration: BoxDecoration(
                    border: Border.all(
                        color: const Color.fromARGB(255, 194, 192, 192)),
                    borderRadius: BorderRadius.circular(10)),
                child: Obx(() => DropdownButton<User>(
                    isExpanded: true,
                    underline: const SizedBox(),
                    value: controller.currentUser.value,
                    items: controller.AllUser.map((element) =>
                            DropdownMenuItem<User>(
                                value: element,
                                child: Text(element.Name.toString(),
                                    style: const TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black54,
                                        decoration: TextDecoration.none))))
                        .toList(),
                    onChanged: (element) {
                      controller.userAccssebility.value.IdUser = element!.Id!;
                      controller.currentUser.value = element;
                    }))),
          ),
          Padding(
            padding: const EdgeInsets.all(4),
            child: Container(
                decoration: BoxDecoration(
                    border: Border.all(
                        color: const Color.fromARGB(255, 194, 192, 192)),
                    borderRadius: BorderRadius.circular(10)),
                child: Obx(() => DropdownButton<Library>(
                    isExpanded: true,
                    underline: const SizedBox(),
                    value: controller.currentLibrary.value,
                    items: controller.listLibrary
                        .map((element) => DropdownMenuItem<Library>(
                            value: element,
                            child: Text(element.libraryName.toString(),
                                style: const TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black54,
                                    decoration: TextDecoration.none))))
                        .toList(),
                    onChanged: (element) {
                      controller.currentLibrary.value = element!;
                      controller.userAccssebility.value.accessibility!
                          .AccessibilityType = 'Admain Library';
                      controller.userAccssebility.value.accessibility!.id =
                          element.Id;
                      controller.addUserpremissiont(
                          controller.userAccssebility.value);
                      controller.userAccssebility.value.accessibility!
                          .AccessibilityType = null;
                      controller.userAccssebility.value.accessibility!.id =
                          null;
                    }))),
          ),
          Padding(
            padding: const EdgeInsets.all(4),
            child: Container(
                decoration: BoxDecoration(
                    border: Border.all(
                        color: const Color.fromARGB(255, 194, 192, 192)),
                    borderRadius: BorderRadius.circular(10)),
                child: Obx(() => DropdownButton<Group>(
                    isExpanded: true,
                    underline: const SizedBox(),
                    value: controller.currentGroup.value,
                    items: controller.AllGroups.map((element) =>
                            DropdownMenuItem<Group>(
                                value: element,
                                child: Text(element.groupName.toString(),
                                    style: const TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black54,
                                        decoration: TextDecoration.none))))
                        .toList(),
                    onChanged: (element) {
                      controller.currentGroup.value = element!;
                      controller.userAccssebility.value.accessibility!
                          .AccessibilityType = 'Admain Group';
                      controller.userAccssebility.value.accessibility!.id =
                          element.Id;
                      controller.addUserpremissiont(
                          controller.userAccssebility.value);
                      controller.userAccssebility.value.accessibility!
                          .AccessibilityType = null;
                      controller.userAccssebility.value.accessibility!.id =
                          null;
                    }))),
          ),
          Column(
            children: [
              checkShose(' All Permission'),
              checkShose('Add New Group'),
              checkShose('Add New Refrence'),
              checkShose('Add New  Test'),
              checkShose('Add New Library'),
              checkShose('Delete Librarys'),
              checkShose('Delete Groups'),
              checkShose('Delete Refrence'),
              checkShose('Delete Test'),
            ],
          ),
          Center(
            child: Material(
              child: GFButton(
                color: Color.fromARGB(255, 42, 42, 114),
                onPressed: () {
                  Get.snackbar(
                    'Save ',
                    "All Permissions Are Added To " +
                        controller.currentUser.value.Name.toString(),
                    //  icon: Icon(Icons.person, color: Colors.white),
                    snackPosition: SnackPosition.BOTTOM,
                    backgroundColor: Color.fromARGB(255, 246, 123, 127),
                    borderRadius: 20,
                    margin: EdgeInsets.all(15),
                    colorText: Colors.white,
                    duration: Duration(seconds: 4),
                    isDismissible: true,
                    //  dismissDirection: SnackDismissDirection.HORIZONTAL,
                    forwardAnimationCurve: Curves.easeOutBack,
                  );
                },
                text: "Save",
                textStyle: TextStyle(color: Colors.white),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget checkShose(String text) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: 40,
        decoration: BoxDecoration(
            border: Border.all(color: Color.fromARGB(255, 194, 192, 192)),
            borderRadius: BorderRadius.circular(10)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                text,
                style: TextStyle(
                    color: Colors.black54,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    decoration: TextDecoration.none),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Material(
                child: GFIconButton(
                  color: Color.fromARGB(255, 246, 123, 127),
                  onPressed: () async {
                    controller.userAccssebility.value.accessibility!
                        .AccessibilityType = text;
                    await controller
                        .addUserpremissiont(controller.userAccssebility.value);
                    controller.userAccssebility.value.accessibility!
                        .AccessibilityType = null;
                    controller.userAccssebility.value.accessibility!.id = null;
                    controller.isChecked.value = true;
                  },
                  icon: Icon(
                    Icons.check,
                    size: 10,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
