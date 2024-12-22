import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:graduationproject/modules/groups/controller/group_controller.dart';
import 'package:graduationproject/modules/groups/view/group.dart';

import '../../../api/ui/search_textfeild.dart';
import '../../../app/model/group.dart';
import '../../genereted/sheard/util.dart';

class ShowGroupPageView extends GetResponsiveWidget<GroupController> {
  ShowGroupPageView({super.key});
  @override
  Widget builder() {
    return SizedBox(
      height: screen.height,
      child: SingleChildScrollView(
        child: Column(
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
             Text(
              " al ".tr,
              style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  fontFamily: "Pacifico",
                  color: Color.fromARGB(255, 42, 42, 114),
                  decoration: TextDecoration.none),
            ),
            const SizedBox(
              height: 8,
            ),
             Padding(
              padding: EdgeInsets.all(8.0),
              child: SizedBox(
                  width: 500,
                  child: Material(
                      child: SearchTextFeild(
                    hintText: 'search'.tr,
                    value: '',
                    label: 'search'.tr,
                  ))),
            ),
            const SizedBox(
              height: 8,
            ),
            Obx(() => SingleChildScrollView(
                  child: Column(
                    children:
                        controller.allGroups.map((e) => cardgroup(e)).toList(),
                  ),
                )),
            Material(
              child: Tooltip(
                message: 'hl'.tr,
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
                                              controller.textshowgroup,
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

  Widget cardgroup(Group g) {
    return Padding(
      padding: const EdgeInsets.all(2),
      child: Material(
        child: InkWell(
          onTap: () async {
            await controller.getGroup(g.Id!);
            await controller.getPosts();
            await controller.ExsistingMember();
            Get.to(GroupView());
          },
          child: Container(
            decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.white,
                  width: 1.3,
                ),
                color: Colors.white,
                borderRadius: BorderRadius.circular(22.0)),
            child: Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(22.0)),
                margin: const EdgeInsets.all(10),
                shadowColor: const Color.fromARGB(255, 42, 42, 114),
                elevation: 30,
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Align(
                          alignment: Alignment.topRight,
                          child: Material(
                              child: InkWell(
                                  onTap: () {
                                    Get.dialog(Align(
                                        alignment: Alignment.center,
                                        child: Container(
                                            width: 250,
                                            height: 100,
                                            decoration: BoxDecoration(
                                                color: Colors.white,
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                                border: Border.all(
                                                    color: Colors.blueAccent)),
                                            child: SingleChildScrollView(
                                                child: Column(
                                              children: [
                                                 Text(
                                                  "aresure".tr,
                                                  style: TextStyle(
                                                      fontSize: 20,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontFamily: "Pacifico",
                                                      color: Colors.blueGrey,
                                                      decoration:
                                                          TextDecoration.none),
                                                ),
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.all(8.0),
                                                  child: Center(
                                                    child: Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .center,
                                                      children: [
                                                        TextButton(
                                                            onPressed: () {
                                                              controller
                                                                  .delGroup(
                                                                      g.Id!);
                                                            },
                                                            child:  Text(
                                                              'mm'.tr,
                                                              style: TextStyle(
                                                                  color: Color
                                                                      .fromARGB(
                                                                          255,
                                                                          245,
                                                                          146,
                                                                          149)),
                                                            )),
                                                        TextButton(
                                                            onPressed: () {
                                                              Get.back();
                                                            },
                                                            child:  Text(
                                                              'nn'.tr,
                                                              style: TextStyle(
                                                                  color: Color
                                                                      .fromARGB(
                                                                          255,
                                                                          245,
                                                                          146,
                                                                          149)),
                                                            )),
                                                      ],
                                                    ),
                                                  ),
                                                )
                                              ],
                                            )))));
                                  },
                                  child: const Icon(
                                    Icons.close,
                                    size: 16,
                                  ))),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(12),
                        child: Row(
                          children: [
                            g.Image == null
                                ? const Icon(
                                    Icons.groups_2_sharp,
                                    size: 50,
                                  )
                                : Utility.imageFromBase64String(
                                    Utility.base64String(g.Image!),
                                    screen.width,
                                    null),
                            const SizedBox(
                              width: 23,
                            ),
                            Text(
                              g.groupName ?? '',
                              style: const TextStyle(
                                  fontSize: 23,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black54),
                            ),
                          ],
                        ),
                      )
                      // Flexible(
                      //      child: new Text(discribtion,style: TextStyle(fontSize: 18))),
                    ])),
          ),
        ),
      ),
    );
  }

  Widget BuildcontentGroup(String txt) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: 40,
        width: 90,
        decoration: BoxDecoration(
            border: Border.all(
              color: Colors.grey,
              width: 1.3,
            ),
            color: Colors.white,
            borderRadius: BorderRadius.circular(20)),
        child: Center(
            child: Text(
          txt,
          style: const TextStyle(
              fontSize: 16,
              color: Color.fromARGB(
                255,
                246,
                123,
                127,
              ),
              decoration: TextDecoration.none),
        )),
      ),
    );
  }
}
