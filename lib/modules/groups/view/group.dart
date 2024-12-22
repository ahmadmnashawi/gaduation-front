import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:graduationproject/modules/groups/view/edit_group.dart';

import '../../../app/model/postdto.dart';
import '../../comment/view/comment.dart';
import '../../genereted/sheard/util.dart';
import '../../icons/Icon.dart';
import '../controller/group_controller.dart';
import 'add_group.dart';
import 'add_post.dart';

class GroupView extends GetResponsiveView<GroupController> {
  @override
  GroupController controller = Get.put(GroupController());

  GroupView({super.key});
  @override
  Widget builder() {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
          onPressed: controller.auth.isAdmin() ||
                  controller.user.value.Name == 'Asia Badenjki'
              ? () {
                  Get.to(AddGrpoup());
                }
              : () {
                  Get.showSnackbar(const GetSnackBar(
                    duration: Duration(seconds: 2),
                    title: 'Access',
                    message: 'You Dont Have Permission',
                  ));
                },
          child: const Icon(Icons.add)),
      body: SingleChildScrollView(
        child: Column(children: [
          InkWell(
            onTap: () => Get.back(),
            child: const Align(
              alignment: Alignment.topLeft,
              child: Padding(
                padding: EdgeInsets.all(8.0),
                child: Icon(Icons.arrow_back_ios, size: 20, color: Colors.grey),
              ),
            ),
          ),

          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Card(
              //  shadowColor: Colors.white60,
              color: const Color.fromARGB(255, 236, 236, 243),
              child: Column(
                children: [
                  Center(
                    child: Row(
                      children: [
                        const SizedBox(
                          width: 80,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            controller.currentGroup.value.groupName!,
                            style: const TextStyle(
                                fontSize: 30,
                                fontWeight: FontWeight.bold,
                                color: Color.fromARGB(255, 42, 42, 114)),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Center(
                      child: Row(
                        children: [
                          const SizedBox(
                            width: 120,
                          ),
                          Obx(
                            () => Tooltip(
                              message: controller.msg.value,
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  shadowColor: Colors.blueGrey,
                                  backgroundColor:
                                      // controller.press.value == false
                                      !controller.personExsisting.value
                                          ? const Color.fromARGB(
                                              255, 246, 123, 127)
                                          : Colors.white,
                                ),
                                /////////////////////////dont work
                                onPressed: () {
                                  if (controller.personExsisting.value ==
                                      false) {
                                    controller.personExsisting.value = true;
                                    controller.msg.value = 'z'.tr;
                                    controller.addMember.value.IdGroup =
                                        controller.currentGroup.value.Id;
                                    controller.addMember.value.IdUser =
                                        controller.user.value.Id;
                                    controller.AddMember();
                                  } else {
                                    controller.personExsisting.value = false;
                                    controller.msg.value = 'w'.tr;
                                    controller.addMember.value.IdGroup =
                                        controller.currentGroup.value.Id;
                                    controller.addMember.value.IdUser =
                                        controller.user.value.Id;
                                    controller.RemoveMember();
                                  }
                                },
                                /////////////////////////////////////////
                                child: Text(
                                  controller.msg.value,
                                  style: TextStyle(
                                      color: !controller.personExsisting.value
                                          ? Colors.white
                                          : const Color.fromARGB(
                                              255, 246, 123, 127),
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(width: 5),
                          Tooltip(
                            message: 'wa'.tr,
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                shadowColor:
                                    const Color.fromARGB(255, 42, 42, 114),
                                backgroundColor:
                                    const Color.fromARGB(255, 246, 123, 127),
                              ),
                              onPressed: () async {
                                await controller.getMembers();
                                Get.dialog(Align(
                                  alignment: Alignment.topRight,
                                  child: Container(
                                      height: 900,
                                      width: 300,
                                      color: Colors.white,
                                      child: SingleChildScrollView(
                                        child: Column(
                                          children: [
                                            Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: Text(
                                                'Members'.tr,
                                                style: const TextStyle(
                                                    fontSize: 24,
                                                    fontFamily: "Pacifico",
                                                    color: Color.fromARGB(
                                                        255, 246, 123, 127),
                                                    decoration:
                                                        TextDecoration.none),
                                              ),
                                            ),
                                            Obx(
                                              () => Column(
                                                children: controller.members
                                                    .map((element) =>
                                                        shapFolloword(
                                                            element.Name!,
                                                            element.Image))
                                                    .toList(),
                                              ),
                                            )
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
                                'Members'.tr,
                                style: const TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        ' zz'.tr,
                        style: const TextStyle(
                            fontSize: 18,
                            color: Color.fromARGB(255, 42, 42, 114),
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Center(
                        child: Row(
                      children: <Widget>[
                        Flexible(
                            child: Center(
                                child: Text(
                                    style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18,
                                      color: Colors.black54,
                                      decoration: TextDecoration.none,
                                    ),
                                    controller.currentGroup.value.Description
                                        .toString())))
                      ],
                    )),
                  ),
                ],
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Align(
                alignment: Alignment.topRight,
                child: Tooltip(
                  message: 'EditGroup '.tr,
                  child: ElevatedButton(
                    onPressed: controller.auth.isAdmin() ||
                            controller.user.value.Name == 'Asia Badenjki'
                        ? () {
                            controller.currentGroup.value.content = controller
                                .contents
                                .where((p0) =>
                                    p0.Id == controller.currentGroup.value.Id)
                                .first;
                            Get.to(EditGrpoup());
                          }
                        : () {
                            Get.showSnackbar(const GetSnackBar(
                              duration: Duration(seconds: 2),
                              title: 'Access',
                              message: 'You Dont Have Permission',
                            ));
                          },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(
                          vertical: 15, horizontal: 15),
                      shape: const CircleBorder(),
                    ),
                    child: const Icon(
                      Icons.edit,
                      size: 18,
                      color: Color.fromARGB(255, 246, 123, 127),
                    ),
                  ),
                ),
              ),
              Align(
                alignment: Alignment.center,
                child: Tooltip(
                  message: 'll '.tr,
                  child: ElevatedButton(
                    onPressed: controller.auth.isAdmin() ||
                            controller.user.value.Name == 'Asia Badenjki'
                        ? () {
                            Get.dialog(Align(
                              alignment: Alignment.center,
                              child: Container(
                                width: 500,
                                height: 370,
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(10),
                                    border:
                                        Border.all(color: Colors.blueAccent)),
                                child: SingleChildScrollView(
                                  child: Column(
                                    children: [
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      const Align(
                                          alignment: Alignment.center,
                                          child: Padding(
                                            padding: EdgeInsets.all(8.0),
                                            child: Text(
                                              "Add post : ",
                                              style: TextStyle(
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
                                        child: Addpostviewas(),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ));
                          }
                        : () {
                            Get.showSnackbar(const GetSnackBar(
                              duration: Duration(seconds: 2),
                              title: 'Access',
                              message: 'You Dont Have Permission',
                            ));
                          },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(
                          vertical: 15, horizontal: 15),
                      shape: const CircleBorder(),
                    ),
                    child: const Icon(
                      Icons.add,
                      size: 18,
                      color: Color.fromARGB(255, 246, 123, 127),
                    ),
                  ),
                ),
              ),
            ],
          ),
          Obx(() => Column(
                children: controller.postsList
                    .map((element) => postprofile(element))
                    .toList(),
              )),

          // post('Dr.Abdallah hamwe', 'The loop you can used it in flutter',
          //     'assets/images/loop.png', 'IT', controller),
          // post('Ahmad Ahmad', 'Why Flutter Uses Dart ?',
          //     'assets/images/dart.png', 'IT', controller)
          Tooltip(
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
                                border: Border.all(color: Colors.blueAccent)),
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
                                          padding: const EdgeInsets.all(8.0),
                                          child: Text(
                                            "el".tr,
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
                                    padding: const EdgeInsets.fromLTRB(
                                        10, 8, 10, 10),
                                    child: Column(
                                      children: <Widget>[
                                        Text(
                                          controller.textgroup,
                                          textAlign: TextAlign.left,
                                          style: const TextStyle(
                                              fontSize: 18,
                                              decoration: TextDecoration.none,
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
          )
        ]),
      ),
    );
  }

  Widget shapFolloword(String? name, Uint8List? url) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        width: 300,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: const Color.fromARGB(255, 42, 42, 114))),
        child: Row(
          children: [
            SizedBox(
              width: 80,
              height: 80,
              child: url == null
                  ? Image.asset(
                      'assets/images/girl.gif',
                      width: screen.width,
                      fit: BoxFit.fill,
                    )
                  : Utility.imageFromBase64String(
                      Utility.base64String(url), screen.width, null),
            ),
            const SizedBox(
              width: 30,
            ),
            Text(
              name ?? '',
              style: const TextStyle(
                  fontSize: 14,
                  decoration: TextDecoration.none,
                  color: Color.fromARGB(255, 42, 42, 114)),
            )
          ],
        ),
      ),
    );
  }

  Widget postprofile(PostDto dto) {
    return Padding(
        padding: const EdgeInsets.fromLTRB(8, 4, 8, 8),
        child: Center(
          child: Container(
            width: 500,
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
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: SizedBox(
                                width: 50,
                                height: 50,
                                child: dto.UserImage == null
                                    ? Image.asset(
                                        'assets/images/girl.gif',
                                        width: screen.width,
                                        fit: BoxFit.fill,
                                      )
                                    : Utility.imageFromBase64String(
                                        Utility.base64String(dto.UserImage!),
                                        50,
                                        50),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Align(
                                  alignment: Alignment.topLeft,
                                  child: Text(
                                    // 'Asia',
                                    dto.UserName ?? '',
                                    style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16,
                                        color: Colors.blueGrey),
                                  )),
                            ),

                            // Text("(${dto.post!.content!.typeName})",
                            //     style: const TextStyle(
                            //       color: Colors.grey,
                            //     )),
                            //  Icon(Icons.arrow_forward_ios_sharp)
                          ],
                        ),
                        // Row(
                        //   children: [
                        //     Padding(
                        //       padding: const EdgeInsets.all(8.0),
                        //       child: SizedBox(
                        //         width: 50,
                        //         height: 50,
                        //         child: dto.GroupImage == null
                        //             ? const Icon(
                        //                 Icons.groups_2_rounded,
                        //                 size: 30,
                        //               )
                        //             : Utility.imageFromBase64String(
                        //                 Utility.base64String(dto.GroupImage!),
                        //                 50,
                        //                 50),
                        //       ),
                        //     ),
                        //     Text(
                        //       dto.GroupName ?? '',
                        //       //  nameuser,
                        //       style: const TextStyle(
                        //           fontWeight: FontWeight.bold,
                        //           fontSize: 16,
                        //           color: Color.fromARGB(255, 42, 42, 114)),
                        //     ),
                        //   ],
                        // ),
                      ],
                    ),
                  ),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(20), // Image border
                    child: SizedBox(
                      width: 450,
                      height: 180,
                      child: SizedBox.fromSize(
                          size: const Size.fromRadius(48), // Image radius
                          child: dto.post!.Image == null
                              ? Image.asset(
                                  'assets/images/gabal.png',
                                  fit: BoxFit.fill,
                                )
                              : Utility.imageFromBase64String(
                                  Utility.base64String(dto.post!.Image!),
                                  screen.width,
                                  null)),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Text(
                      dto.post!.Description ?? '',
                      style: const TextStyle(fontSize: 12),
                    ),
                  ),
                  const SizedBox(
                    height: 3,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Align(
                          alignment: Alignment.bottomRight,
                          child: ElevatedButton(
                            onPressed: () {
                              controller.userpost.value.IdPost = dto.post!.Id;
                              controller.userpost.value.post = dto.post;
                              controller.userpost.value.user =
                                  controller.user.value;
                              controller.userpost.value.Id =
                                  controller.user.value.Id;
                              if (dto.Interaction!) {
                                controller.userpost.value.Interaction = false;
                                controller.GetInterActionUser();
                              } else {
                                controller.userpost.value.Interaction = false;
                                controller.GetInterActionUser();
                              }
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor:
                                  const Color.fromARGB(255, 248, 150, 153),
                              shape: const CircleBorder(),
                            ),
                            child: Obx(
                              () => Icon(
                                AppIconn.favorite,
                                size: 12,
                                color: controller.click.value == true
                                    ? Colors.red
                                    : Colors.white,
                              ),
                            ),
                          )),
                      ElevatedButton(
                        onPressed: () async {
                          // controller.IdPost != idpost;
                          controller.GetComments(dto.Id!);
                          Get.dialog(CommentPageView(
                            idPost: dto.Id,
                          ));
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor:
                              const Color.fromARGB(255, 248, 150, 153),
                          shape: const CircleBorder(),
                        ),
                        child: const Icon(
                          AppIconn.chat,
                          size: 14,
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ));
  }
}
