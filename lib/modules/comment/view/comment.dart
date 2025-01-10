import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:graduationproject/app/model/comment.dart';
import 'package:graduationproject/modules/comment/controller/comment_controller.dart';

import '../../../api/ui/util.dart';
import '../../menu/view/HomePage.dart';

// ignore: must_be_immutable
class CommentPageView extends GetResponsiveView<CommentController> {
  CommentPageView({required this.comments, super.key});
  final textfield = TextEditingController();
  final RxList<CommentsDto> comments;

  @override
  Widget builder() {
    return Material(
      child: SizedBox(
        height: Get.height / 2,
        child: Column(
          children: [
            Row(
              children: [
                const SizedBox(
                  width: 2,
                ),
                InkWell(
                  onTap: () {
                    Get.to(HomePage());
                  },
                  child: const Align(
                    alignment: Alignment.topLeft,
                    child: Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Icon(Icons.arrow_back_ios,
                          size: 20, color: Colors.grey),
                    ),
                  ),
                ),
                const SizedBox(
                  width: 130,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Center(
                    child: Text(
                      'Comments'.tr,
                      style: const TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                          color: Colors.black54),
                    ),
                  ),
                )
              ],
            ),
            SingleChildScrollView(
              child: Obx(
                () => Column(
                    children: comments.map((e) => commentShp(e)).toList()),
              ),
            ),
            Container(
                padding: const EdgeInsets.symmetric(vertical: 3.0),
                child: Row(mainAxisAlignment: MainAxisAlignment.end, children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        controller: textfield,
                        onChanged: (val) {
                          controller.textfield.value = val;
                        },
                        autocorrect: false,
                        decoration: InputDecoration(
                          // labelText: "Write Your Comment",
                          hintText: "WriteYourr".tr,
                          labelStyle: const TextStyle(
                              fontSize: 20.0, color: Colors.white),
                          fillColor: Colors.blueGrey,
                          border: const OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.blueGrey)),
                        ),
                      ),
                    ),
                  ),
                  // Second child is button
                  IconButton(
                    icon: const Icon(Icons.send),
                    iconSize: 20.0,
                    onPressed: () async {
                      await controller
                          .putComment(comments.first.comment!.idPost!);
                      textfield.text = '';
                      Get.back();
                    },
                  )
                ])),
          ],
        ),
      ),
    );
  }

  Widget commentShp(CommentsDto comment) {
    return Row(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(20), // Image border
            child: Utility.getImage(
                base64StringPh: comment.userImage, hight: 30, width: 30),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8),
          child: Container(
              decoration: const BoxDecoration(
                  color: Color.fromARGB(255, 230, 229, 229),
                  borderRadius: BorderRadius.all(Radius.circular(10.0))),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      comment.userName ?? "",
                      style: const TextStyle(
                          fontSize: 16,
                          color: Colors.blueGrey,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(comment.comment!.comment ?? '',
                        style: const TextStyle(fontSize: 14)),
                  ),
                ],
              )),
        ),
      ],
    );
  }
}
