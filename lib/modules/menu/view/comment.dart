import 'dart:html';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:graduationproject/modules/comment/controller/comment_controller.dart';

import '../../menu/view/HomePage.dart';
import '../controller/menu.dart';

class Comment extends GetResponsiveView<HomeController> {
  HomeController hcontroller = Get.put(HomeController());
  final textfield = TextEditingController();
  @override
  Widget builder() {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Row(
              children: [
                SizedBox(
                  width: 2,
                ),
                InkWell(
                  onTap: () {
                    Get.to(HomePage());
                  },
                  child: Align(
                    alignment: Alignment.topLeft,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Icon(Icons.arrow_back_ios,
                          size: 20, color: Colors.grey),
                    ),
                  ),
                ),
                SizedBox(
                  width: 130,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Center(
                    child: Text(
                      'cm'.tr,
                      style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                          color: Colors.black54),
                    ),
                  ),
                )
              ],
            ),

            Column(
                children: controller.listcomment
                    .map((element) => commentshap(
                        element.user!.Name.toString(),
                        element.commentName.toString(),
                        element.user!.Image.toString()))
                    .toList()),
            //       Obx(() =>  Column(
            //   children: controller.allcommentperson.map(
            //     (e) => commentshap(e.name.toString(), e.comments.toString(),e.photo.toString())
            //   ).toList()
            //       ),
            // ),

            Container(
                padding: EdgeInsets.symmetric(vertical: 3.0),
                child: Row(mainAxisAlignment: MainAxisAlignment.end, children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        controller: textfield,
                        onChanged: (val) {
                   //    controller.addcomment.
                      controller.addcomment.value.commentName=val;
                        },
                        autocorrect: false,
                        decoration: new InputDecoration(
                          // labelText: "Write Your Comment",
                          hintText: "wy".tr,
                          labelStyle:
                              TextStyle(fontSize: 20.0, color: Colors.white),
                          fillColor: Color.fromARGB(255, 42, 42, 114),
                          border: OutlineInputBorder(
                              // borderRadius:
                              //     BorderRadius.all(Radius.zero(5.0)),
                              borderSide: BorderSide(color: Color.fromARGB(255, 42, 42, 114))),
                        ),
                      ),
                    ),
                  ),
                  // Second child is button
                  IconButton(
                    icon: Icon(Icons.send,color: Color.fromARGB(255, 42, 42, 114),),
                    iconSize: 20.0,
                    onPressed: () {
                      controller.addcomment.value.IdPost=controller.IdPost;
                      controller.addcomment.value.user=controller.user.value;
                            controller.AddComment();
                      //  controller.addComment(commentt('Asia badnjki', controller.textfieldd.value, 'assets/images/girl.gif'));
                      textfield.text = '';
                    },
                  )
                ])),
          ],
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
          padding: EdgeInsets.all(8),
          child: Container(
            child: Container(
                decoration: BoxDecoration(
                    color: Color.fromARGB(255, 230, 229, 229),
                    borderRadius: BorderRadius.all(Radius.circular(10.0))),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        name,
                        style: TextStyle(
                            fontSize: 18,
                            color: Color.fromARGB(255, 42, 42, 114),
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        txt,
                        style: TextStyle(
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

// class commentt {
//   String? name;
//   String? comments;
//   List<commentt> allcomment = [];
//   String? photo;

//   commentt(nam, comm, pho) {
//     this.name = nam;
//     this.comments = comm;
//     this.photo = pho;
//   }
//   void setcomment(String namm, String comment, String photo) {
//     commentt s = commentt(namm, comment, photo);
//     allcomment.add(s);
//   }

//   List<commentt> getcomments() {
//     return allcomment;
//   }
// }
