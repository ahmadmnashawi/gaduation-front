import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getwidget/getwidget.dart';

import '../controller/menu.dart';

class ContentPage extends GetResponsiveView<HomeController> {
  ContentPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        Padding(
          padding: EdgeInsets.all(8.0),
          child: Align(
            alignment: Alignment.topLeft,
            child: Text(
              'hp'.tr,
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 25,
                  color: Color.fromARGB(255, 42, 42, 114),
                  fontFamily: "Pacifico"),
            ),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Align(
                alignment: Alignment.topRight,
                child: GFButton(
                  shape: GFButtonShape.pills,
                  color: Color.fromARGB(255, 42, 42, 114),
                  onPressed: () {
                    controller.GetAllContent();
                    Get.dialog(Align(
                      alignment: Alignment.topRight,
                      child: Container(
                        width: 200,
                        height: 900,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(color: Colors.blueAccent)),
                        child: SingleChildScrollView(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              const SizedBox(
                                height: 10,
                              ),
                               Align(
                                  alignment: Alignment.center,
                                  child: Padding(
                                    padding: EdgeInsets.all(8.0),
                                    child: Text(
                                      "cs".tr,
                                      style: TextStyle(
                                          fontSize: 25,
                                          fontWeight: FontWeight.bold,
                                          fontFamily: "Pacifico",
                                          color:
                                              Color.fromARGB(255, 42, 42, 114),
                                          decoration: TextDecoration.none),
                                    ),
                                  )),
                              Obx(() => Wrap(
                                    children: controller.Contents.map(
                                        (element) => buildContent(
                                            element.typeName.toString(),
                                            element.Id!)).toList(),
                                  ))
                            ],
                          ),
                        ),
                      ),
                    ));
                  },
                  text: "cs".tr,
                  textStyle: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
              ),
            ),
            Tooltip(
              message: 'HelpAboutPage'.tr,
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
                                      child:  Align(
                                          alignment: Alignment.center,
                                          child: Padding(
                                            padding: EdgeInsets.all(8.0),
                                            child: Text(
                                              "Help".tr,
                                              style: TextStyle(
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
                                          new Text(
                                            controller.text,
                                            textAlign: TextAlign.left,
                                            style: TextStyle(
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
                      icon: Icon(
                        Icons.help_outline_outlined,
                        size: 30,
                        color: Color.fromARGB(255, 246, 123, 127),
                      )),
                ),
              ),
            )
          ],
        )

//                      Container(
//   width: 700,
//   child: GFAnimation(
//     controller: controller.ancontroller,
//     slidePosition: controller. offsetAnimation,
//     type: GFAnimationType.slideTransition,
//     child: Row(
//       children: [
//         Image.asset(
//           'assets/images/12.png',
//           width: 50,
//           height: 40,
//         ),
//         Text('Home Page',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 25,
//           color: Colors.blueGrey,fontFamily: "Pacifico"
//         ),)
//       ],
//     ),
//   ),
// ),
        // Container(
        //   height: 50,
        //   child: ListView.separated(
        //     scrollDirection: Axis.horizontal,
        //     itemBuilder: (context, index) => buildContent(controller.Contents[index].typeName.toString(),controller.Contents[index].Id!),
        //      separatorBuilder: (context,_)=>SizedBox(width: 6,),
        //       itemCount: controller.Contents.length),
        // ),
      ]),
    );
  }

  Widget buildContent(String content, int idcontentt) => Padding(
        padding: const EdgeInsets.all(8.0),
        child: Material(
          child: InkWell(
            onTap: () {
              controller.idcontent.value = idcontentt;
              controller.GetpostByType();
            },
            child: Container(
              height: 40,
              decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 248, 150, 153),
                  borderRadius: BorderRadius.circular(14)),
              child: Center(
                child: Text(
                  content,
                  style: const TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ),
        ),
      );
}
