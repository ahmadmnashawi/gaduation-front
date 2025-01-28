import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:graduationproject/modules/menu/controller/menu.dart';

import '../../comment/view/comment.dart';
import '../../sheard/post_view.dart';
import 'content_show.dart';

class postPage extends GetResponsiveView<HomeController> {
  postPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: SingleChildScrollView(
        child: Column(
          children: [
            ContentPage(),
            Obx(() => Column(
                    children: controller.postDto.map((element) {
                  return PostView(
                    postDto: element,
                    withAction: true,
                    onComment: () async {
                      await controller.GetComments(element.post!.Id!);
                      Get.dialog(CommentPageView(
                        comments: controller.listComment,
                      ));
                    },
                    onLike: () async {
                      controller.userpost.value.IdPost = element.post!.Id!;
                      controller.userpost.value.Id = element.userPostId;
                      controller.userpost.value.Interaction =
                          !element.Interaction!;
                      await controller.addInterActionUser();
                    },
                    isAction: element.Interaction!,
                  );
                }).toList())),
            const SizedBox(
              height: 50,
            )
          ],
        ),
      ),
    );
  }
}
