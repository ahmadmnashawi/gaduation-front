import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../api/ui/util.dart';
import '../../app/model/content.dart';
import '../../app/model/post.dart';
import 'text_feild_GP.dart';

class PostPage extends StatelessWidget {
  const PostPage(
      {required this.contents,
      required this.selectContent,
      required this.stringPickImage,
      required this.post,
      required this.onSave,
      required this.pickImage,
      required this.fromGroup,
      required this.title,
      super.key});
  final RxList<Content>? contents;
  final Rx<Content>? selectContent;
  final Rx<String> stringPickImage;
  final Rx<Post> post;
  final VoidCallback onSave;
  final VoidCallback pickImage;
  final bool fromGroup;
  final String title;
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        width: 500,
        height: Get.height / 2.5,
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: Colors.blueAccent)),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(
                height: 10,
              ),
              Align(
                  alignment: Alignment.center,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      title,
                      style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          fontFamily: "Pacifico",
                          color: Color.fromARGB(255, 42, 42, 114),
                          decoration: TextDecoration.none),
                    ),
                  )),
              Padding(
                padding: const EdgeInsets.all(6),
                child: Column(
                  children: [
                    fromGroup
                        ? Container(
                            decoration: BoxDecoration(
                                border: Border.all(
                                    color: const Color.fromARGB(
                                        255, 194, 192, 192)),
                                borderRadius: BorderRadius.circular(10)),
                            child: Obx(() => DropdownButton<Content>(
                                isExpanded: true,
                                underline: const SizedBox(),
                                value: selectContent!.value,
                                items: contents!
                                    .map((element) => DropdownMenuItem<Content>(
                                        value: element,
                                        child: Text(element.typeName.toString(),
                                            style: const TextStyle(
                                                fontSize: 18,
                                                fontWeight: FontWeight.bold,
                                                color: Colors.black54,
                                                decoration:
                                                    TextDecoration.none))))
                                    .toList(),
                                onChanged: (value) {
                                  selectContent!.value = value!;
                                })))
                        : const SizedBox(),
                    imageProfile(),
                    Material(
                        child: SizedBox(
                            width: Get.height,
                            child: TextFieldGPWidget(
                              obscureText: false,
                              type: TextInputType.text,
                              label: 'Description'.tr,
                              validator: (value) {
                                if (value!.isEmpty ||
                                    !RegExp(r"^[a-zA-Z0-9.!#$%&'*+-/+?^_`{|}~]")
                                        .hasMatch(value)) {
                                  return "EnterCorrectText".tr;
                                } else {
                                  return null;
                                }
                              },
                              dufaltText: post.value.Description ?? "",
                              prefIcon: Icons.text_fields,
                              onChanged: (value) {
                                post.value.Description = value;
                              },
                            ))),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            shadowColor: const Color.fromARGB(255, 42, 42, 114),
                            backgroundColor:
                                const Color.fromARGB(255, 42, 42, 114)),
                        onPressed: onSave,
                        child: Text(
                          'Save'.tr,
                          style: const TextStyle(
                              color: Colors.white, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget imageProfile() {
    return Center(
      child: Stack(
        children: <Widget>[
          Obx(() => CircleAvatar(
                radius: 80.0,
                //  borderRadius: BorderRadius.circular(100),
                child: stringPickImage.value.isNotEmpty
                    ? Utility.imageFromBase64String(
                        stringPickImage.value, 200, 200)
                    : post.value.Image == null
                        ? Image.asset(
                            'assets/images/boy.gif',
                            width: 200,
                            height: 200,
                          )
                        : Utility.imageFromBase64String(
                            Utility.base64String(post.value.Image!), 200, 200),
              )),
          Positioned(
              bottom: 20.0,
              right: 20.0,
              child: InkWell(
                onTap: () async {
                  openBottomSheet();
                },
                child: const Icon(
                  Icons.camera_alt,
                  color: Color.fromARGB(255, 245, 146, 149),
                  size: 28.0,
                ),
              ))
        ],
      ),
    );
  }

  void openBottomSheet() {
    Get.bottomSheet(
      Container(
        height: 120.0,
        width: 500,
        margin: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
        child: Column(
          children: [
            const SizedBox(height: 20),
            Center(
              child: Text(
                'Choose'.tr,
                style: const TextStyle(fontSize: 18),
              ),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                FloatingActionButton(
                  backgroundColor: const Color.fromARGB(255, 246, 123, 127),
                  foregroundColor: Colors.white,
                  mini: true,
                  onPressed: pickImage,
                  child: const Icon(Icons.image),
                ),
                Text('Galleryy'.tr),
              ],
            )
          ],
        ),
      ),
      backgroundColor: Colors.white,
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
    );
  }
}
