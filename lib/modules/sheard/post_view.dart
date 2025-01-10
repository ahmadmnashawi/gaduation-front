import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:graduationproject/api/ui/date_extation.dart';

import '../../api/ui/util.dart';
import '../../app/model/postdto.dart';
import '../icons/Icon.dart';

class PostView extends StatelessWidget {
  const PostView(
      {required this.postDto,
      required this.withAction,
      this.onComment,
      this.action,
      this.onLike,
      this.isAction,
      super.key});
  final PostDto postDto;
  final bool withAction;
  final VoidCallback? onComment;
  final VoidCallback? onLike;
  final bool? isAction;
  final Widget? action;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(8, 4, 8, 8),
      child: Center(
        child: Container(
          decoration: BoxDecoration(
              border: Border.all(
                color: Colors.grey,
                width: 1.3,
              ),
              color: Colors.white,
              borderRadius: BorderRadius.circular(15)),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Utility.getImage(
                                base64StringPh: postDto.UserImage,
                                isStratch: false,
                                hight: 30,
                                width: 30)),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Align(
                              alignment: Alignment.topLeft,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    postDto.UserName ?? '',
                                    style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 15,
                                        color:
                                            Color.fromARGB(255, 42, 42, 114)),
                                  ),
                                  Text(
                                    getFormattedDate(postDto.post!.dateTime),
                                    style: const TextStyle(
                                        fontSize: 12, color: Colors.grey),
                                  ),
                                ],
                              )),
                        ),
                        postDto.GroupName != null
                            ? const Icon(Icons.arrow_forward_ios_sharp)
                            : Container(),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: postDto.GroupName != null
                              ? Utility.getImage(
                                  base64StringPh: postDto.GroupImage,
                                  link: postDto.GroupImageOnline,
                                  isStratch: false,
                                  hight: 30,
                                  width: 30)
                              : Container(),
                        ),
                        Text(postDto.GroupName ?? '')
                      ],
                    ),
                    action ?? const SizedBox()
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20), // Image border
                    child: Utility.getImage(
                        base64StringPh: postDto.post!.Image,
                        link: postDto.post!.imageOnline,
                        isStratch: true,
                        hight: Get.height / 3.5,
                        width: Get.width),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    postDto.post!.Description ?? '',
                    style: const TextStyle(fontSize: 16),
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                withAction
                    ? Align(
                        alignment: Alignment.bottomRight,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const SizedBox(),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                children: [
                                  IconButton(
                                      color: Colors.black,
                                      hoverColor: const Color.fromARGB(
                                          255, 248, 150, 153),
                                      onPressed: onComment,
                                      icon:
                                          const Icon(AppIconn.chat, size: 18)),
                                  IconButton(
                                      hoverColor: const Color.fromARGB(
                                          255, 248, 150, 153),
                                      onPressed: onLike,
                                      icon: Icon(AppIconn.favorite,
                                          size: 14,
                                          color: isAction!
                                              ? Colors.red
                                              : Colors.black))
                                ],
                              ),
                            ),
                          ],
                        ),
                      )
                    : const SizedBox()
              ],
            ),
          ),
        ),
      ),
    );
  }
}
