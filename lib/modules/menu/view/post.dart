import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getwidget/getwidget.dart';
import 'package:graduationproject/app/model/post.dart';
import 'package:graduationproject/modules/icons/Icon.dart';
import 'package:graduationproject/modules/menu/controller/menu.dart';

import '../../comment/view/comment.dart';
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
            //           ElevatedButton(
            //   onPressed: () async {
            //   await  controller.GetAllPosts();
            //     // controller.IdPost!=idpost;
            //     // controller.GetComments();
            //     // Get.to(CommentPageView());

            //   },
            //   child: Icon(
            //     AppIconn.chat,
            //     size: 14,
            //   ),
            //   style: ElevatedButton.styleFrom(
            //     backgroundColor: Color.fromARGB(255, 248, 150, 153),
            //     shape: CircleBorder(),
            //   ),
            // ),

            Obx(() => Column(
                children: controller.postDto
                    .map((element) => post(
                          element.UserName.toString(),
                          element.post!.Description.toString(),
                          element.UserImage,
                          element.post!.Image.toString(),
                          element.GroupName,
                          element.post!.Id!,
                          element.Interaction!,
                          element.post!,
                        ))
                    .toList())),

            //   post(' Hamza Hamza','Forest Is The tallest in the world   8848 mater',
            // 'assets/images/gabal.png',"History",controller),
            // post('Aya Hamm','How Number Square IN This Photo? ','assets/images/19.png','Global',controller),
            //   post('Aya Hamm','How Number Square IN This Photo? ','assets/images/19.png','Global',controller)
          ],
        ),
      ),
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
                    GroupName != null ? Text(GroupName) : const Text('')
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
                Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        txt,
                        style: const TextStyle(fontSize: 16),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        posts.dateTime != null ? posts.dateTime.toString() : '',
                        style: const TextStyle(fontSize: 16),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 5,
                ),
                Align(
                  alignment: Alignment.bottomRight,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      const SizedBox(
                        width: 350,
                      ),
                      ElevatedButton(
                        onPressed: () async {
                          controller.IdPost != idpost;
                          controller.GetComments();
                          Get.dialog(CommentPageView(
                            idPost: idpost,
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

                      ElevatedButton(
                          onPressed: () {
                            if (controller.sta.value == false) {
                              controller.sta.value = true;
                            } else {
                              controller.sta.value = false;
                            }
                            // controller.click.value = interaction;
                            // if (controller.interActive.any((element) =>
                            //         element.keys.first == idpost) &&
                            //     controller.interActive
                            //         .where((element) =>
                            //             element.keys.first == idpost)
                            //         .first
                            //         .values
                            //         .first) {
                            //   controller.interActive.add({idpost: false});
                            // } else {
                            //   controller.interActive.add({idpost: true});
                            // }
                            // controller.interActive.add({idpost: true});
                            // controller.userpost.value.IdPost = idpost;
                            // controller.userpost.value.post = posts;
                            // controller.userpost.value.user =
                            //     controller.user.value;
                            // controller.userpost.value.Id =
                            //     controller.user.value.Id;
                            // if (interaction) {
                            //   controller.userpost.value.Interaction = false;
                            //   controller.GetInterActionUser();
                            // } else {
                            //   controller.userpost.value.Interaction = true;
                            //   controller.GetInterActionUser();
                            // }
                            // if (controller.click == false) {
                            //   controller.click.value = true;
                            // } else {
                            //   controller.click.value = false;
                            // }
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor:
                                const Color.fromARGB(255, 248, 150, 153),
                            shape: const CircleBorder(),
                          ),
                          child: Icon(AppIconn.favorite,
                              size: 14,
                              color: controller.sta.value == true
                                  ? Colors.red
                                  : Colors.white
                              // controller.interActive.any(
                              //         (element) => element.keys.first == idpost)
                              //     ? controller.interActive
                              //             .where((element) =>
                              //                 element.keys.first == idpost)
                              //             .first
                              //             .values
                              //             .first
                              //         ? Colors.red
                              //         : Colors.white
                              //     : Colors.grey,
                              ))

                      // Icon(Icons.add_alert),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
