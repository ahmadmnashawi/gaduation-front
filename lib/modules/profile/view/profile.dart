import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getwidget/getwidget.dart';
import 'package:graduationproject/modules/profile/controller/profile_controller.dart';

import '../../../api/ui/util.dart';
import '../../../app/model/group.dart';
import '../../../app/model/user.dart';
import '../../../app/model/user_Group.dart';
import '../../sheard/post_page.dart';
import '../../sheard/post_view.dart';
import 'edit_profile.dart';

class Profileview extends GetResponsiveView<ProfileController> {
  Profileview({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Obx(() => Column(children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(6, 20, 8, 8),
                  child: Container(
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.white, width: 2)),
                    height: 150,
                    width: 150,
                    child: Align(
                        alignment: Alignment.topLeft,
                        child: Center(
                            child: ClipRRect(
                          borderRadius: BorderRadius.circular(100),
                          child: controller.stringPickImage.value.isEmpty
                              ? controller.userprofile.value.Image == null
                                  ? Image.asset(
                                      'assets/images/no_image.jpeg',
                                      width: 200,
                                      height: 200,
                                    )
                                  : Utility.imageFromBase64String(
                                      Utility.base64String(
                                          controller.userprofile.value.Image!),
                                      200,
                                      200)
                              : Utility.imageFromBase64String(
                                  controller.stringPickImage.value, 200, 200),
                        ))),
                  ),
                ),
                Row(
                  children: [
                    Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            controller.userprofile.value.Name.toString(),
                            // 'Mohammad Ahmmad',
                            style: const TextStyle(
                              decoration: TextDecoration.none,
                              fontWeight: FontWeight.bold,
                              color: Color.fromARGB(255, 42, 42, 114),
                              fontSize: 20,
                            ),
                          ),
                        ),
                        Row(
                          children: [
                            Text(
                              controller.userprofile.value.UserName.toString(),
                              style: const TextStyle(
                                color: Color.fromARGB(255, 42, 42, 114),
                                fontSize: 16,
                                decoration: TextDecoration.none,
                              ),
                            ),
                            ElevatedButton(
                              onPressed: () {
                                Get.dialog(EditProfileview());

                                // Get.rootDelegate.toNamed(Routes.editProfile);
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.white,
                                shadowColor:
                                    const Color.fromARGB(255, 42, 42, 114),
                                shape: const CircleBorder(),
                              ),
                              child: const Icon(
                                Icons.edit,
                                size: 14,
                                color: Color.fromARGB(255, 42, 42, 114),
                              ),
                            ),
                            ElevatedButton(
                              onPressed: () {
                                controller.GetuserGroup();
                                Get.dialog(Align(
                                  alignment: Alignment.topRight,
                                  child: Container(
                                      width: 300,
                                      height: 900,
                                      color: Colors.white,
                                      child: SingleChildScrollView(
                                        child: Column(
                                          children: [
                                            Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: Text(
                                                'Groups'.tr,
                                                style: const TextStyle(
                                                    fontSize: 24,
                                                    fontFamily: "Pacifico",
                                                    color: Color.fromARGB(
                                                        255, 246, 123, 127),
                                                    decoration:
                                                        TextDecoration.none),
                                              ),
                                            ),
                                            Obx(() => Column(
                                                  children: controller
                                                      .userfollowGroups
                                                      .map((e) =>
                                                          shapFolloword(e))
                                                      .toList(),
                                                ))
                                          ],
                                        ),
                                      )),
                                ));
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.white,
                                shadowColor:
                                    const Color.fromARGB(255, 42, 42, 114),
                                shape: const CircleBorder(),
                              ),
                              child: const Icon(
                                Icons.group,
                                size: 14,
                                color: Color.fromARGB(255, 42, 42, 114),
                              ),
                            ),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            children: [
                              ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  shadowColor:
                                      const Color.fromARGB(255, 42, 42, 114),
                                  backgroundColor: Colors.white,
                                ),
                                onPressed: () {
                                  controller.GetUserFollow();
                                  Get.dialog(Align(
                                    alignment: Alignment.topRight,
                                    child: Container(
                                        width: 300,
                                        height: 900,
                                        color: Colors.white,
                                        child: SingleChildScrollView(
                                          child: Column(
                                            children: [
                                              Padding(
                                                padding:
                                                    const EdgeInsets.all(8.0),
                                                child: Text(
                                                  'Follow'.tr,
                                                  style: const TextStyle(
                                                      fontSize: 24,
                                                      fontFamily: "Pacifico",
                                                      color: Color.fromARGB(
                                                          255, 246, 123, 127),
                                                      decoration:
                                                          TextDecoration.none),
                                                ),
                                              ),
                                              Obx(() => Column(
                                                    children: controller
                                                                .UserFollow
                                                            .map((e) =>
                                                                shapFollow(e))
                                                        .toList(),
                                                  ))
                                            ],
                                          ),
                                        )),
                                  ));
                                },
                                child: Text(
                                  'Follow'.tr,
                                  style: const TextStyle(
                                      color: Color.fromARGB(255, 246, 123, 127),
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                              const SizedBox(width: 3),
                              ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  shadowColor:
                                      const Color.fromARGB(255, 42, 42, 114),
                                  backgroundColor: Colors.white,
                                ),
                                onPressed: () {
                                  controller.GetFollowuser();
                                  Get.dialog(Align(
                                    alignment: Alignment.topRight,
                                    child: Container(
                                        width: 300,
                                        height: 900,
                                        color: Colors.white,
                                        child: SingleChildScrollView(
                                          child: Column(
                                            children: [
                                              Padding(
                                                padding:
                                                    const EdgeInsets.all(8.0),
                                                child: Text(
                                                  'Followed'.tr,
                                                  style: const TextStyle(
                                                      fontSize: 24,
                                                      fontFamily: "Pacifico",
                                                      color: Color.fromARGB(
                                                          255, 246, 123, 127),
                                                      decoration:
                                                          TextDecoration.none),
                                                ),
                                              ),
                                              Obx(() => Column(
                                                    children: controller
                                                                .FollowUser
                                                            .map((e) =>
                                                                shapFollow(e))
                                                        .toList(),
                                                  ))
                                            ],
                                          ),
                                        )),
                                  ));
                                },
                                child: Text(
                                  'Followed'.tr,
                                  style: const TextStyle(
                                      color: Color.fromARGB(255, 246, 123, 127),
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox()
              ],
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 8, 8, 8),
              child: Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    'About:'.tr,
                    style: const TextStyle(
                        decoration: TextDecoration.none,
                        color: Color.fromARGB(255, 42, 42, 114),
                        fontSize: 20),
                  )),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(8, 8, 8, 1),
              child: Row(
                children: [
                  const SizedBox(
                    width: 16,
                  ),
                  const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Icon(
                      Icons.email,
                      color: Color.fromARGB(255, 246, 123, 127),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      controller.userprofile.value.Email.toString(),
                      //'MohmmadAhmad@gmail.com',
                      style: const TextStyle(
                          color: Color.fromARGB(255, 42, 42, 114),
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                          decoration: TextDecoration.none),
                    ),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(8, 1, 8, 8),
              child: Row(
                children: [
                  const SizedBox(
                    width: 16,
                  ),
                  const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Icon(
                      Icons.cast_for_education,
                      color: Color.fromARGB(255, 246, 123, 127),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      controller.userprofile.value.Study.toString(),
                      //  'Information Tecnology',
                      style: const TextStyle(
                          color: Color.fromARGB(255, 42, 42, 114),
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                          decoration: TextDecoration.none),
                    ),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(0.0),
              child: Card(
                elevation: 6.0,
                color: const Color.fromARGB(255, 246, 123, 127),
                clipBehavior: Clip.hardEdge,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0),
                ),
                child: Container(
                  width: 500,
                  margin: const EdgeInsets.only(top: 5),
                  decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.vertical(
                        top: Radius.circular(20),
                      )),
                  child: Obx(() => SingleChildScrollView(
                        child: Column(
                            children: controller.Listuserpost.map((element) =>
                                PostView(
                                  postDto: element,
                                  withAction: false,
                                  action: Row(
                                    children: [
                                      IconButton(
                                          onPressed: () async {
                                            controller.postidnew.value =
                                                element.post!;
                                            if (controller.postidnew.value
                                                    .IdContent !=
                                                null) {
                                              await controller.GetAllContent();
                                              controller.selectContent.value =
                                                  controller.Contents.where(
                                                      (e) =>
                                                          e.Id ==
                                                          controller
                                                              .postidnew
                                                              .value
                                                              .IdContent).first;
                                            }

                                            Get.dialog(Align(
                                              alignment: Alignment.center,
                                              child: PostPage(
                                                title: "Editpost".tr,
                                                fromGroup: controller.postidnew
                                                        .value.IdContent !=
                                                    null,
                                                contents: controller.Contents,
                                                selectContent:
                                                    controller.selectContent,
                                                stringPickImage:
                                                    controller.stringPickImage,
                                                post: controller.postidnew,
                                                listImage: controller.listImage,
                                                textDescription:
                                                    controller.textDescription,
                                                generateTap: () async =>
                                                    await controller.getImage(),
                                                onSave: () async {
                                                  await controller.UpdatePost();
                                                  Get.back();
                                                },
                                                pickImage: () {
                                                  controller.pickImage();
                                                },
                                              ),
                                            ));
                                          },
                                          icon: const Icon(
                                            Icons.edit,
                                            size: 20,
                                            color: Color.fromARGB(
                                                255, 42, 42, 114),
                                          )),
                                      IconButton(
                                          onPressed: () {
                                            Get.dialog(Align(
                                                alignment: Alignment.center,
                                                child: Container(
                                                    width: 280,
                                                    height: 120,
                                                    decoration: BoxDecoration(
                                                        color: Colors.white,
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10),
                                                        border: Border.all(
                                                            color: Colors
                                                                .blueAccent)),
                                                    child: Column(
                                                      children: [
                                                        Center(
                                                          child: Text(
                                                            'AreYouSureRemove'
                                                                .tr,
                                                            style: const TextStyle(
                                                                fontSize: 18,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold,
                                                                fontFamily:
                                                                    "Pacifico",
                                                                color: Color
                                                                    .fromARGB(
                                                                        255,
                                                                        42,
                                                                        42,
                                                                        114),
                                                                decoration:
                                                                    TextDecoration
                                                                        .none),
                                                          ),
                                                        ),
                                                        const SizedBox(
                                                          height: 20,
                                                        ),
                                                        Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .center,
                                                          children: [
                                                            GFButton(
                                                              color: const Color
                                                                  .fromARGB(
                                                                  255,
                                                                  246,
                                                                  123,
                                                                  127),
                                                              onPressed:
                                                                  () async {
                                                                await controller
                                                                    .DeletPost(
                                                                        element
                                                                            .post!
                                                                            .Id!);
                                                                Get.back();
                                                              },
                                                              text: "Delete".tr,
                                                              shape:
                                                                  GFButtonShape
                                                                      .pills,
                                                            ),
                                                            const SizedBox(
                                                              width: 2,
                                                            ),
                                                            GFButton(
                                                              color: const Color
                                                                  .fromARGB(
                                                                  255,
                                                                  246,
                                                                  123,
                                                                  127),
                                                              onPressed: () {
                                                                Get.back();
                                                              },
                                                              text: "Cancle".tr,
                                                              shape:
                                                                  GFButtonShape
                                                                      .pills,
                                                            ),
                                                          ],
                                                        )
                                                      ],
                                                    ))));
                                          },
                                          icon: const Icon(
                                            Icons.delete,
                                            color: Colors.red,
                                            size: 20,
                                          )),
                                    ],
                                  ),
                                )).toList()),
                      )),
                ),
              ),
            ),
            const SizedBox(height: 150)
          ])),
    );
  }

  Widget shapFollow(User u) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        width: 250,
        height: 100,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: Colors.blueGrey)),
        child: Row(
          children: [
            SizedBox(
              width: 80,
              height: 80,
              child: u.Image == null
                  ? const Icon(
                      Icons.groups_2,
                      size: 35,
                    )
                  : Utility.imageFromBase64String(
                      Utility.base64String(u.Image!), 80, 80),
            ),
            const SizedBox(
              width: 10,
            ),
            Column(
              children: [
                const SizedBox(
                  height: 27,
                ),
                Text(
                  u.Name ?? '',
                  style: const TextStyle(
                      fontSize: 15,
                      decoration: TextDecoration.none,
                      color: Color.fromARGB(255, 42, 42, 114)),
                ),
                const SizedBox(
                  width: 130,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget shapFolloword(Group group) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        width: 250,
        height: 100,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: Colors.blueGrey)),
        child: Row(
          children: [
            SizedBox(
              width: 80,
              height: 80,
              child: group.Image == null
                  ? const Icon(
                      Icons.groups_2,
                      size: 35,
                    )
                  : Utility.imageFromBase64String(
                      Utility.base64String(group.Image!), 80, 80),
            ),
            const SizedBox(
              width: 10,
            ),
            Column(
              children: [
                const SizedBox(
                  height: 27,
                ),
                Text(
                  group.groupName ?? '',
                  style: const TextStyle(
                      fontSize: 15,
                      decoration: TextDecoration.none,
                      color: Color.fromARGB(255, 42, 42, 114)),
                ),
                const SizedBox(
                  width: 130,
                ),
                Align(
                  alignment: Alignment.bottomRight,
                  child: GFButton(
                    onPressed: () async {
                      Get.dialog(Align(
                          alignment: Alignment.center,
                          child: Container(
                              width: 280,
                              height: 120,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(10),
                                  border: Border.all(color: Colors.blueAccent)),
                              child: Column(
                                children: [
                                  Center(
                                    child: Text(
                                      'AreYouSureRemove'.tr,
                                      style: const TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold,
                                          fontFamily: "Pacifico",
                                          color:
                                              Color.fromARGB(255, 42, 42, 114),
                                          decoration: TextDecoration.none),
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      GFButton(
                                        color: const Color.fromARGB(
                                            255, 246, 123, 127),
                                        onPressed: () async {
                                          await controller.DelefolloewdGroup(
                                              UserGroup(
                                                  IdUser: controller
                                                      .userprofile.value.Id,
                                                  IdGroup: group.Id));
                                        },
                                        text: "Delete".tr,
                                        shape: GFButtonShape.pills,
                                      ),
                                      const SizedBox(
                                        width: 2,
                                      ),
                                      GFButton(
                                        color: const Color.fromARGB(
                                            255, 246, 123, 127),
                                        onPressed: () {
                                          Get.back();
                                        },
                                        text: "Cancle".tr,
                                        shape: GFButtonShape.pills,
                                      ),
                                    ],
                                  )
                                ],
                              ))));
                    },
                    text: "remove".tr,
                    textStyle: const TextStyle(color: Colors.black54),
                    icon: const Icon(
                      Icons.delete,
                      color: Colors.red,
                    ),
                    type: GFButtonType.transparent,
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
