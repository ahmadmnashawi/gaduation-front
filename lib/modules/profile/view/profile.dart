import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getwidget/getwidget.dart';
import 'package:graduationproject/modules/profile/controller/profile_controller.dart';
import 'package:graduationproject/modules/profile/view/editpost.dart';

import '../../../app/model/group.dart';
import '../../../app/model/post.dart';
import '../../../app/model/user.dart';
import '../../../app/model/user_Group.dart';
import '../../genereted/sheard/util.dart';
import 'edit_profile.dart';

class Profileview extends GetResponsiveView<ProfileController> {
  Profileview({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Column(children: [
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
                child: const Align(
                  alignment: Alignment.topLeft,
                  child: CircleAvatar(
                    backgroundImage: AssetImage('assets/images/boy.gif'),
                    radius: 110,
                  ),
                ),
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
                            ///////////////////////////////Here Update profile
                            Get.to(EditProfileview());
                            // Get.rootDelegate.toNamed(Routes.editProfile);
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.white,
                            shadowColor: const Color.fromARGB(255, 42, 42, 114),
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
                                          padding: const EdgeInsets.all(8.0),
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
                                                  .map((e) => shapFolloword(e))
                                                  .toList(),
                                            ))
                                      ],
                                    ),
                                  )),
                            ));
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.white,
                            shadowColor: const Color.fromARGB(255, 42, 42, 114),
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
                                            padding: const EdgeInsets.all(8.0),
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
                                                children:
                                                    controller.UserFollow.map(
                                                            (e) =>
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
                                            padding: const EdgeInsets.all(8.0),
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
                                                children:
                                                    controller.FollowUser.map(
                                                            (e) =>
                                                                shapFollow(e))
                                                        .toList(),
                                              ))

                                          // shapFolloword('ASIA Badnjki',
                                          //     'assets/images/girl.gif'),
                                          // shapFolloword('HADEEL Dabbas',
                                          //     'assets/images/girl.gif'),
                                          // shapFolloword('HAYA Ysoufi',
                                          //     'assets/images/girl.gif')
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
                        children: controller.Listuserpost.map((element) => post(
                            element.UserName.toString(),
                            element.post!.Description.toString(),
                            element.UserImage,
                            element.post!.Image.toString(),
                            element.GroupName,
                            element.post!.Id!,
                            element.Interaction!,
                            element.post!)).toList()),
                  )),
            ),
          ),
        ),
        SizedBox(
          height: 150,
        )
      ]),
    );
  }

  Widget post(String title, String txt, Uint8List? url, String post,
      String? GroupName, int idpost, bool interaction, Post posts) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(8, 4, 8, 8),
      child: Center(
        child: Container(
          // width: 500,
          // height: 350,
          decoration: BoxDecoration(
              border: Border.all(
                color: Colors.grey,
                width: 1.3,
              ),
              color: Colors.white,
              borderRadius: BorderRadius.circular(15)),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Row(
                  children: [
                    const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: GFAvatar(
                        size: 20,
                        //  shape: GFAvatarShape.standard,
                        backgroundImage: AssetImage('assets/images/5.png'),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Align(
                          alignment: Alignment.topLeft,
                          child: Text(
                            title,
                            style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 14,
                                color: Color.fromARGB(255, 42, 42, 114)),
                          )),
                    ),
                    // Text("($post)",
                    //     style: const TextStyle(
                    //       color: Colors.grey,
                    //     )),
                    GroupName != null
                        ? const Icon(Icons.arrow_forward_ios_sharp)
                        : Container(),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: GroupName != null
                          ? const GFAvatar(
                              size: 20,
                              backgroundImage:
                                  AssetImage('assets/images/2.png'),
                            )
                          : Container(),
                    ),
                    GroupName != null ? Text(GroupName) : const Text(''),
                    Align(
                      alignment: Alignment.topRight,
                      child: Row(
                        children: [
                          IconButton(
                              onPressed: () {
                                controller.postidnew.value = posts;
                                Get.dialog(Align(
                                  alignment: Alignment.center,
                                  child: Container(
                                    width: 500,
                                    height: 450,
                                    decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(10),
                                        border: Border.all(
                                            color: Colors.blueAccent)),
                                    child: SingleChildScrollView(
                                      child: Column(
                                        children: [
                                          const SizedBox(
                                            height: 10,
                                          ),
                                          Align(
                                              child: Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Text(
                                              "Editpost".tr,
                                              style: const TextStyle(
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.bold,
                                                  fontFamily: "Pacifico",
                                                  color: Color.fromARGB(
                                                      255, 42, 42, 114),
                                                  decoration:
                                                      TextDecoration.none),
                                            ),
                                          )),
                                          Container(
                                            child: EditPostview(),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ));
                              },
                              icon: const Icon(
                                Icons.edit,
                                size: 20,
                                color: Color.fromARGB(255, 42, 42, 114),
                              )),
                          IconButton(
                              onPressed: () {
                                Get.dialog(Align(
                                  child: Container(
                                    height: 200,
                                    width: 200,
                                    color: Colors.white,
                                    // decoration: BoxDecoration(
                                    //     borderRadius: BorderRadius.circular(12),
                                    //     border: Border.all(
                                    //         color: const Color.fromARGB(
                                    //             255, 42, 42, 114),
                                    //         width: 2)),
                                    child: Column(
                                      children: [
                                        Center(
                                          child: Text(
                                            'AreSureToRemove?'.tr,
                                            style: const TextStyle(
                                              color: Color.fromARGB(
                                                  255, 42, 42, 114),
                                              fontSize: 18,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            TextButton(
                                                onPressed: () {
                                                  controller.DeletPost(posts);
                                                },
                                                child: Text(
                                                  'Yes'.tr,
                                                )),
                                            TextButton(
                                                onPressed: () {
                                                  Get.back();
                                                },
                                                child: Text(
                                                  'No'.tr,
                                                ))
                                          ],
                                        )
                                      ],
                                    ),
                                  ),
                                ));
                              },
                              icon: const Icon(
                                Icons.delete,
                                color: Colors.red,
                                size: 20,
                              )),
                        ],
                      ),
                    )
                  ],
                ),
                ClipRRect(
                  borderRadius: BorderRadius.circular(20), // Image border
                  child: SizedBox(
                    width: 400,
                    height: 150,
                    child: SizedBox.fromSize(
                      size: const Size.fromRadius(48), // Image radius
                      child: url != null
                          ? Image.memory(url, fit: BoxFit.cover)
                          : Image.asset('assets/images/2.png'),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    txt,
                    style: const TextStyle(fontSize: 16),
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
              ],
            ),
          ),
        ),
      ),
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
                      await controller.DelefolloewdGroup(UserGroup(
                          IdUser: controller.user.value.Id, IdGroup: group.Id));
                      await controller.GetuserGroup();
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
