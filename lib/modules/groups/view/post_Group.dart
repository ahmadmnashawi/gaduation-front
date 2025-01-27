import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../sheard/post_page.dart';
import '../controller/group_controller.dart';

class PostGrpoup extends GetResponsiveView<GroupController> {
  PostGrpoup({super.key});

  @override
  Widget builder() {
    return PostPage(
      fromGroup: false,
      title: "ad".tr,
      contents: controller.contents,
      selectContent: controller.selectContent,
      stringPickImage: controller.stringPickImage,
      generateTap: () async => await controller.getImage(),
      listImage: controller.listImage,
      textDescription: controller.textDescription,
      post: controller.newpost,
      onSave: () async {
        await controller.AddPost(false);
        await controller.addUserPost();
        Get.back();
      },
      pickImage: () {
        controller.pickImageFun();
      },
    );
  }
}
