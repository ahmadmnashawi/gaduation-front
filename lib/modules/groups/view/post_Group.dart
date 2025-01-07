import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getwidget/getwidget.dart';

import '../../sheard/text_feild_GP.dart';
import '../controller/group_controller.dart';

class PostGrpoup extends GetResponsiveView<GroupController> {
  @override
  GroupController controller = Get.put(GroupController());

  PostGrpoup({super.key});
  @override
  Widget builder() {
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
                      children: controller.contents
                          .map((element) => TextButton(
                              onPressed: () {
                                controller.newpost.value.IdContent = element.Id;
                              },
                              child: Text(element.typeName.toString(),
                                  style: const TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black54,
                                      decoration: TextDecoration.none))))
                          .toList(),
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
                      dufaltText: '',
                      prefIcon: Icons.text_fields,
                      onChanged: (value) {
                        controller.newpost.value.Description = value;
                      },
                    ))),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    shadowColor: const Color.fromARGB(255, 42, 42, 114),
                    backgroundColor: const Color.fromARGB(255, 42, 42, 114)),
                onPressed: () async {
                  await controller.AddPost(false);
                  await controller.addUserPost();
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
                                        padding:
                                            EdgeInsets.fromLTRB(10, 8, 10, 10),
                                        child: Column(
                                          children: <Widget>[
                                            Text(
                                              'Add Posr',
                                              textAlign: TextAlign.left,
                                              style: TextStyle(
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
}
