import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getwidget/getwidget.dart';

import '../controller/premission_controller.dart';

class GiveUserPermission extends GetResponsiveView {
  @override
  PermissionController controller = Get.put(PermissionController());

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
                      typeCard(
                        'Group',
                        GFAccordion(
                          title: "Group".tr,
                          textStyle: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                              color: Color.fromARGB(255, 246, 123, 127),
                              decoration: TextDecoration.none),
                          contentChild: Obx(() => Column(
                                children: controller.AllGroups.map((element) =>
                                    TextButton(
                                        onPressed: () {
                                          controller.userAccssebility.value
                                              .IdGroup = element.Id;
                                        },
                                        child: Text(
                                            element.groupName.toString(),
                                            style: const TextStyle(
                                                fontSize: 18,
                                                fontWeight: FontWeight.bold,
                                                color: Colors.black54,
                                                decoration: TextDecoration
                                                    .none)))).toList(),
                              )),
                        ),
                      ),
                      typeCard(
                          'Library',
                          GFAccordion(
                            title: "Library".tr,
                            textStyle: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                                color: Color.fromARGB(255, 246, 123, 127),
                                decoration: TextDecoration.none),
                            contentChild: Obx(() => Column(
                                  children: controller.listLibrary
                                      .map((element) => TextButton(
                                          onPressed: () {
                                            controller.userAccssebility.value
                                                .IdLibrary = element.Id;
                                          },
                                          child: Text(
                                              element.libraryName.toString(),
                                              style: const TextStyle(
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.black54,
                                                  decoration:
                                                      TextDecoration.none))))
                                      .toList(),
                                )),
                          )),
                      typeCard(
                          'Test',
                          GFAccordion(
                            title: "Test".tr,
                            textStyle: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                                color: Color.fromARGB(255, 246, 123, 127),
                                decoration: TextDecoration.none),
                            contentChild: Obx(() => Column(
                                  children: controller.AllTest.map((element) =>
                                      TextButton(
                                          onPressed: () {
                                            controller.userAccssebility.value
                                                .IdTest = element.Id;
                                          },
                                          child: Text(element.test.toString(),
                                              style: const TextStyle(
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.black54,
                                                  decoration: TextDecoration
                                                      .none)))).toList(),
                                )),
                          )),
                      typeCard(
                          'Reference',
                          GFAccordion(
                            title: "Reference".tr,
                            textStyle: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                                color: Color.fromARGB(255, 246, 123, 127),
                                decoration: TextDecoration.none),
                            contentChild: Obx(() => Column(
                                  children: controller.AllRefr.map((element) =>
                                      TextButton(
                                          onPressed: () {
                                            controller.userAccssebility.value
                                                .IdReference = element.Id;
                                          },
                                          child: Text(
                                              element.referenceName.toString(),
                                              style: const TextStyle(
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.black54,
                                                  decoration: TextDecoration
                                                      .none)))).toList(),
                                )),
                          ))
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

  Widget typeCard(String Type, Widget data) {
    return InkWell(
      onTap: () {
        Get.dialog(
          Material(
            child: Align(
              alignment: Alignment.center,
              child: SizedBox(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    IconButton(
                        onPressed: () {
                          Get.back();
                        },
                        icon: const Icon(Icons.arrow_back_ios)),
                    GFAccordion(
                      title: "Premission".tr,
                      textStyle: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          color: Color.fromARGB(255, 246, 123, 127),
                          decoration: TextDecoration.none),
                      contentChild: Obx(() => Column(
                            children: controller.listpermissin
                                .map((element) => TextButton(
                                    onPressed: () {
                                      controller.userAccssebility.value
                                          .IdAccessibility = element.id;
                                    },
                                    child: Text(
                                        element.AccessibilityType.toString(),
                                        style: const TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.black54,
                                            decoration: TextDecoration.none))))
                                .toList(),
                          )),
                    ),
                    data,
                    Center(
                      child: Material(
                        child: GFButton(
                          color: const Color.fromARGB(255, 42, 42, 114),
                          onPressed: () async {
                            await controller.GetAllUserAccess();
                            if (controller.listuserAccssebility.any((element) =>
                                element.IdAccessibility ==
                                    controller.userAccssebility.value
                                        .IdAccessibility &&
                                element.IdUser ==
                                    controller.userAccssebility.value.IdUser)) {
                              var userAcc = controller.listuserAccssebility
                                  .where((element) =>
                                      element.IdAccessibility ==
                                          controller.userAccssebility.value
                                              .IdAccessibility &&
                                      element.IdUser ==
                                          controller
                                              .userAccssebility.value.IdUser)
                                  .first;
                              controller.userAccssebility.value.Id = userAcc.Id;
                              controller.perRepo.UpdateUserAccessibility(
                                  controller.userAccssebility.value);
                            } else {
                              controller.userAccssebility.value.Id = 0;
                              controller.perRepo.AddUserAccessibility(
                                  controller.userAccssebility.value);
                            }
                          },
                          text: "Save",
                          textStyle: const TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
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
      child: Card(
        child: Wrap(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(allPram.user!.Name ?? ''),
            ),
            Wrap(
              children: allPram.allType!
                  .map((e) => Column(
                        children: [
                          Text(e.type!),
                          Column(
                            children: e.access!
                                .map(
                                  (q) => SizedBox(
                                    width: 200,
                                    child: CheckboxListTile(
                                        title: Text(q.AccessibilityType ?? ''),
                                        subtitle:
                                            Text('${e.type!} { ${e.title} }'),
                                        value: true,
                                        onChanged: (value) {}),
                                  ),
                                )
                                .toList(),
                          )
                        ],
                      ))
                  .toList(),
            )
          ],
        ),
      ),
    );
  }
}
