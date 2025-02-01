import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getwidget/getwidget.dart';
import 'package:graduationproject/app/model/Accsessbuility.dart';
import 'package:graduationproject/app/model/library.dart';
import 'package:graduationproject/app/model/refrence.dart';
import 'package:graduationproject/app/model/test.dart';

import '../../../app/model/group.dart';
import '../../../app/model/user.dart';
import '../controller/premission_controller.dart';

class GiveUserPermission extends GetResponsiveView<PermissionController> {
  GiveUserPermission({super.key});
  @override
  Widget builder() {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                    onPressed: () {
                      Get.back();
                    },
                    icon: const Icon(Icons.arrow_back_ios_new_outlined)),
                const Text('All Permission with All User'),
                const SizedBox()
              ],
            ),
            !controller.auth.isAdmin()
                ? const Text('You Dont Have ACCESS to Give Access')
                : Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      typeCard('Give Premission'),
                    ],
                  ),
            Obx(() => SingleChildScrollView(
                  child: Column(
                      children: controller.accssAllPram
                          .map((e) => userShap(e))
                          .toList()),
                )),
          ],
        ),
      ),
    );
  }

  Widget typeCard(String Type) {
    return InkWell(
      onTap: () async {
        await controller.getAllUser();
        Get.dialog(
          Material(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                IconButton(
                    onPressed: () {
                      Get.back();
                    },
                    icon: const Icon(Icons.arrow_back_ios)),
                Column(
                  children: [
                    const Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text('Choose User'),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(4),
                      child: Container(
                          decoration: BoxDecoration(
                              border: Border.all(
                                  color:
                                      const Color.fromARGB(255, 194, 192, 192)),
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
                                              decoration: TextDecoration
                                                  .none)))).toList(),
                              onChanged: (element) {
                                controller.userAccssebility.value.IdUser =
                                    element!.Id!;
                                controller.currentUser.value = element;
                              }))),
                    ),
                  ],
                ),
                Column(
                  children: [
                    const Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text('Choose Premission'),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(4),
                      child: Container(
                          decoration: BoxDecoration(
                              border: Border.all(
                                  color:
                                      const Color.fromARGB(255, 194, 192, 192)),
                              borderRadius: BorderRadius.circular(10)),
                          child: Obx(() => DropdownButton<Accessibility>(
                              isExpanded: true,
                              underline: const SizedBox(),
                              value: controller.currentAccessibility.value,
                              items: controller.listpermissin
                                  .map((element) => DropdownMenuItem<
                                          Accessibility>(
                                      value: element,
                                      child: Text(
                                          element.AccessibilityType.toString(),
                                          style: const TextStyle(
                                              fontSize: 18,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.black54,
                                              decoration:
                                                  TextDecoration.none))))
                                  .toList(),
                              onChanged: (element) {
                                controller.currentAccessibility.value =
                                    element!;
                                controller.userAccssebility.value
                                    .IdAccessibility = element.id;
                              }))),
                    ),
                  ],
                ),
                Divider(),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'This Premission Will Give For All ',
                    style: TextStyle(color: Colors.pinkAccent),
                  ),
                ),
                Column(
                  children: [
                    const Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text('Choose Group'),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(4),
                      child: Container(
                          decoration: BoxDecoration(
                              border: Border.all(
                                  color:
                                      const Color.fromARGB(255, 194, 192, 192)),
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
                                              decoration: TextDecoration
                                                  .none)))).toList(),
                              onChanged: (element) {
                                controller.currentGroup.value = element!;
                                controller.userAccssebility.value.IdGroup =
                                    element.Id;
                              }))),
                    ),
                  ],
                ),
                Column(
                  children: [
                    const Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text('Choose Library'),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(4),
                      child: Container(
                          decoration: BoxDecoration(
                              border: Border.all(
                                  color:
                                      const Color.fromARGB(255, 194, 192, 192)),
                              borderRadius: BorderRadius.circular(10)),
                          child: Obx(() => DropdownButton<Library>(
                              isExpanded: true,
                              underline: const SizedBox(),
                              value: controller.currentLibrary.value,
                              items: controller.listLibrary
                                  .map((element) => DropdownMenuItem<Library>(
                                      value: element,
                                      child: Text(
                                          element.libraryName.toString(),
                                          style: const TextStyle(
                                              fontSize: 18,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.black54,
                                              decoration:
                                                  TextDecoration.none))))
                                  .toList(),
                              onChanged: (element) {
                                controller.currentLibrary.value = element!;
                                controller.userAccssebility.value.IdLibrary =
                                    element.Id;
                              }))),
                    ),
                  ],
                ),
                Column(
                  children: [
                    const Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text('Choose Test'),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(4),
                      child: Container(
                          decoration: BoxDecoration(
                              border: Border.all(
                                  color:
                                      const Color.fromARGB(255, 194, 192, 192)),
                              borderRadius: BorderRadius.circular(10)),
                          child: Obx(() => DropdownButton<Test>(
                              isExpanded: true,
                              underline: const SizedBox(),
                              value: controller.currentTest.value,
                              items: controller.AllTest.map((element) =>
                                  DropdownMenuItem<Test>(
                                      value: element,
                                      child: Text(element.test.toString(),
                                          style: const TextStyle(
                                              fontSize: 18,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.black54,
                                              decoration: TextDecoration
                                                  .none)))).toList(),
                              onChanged: (element) {
                                controller.currentTest.value = element!;
                                controller.userAccssebility.value.IdTest =
                                    element.Id;
                              }))),
                    ),
                  ],
                ),
                Column(
                  children: [
                    const Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text('Choose Reference'),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(4),
                      child: Container(
                          decoration: BoxDecoration(
                              border: Border.all(
                                  color:
                                      const Color.fromARGB(255, 194, 192, 192)),
                              borderRadius: BorderRadius.circular(10)),
                          child: Obx(() => DropdownButton<Reference>(
                              isExpanded: true,
                              underline: const SizedBox(),
                              value: controller.currentReference.value,
                              items: controller.AllRefr.map((element) =>
                                  DropdownMenuItem<Reference>(
                                      value: element,
                                      child: Text(
                                          element.referenceName.toString(),
                                          style: const TextStyle(
                                              fontSize: 18,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.black54,
                                              decoration: TextDecoration
                                                  .none)))).toList(),
                              onChanged: (element) {
                                controller.currentReference.value = element!;
                                controller.userAccssebility.value.IdReference =
                                    element.Id;
                              }))),
                    ),
                  ],
                ),
                Center(
                  child: Material(
                    child: GFButton(
                      color: const Color.fromARGB(255, 42, 42, 114),
                      onPressed: () async {
                        await controller.GetAllUserAccess();
                        if (controller.listuserAccssebility.any((element) =>
                            element.IdAccessibility ==
                                controller
                                    .userAccssebility.value.IdAccessibility &&
                            element.IdUser ==
                                controller.userAccssebility.value.IdUser)) {
                          var userAcc = controller.listuserAccssebility
                              .where((element) =>
                                  element.IdAccessibility ==
                                      controller.userAccssebility.value
                                          .IdAccessibility &&
                                  element.IdUser ==
                                      controller.userAccssebility.value.IdUser)
                              .first;
                          controller.userAccssebility.value.Id = userAcc.Id;
                          controller.perRepo.UpdateUserAccessibility(
                              controller.userAccssebility.value);
                        } else {
                          controller.userAccssebility.value.Id = 0;
                          controller.perRepo.AddUserAccessibility(
                              controller.userAccssebility.value);
                        }
                        await controller.GetAllData();
                        Get.back();
                      },
                      text: "Save",
                      textStyle: const TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Card(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(Type, style: const TextStyle(color: Colors.pinkAccent)),
          ),
        ),
      ),
    );
  }

  Widget userShap(AllPram allPram) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: allPram.user!.Name == 'Admin'
          ? const SizedBox()
          : Card(
              child: Wrap(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(allPram.user!.Name ?? ''),
                      ),
                      controller.auth.isAdmin()
                          ? IconButton(
                              onPressed: () async {
                                await controller
                                    .getPramForEdit(allPram.user!.Id!);
                                Get.dialog(Material(
                                    child: Column(
                                  children: [
                                    IconButton(
                                        icon: const Icon(Icons.arrow_back_ios),
                                        onPressed: () {
                                          Get.back();
                                        }),
                                    Obx(() => Column(
                                        children: controller
                                            .allUserAccssebilityForEdit
                                            .map((r) => Card(
                                                  child: ListTile(
                                                    title: Row(
                                                      children: [
                                                        Text(r.type ?? ''),
                                                        Text(
                                                            ' : ${r.object!.groupName}')
                                                      ],
                                                    ),
                                                    subtitle: Text(r
                                                            .accessibility!
                                                            .AccessibilityType ??
                                                        ''),
                                                    trailing: IconButton(
                                                        onPressed: () async {
                                                          await controller.delUserpremission(
                                                              r.accessibility!
                                                                  .id!,
                                                              allPram.user!.Id!,
                                                              r.type!,
                                                              r.object!.id!);
                                                          Get.back();
                                                          await controller
                                                              .GetAllData();
                                                        },
                                                        icon:
                                                            Icon(Icons.delete)),
                                                  ),
                                                ))
                                            .toList())),
                                  ],
                                )));
                              },
                              icon: const Icon(Icons.edit))
                          : const SizedBox()
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12),
                    child: Wrap(
                      alignment: WrapAlignment.center,
                      runAlignment: WrapAlignment.center,
                      children: allPram.allType!
                          .map(
                            (e) => Padding(
                              padding: const EdgeInsets.all(7),
                              child: Card(
                                elevation: 7,
                                child: Column(
                                  children: [
                                    Text(e.type!),
                                    Column(
                                      children: e.access!
                                          .map(
                                            (q) => SizedBox(
                                              width: 200,
                                              child: CheckboxListTile(
                                                  title: Text(
                                                      q.AccessibilityType ??
                                                          ''),
                                                  subtitle: Text(
                                                      '${e.type!} { ${e.title} }'),
                                                  value: e.check,
                                                  onChanged: (value) {}),
                                            ),
                                          )
                                          .toList(),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          )
                          .toList(),
                    ),
                  )
                ],
              ),
            ),
    );
  }
}
