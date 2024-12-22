import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:graduationproject/modules/comment/controller/comment_controller.dart';

import '../../menu/view/HomePage.dart';

class CommentPageView extends GetResponsiveView<CommentController> {
  @override
  CommentController controller = Get.put(CommentController());
  final textfield = TextEditingController();
  int? idPost;
  CommentPageView({this.idPost, super.key});
  @override
  Widget builder() {
    return Scaffold(
      body: SingleChildScrollView(
        child: SizedBox(
          child: Column(
            mainAxisSize: MainAxisSize.min,
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
                    padding: EdgeInsets.all(8.0),
                    child: Center(
                      child: Text(
                        'Comments'.tr,
                        style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                            color: Colors.black54),
                      ),
                    ),
                  )
                ],
              ),
              Obx(
                () => Column(
                    children: controller.allcommentperson
                        .map((e) => commentshap(e.name.toString(),
                            e.comments.toString(), e.photo.toString()))
                        .toList()),
              ),
              Container(
                  padding: const EdgeInsets.symmetric(vertical: 3.0),
                  child:
                      Row(mainAxisAlignment: MainAxisAlignment.end, children: [
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextFormField(
                          controller: textfield,
                          onChanged: (val) {
                            controller.textfieldd.value = val;
                          },
                          autocorrect: false,
                          decoration:  InputDecoration(
                            // labelText: "Write Your Comment",
                            hintText: "WriteYourr".tr,
                            labelStyle:
                                TextStyle(fontSize: 20.0, color: Colors.white),
                            fillColor: Colors.blueGrey,
                            border: OutlineInputBorder(
                                // borderRadius:
                                //     BorderRadius.all(Radius.zero(5.0)),
                                borderSide: BorderSide(color: Colors.blueGrey)),
                          ),
                        ),
                      ),
                    ),
                    // Second child is button
                    IconButton(
                      icon: const Icon(Icons.send),
                      iconSize: 20.0,
                      onPressed: () {
                        controller.addComment(commentt(
                            'Asia badnjki',
                            controller.textfieldd.value,
                            'assets/images/girl.gif',
                            idPost));
                        textfield.text = '';
                      },
                    )
                  ])),
            ],
          ),
        ),
      ),
    );
  }

  Widget commentshap(String name, String txt, String photo) {
    return Row(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: CircleAvatar(
            radius: 30,
            backgroundImage: AssetImage(photo),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8),
          child: Container(
            child: Container(
                decoration: const BoxDecoration(
                    color: Color.fromARGB(255, 230, 229, 229),
                    borderRadius: BorderRadius.all(Radius.circular(10.0))),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        name,
                        style: const TextStyle(
                            fontSize: 18,
                            color: Colors.blueGrey,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        txt,
                        style: const TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                )),
          ),
        ),
      ],
    );
  }
}

class commentt {
  String? name;
  String? comments;
  List<commentt> allcomment = [];
  String? photo;
  int? idPost;

  commentt(nam, comm, pho, idpost) {
    name = nam;
    comments = comm;
    photo = pho;
    idPost = idpost;
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = <String, dynamic>{};
    json['id'] = 0;
    json['comment'] = comments;
    json['idPost'] = idPost;
    return json;
  }

  void setcomment(String namm, String comment, String photo, int idp) {
    commentt s = commentt(namm, comment, photo, idp);
    allcomment.add(s);
  }

  List<commentt> getcomments() {
    return allcomment;
  }
}
