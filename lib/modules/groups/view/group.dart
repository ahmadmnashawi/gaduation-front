import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:graduationproject/modules/groups/view/add_group.dart';

import '../../../api/ui/util.dart';
import '../../../app/model/postdto.dart';
import '../../comment/view/comment.dart';
import '../../sheard/post_page.dart';
import '../../sheard/post_view.dart';
import '../controller/group_controller.dart';

class GroupView extends GetResponsiveView<GroupController> {
  GroupView({super.key});
  @override
  Widget builder() {
    return Scaffold(
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
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Utility.getImage(
                            base64StringPh: controller.currentGroup.value.Image,
                            link: controller.currentGroup.value.imageOnline,
                            width: 150,
                            hight: 150),
                        Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const SizedBox(),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    controller.currentGroup.value.groupName!,
                                    style: const TextStyle(
                                        fontSize: 25,
                                        fontWeight: FontWeight.bold,
                                        color:
                                            Color.fromARGB(255, 42, 42, 114)),
                                  ),
                                ),
                                const SizedBox(),
                              ],
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Center(
                                child: Row(
                                  children: [
                                    Obx(
                                      () => Tooltip(
                                        message: controller.msg.value,
                                        child: ElevatedButton(
                                          style: ElevatedButton.styleFrom(
                                            shadowColor: Colors.blueGrey,
                                            backgroundColor:
                                                // controller.press.value == false
                                                !controller
                                                        .personExsisting.value
                                                    ? const Color.fromARGB(
                                                        255, 246, 123, 127)
                                                    : Colors.white,
                                          ),
                                          onPressed: () async {
                                            controller.addMember.value.IdGroup =
                                                controller
                                                    .currentGroup.value.Id;
                                            controller.addMember.value.IdUser =
                                                controller.user.value.Id;
                                            await controller.AddMember();
                                            await controller.existingMember();
                                          },
                                          child: Text(
                                            controller.msg.value,
                                            style: TextStyle(
                                                color: !controller
                                                        .personExsisting.value
                                                    ? Colors.white
                                                    : const Color.fromARGB(
                                                        255, 246, 123, 127),
                                                fontSize: 17),
                                          ),
                                        ),
                                      ),
                                    ),
                                    const SizedBox(width: 5),
                                    Tooltip(
                                      message: 'wa'.tr,
                                      child: ElevatedButton(
                                        style: ElevatedButton.styleFrom(
                                          shadowColor: const Color.fromARGB(
                                              255, 42, 42, 114),
                                          backgroundColor: const Color.fromARGB(
                                              255, 246, 123, 127),
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
                                                            const EdgeInsets
                                                                .all(8.0),
                                                        child: Text(
                                                          'Members'.tr,
                                                          style: const TextStyle(
                                                              fontSize: 24,
                                                              fontFamily:
                                                                  "Pacifico",
                                                              color: Color
                                                                  .fromARGB(
                                                                      255,
                                                                      246,
                                                                      123,
                                                                      127),
                                                              decoration:
                                                                  TextDecoration
                                                                      .none),
                                                        ),
                                                      ),
                                                      Obx(
                                                        () => Column(
                                                          children: controller
                                                              .members
                                                              .map((element) =>
                                                                  shapFolloword(
                                                                      element
                                                                          .Name!,
                                                                      element
                                                                          .Image))
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
                                              fontSize: 17),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox()
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(4),
                          child: Align(
                            alignment: Alignment.topLeft,
                            child: Text(
                              'zz'.tr,
                              style: const TextStyle(
                                  fontSize: 16,
                                  color: Color.fromARGB(255, 42, 42, 114),
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                        Padding(
                            padding: const EdgeInsets.all(4),
                            child: Row(
                              children: <Widget>[
                                Flexible(
                                    child: Text(
                                        style: const TextStyle(
                                          fontSize: 14,
                                          color: Colors.black54,
                                          decoration: TextDecoration.none,
                                        ),
                                        controller
                                            .currentGroup.value.Description
                                            .toString()))
                              ],
                            )),
                      ],
                    ),
                  )
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
                  message: 'EditGroup'.tr,
                  child: ElevatedButton(
                    onPressed: controller.auth.isAdmin() ||
                            controller.user.value.Name == 'Asia Badenjki'
                        ? () {
                            controller.selectContentGroup.value = controller
                                .contents
                                .where((p0) =>
                                    p0.Id ==
                                    controller.currentGroup.value.IdContent)
                                .first;
                            controller.addnewGroup.value =
                                controller.currentGroup.value;
                            Get.to(AddGroup());
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
                  message: 'll'.tr,
                  child: ElevatedButton(
                    onPressed: controller.auth.isAdmin() ||
                            controller.user.value.Name == 'Asia Badenjki'
                        ? () {
                            Get.dialog(Align(
                                alignment: Alignment.center,
                                child: PostPage(
                                  contents: null,
                                  selectContent: null,
                                  stringPickImage: controller.stringPickImage,
                                  post: controller.newpost,
                                  generateTap: () async =>
                                      await controller.getImage(),
                                  listImage: controller.listImage,
                                  textDescription: controller.textDescription,
                                  onSave: () {
                                    if (controller.formfield.currentState!
                                        .validate()) {
                                      print("DataAdded".tr);
                                      controller.AddPost(true);
                                    }
                                  },
                                  pickImage: () {
                                    controller.pickImageFun();
                                  },
                                  fromGroup: false,
                                  title: "Add post : ",
                                )));
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
                    .map((element) => postProfile(element))
                    .toList(),
              )),
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

  Widget postProfile(PostDto dto) {
    return PostView(
      postDto: dto,
      withAction: true,
      onComment: () async {
        await controller.GetComments(dto.post!.Id!);
        Get.dialog(CommentPageView(
          comments: controller.listComment,
        ));
      },
      onLike: () async {
        controller.userpost.value.IdPost = dto.post!.Id!;
        controller.userpost.value.Id = dto.userPostId;
        controller.userpost.value.Interaction = !dto.Interaction!;
        await controller.addInterActionUser();
      },
      isAction: dto.Interaction!,
    );
  }
}
