import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../controller/menu_game_controller.dart';
import '../controller/word_controller.dart';
import 'form4.dart';
import 'form7.dart';
import 'form_word1.dart';

class Splashscrren extends GetView<MenuGameController> {
   MenuGameController controller = Get.put(MenuGameController());
   SplashScreencontroller t=Get.put(SplashScreencontroller ());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: const Color.fromARGB(255, 235, 228, 200),
      body: SingleChildScrollView(
        child: Column(
          children: [
              SingleChildScrollView(
                child: Column(
                      //mainAxisAlignment: MainAxisAlignment.center,
                      children: [
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
                        const SizedBox(
                height: 180,
                        ),
                        SizedBox(
                width: 150,
                height: 150,
                child: Image.asset('assets/images/welcom.png'),
                        ),
                        TextButton(
                onPressed: () {
                  // Get.to(FormwordPageView());
                  switch(controller.numberlevel.value){
                    case 1:
                      Get.to(FormwordPageView());
                        controller.onReady();
                      break;
                       case 2:
                      Get.to(Formword4PageView());
                        controller.onReady();
                      break;
                     default:
                      Get.to(Formword7PageView());
                        controller.onReady();
                      break;
                  }
                },
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(
                          color:  Colors.pink, width: 2)),
                  child:  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      'WelcomtoWordPlay'.tr,
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          color: Colors.black87),
                    ),
                  ),
                ),
                        ),
                         Container(height: 160,),
                        Tooltip(
                  message: 'lp'.tr,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Align(
                      alignment: Alignment.bottomRight,
                      child: IconButton(onPressed: (){
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
                                                  "el".tr,
                                                  style: TextStyle(
                                                      fontSize: 25,
                                                      fontWeight: FontWeight.bold,
                                                      fontFamily: "Pacifico",
                                                      color: Color.fromARGB(255, 42, 42, 114),
                                                      decoration: TextDecoration.none),
                                                ),
                                              )),
                                        ),
                                                 Padding(
                                                   padding: const EdgeInsets.fromLTRB(10, 8, 10, 10),
                                                   child: Column(
                                                               children: <Widget>[
                                                                 new Text(
                                                                   t. text1,
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
                      }, icon: Icon(Icons.help_outline_outlined,
                      size: 30,
                      color:Color.fromARGB(255, 246, 123, 127) ,)),
                    ),
                  ),
                )
                      ],
                    ),
              )
          ],
        //       children: [
        //         InkWell(
        //           onTap: () => Get.back(),
        //           child: const Align(
        //             alignment: Alignment.topLeft,
        //             child: Padding(
        //               padding: EdgeInsets.all(8.0),
        //               child: Icon(Icons.arrow_back_ios, size: 20, color: Colors.grey),
        //             ),
        //           ),
        //         ),
        //         const SizedBox(
        //           height: 30,
        //         ),
        //         Align(
        //           alignment: Alignment.topLeft,
        //           child: myname(),
        //         ),
        //         SizedBox(
        //           height: Get.height * 0.25,
        //         ),
        //         Center(
        //           child: animationcentre(),
        //         ),
        //         const SizedBox(
        //           height: 20,
        //         ),
        //         footertext(),
        //         Padding(
        //           padding: const EdgeInsets.fromLTRB(8, 15, 8, 8),
        //           child: ElevatedButton(
        //               style: ButtonStyle(
        //                 backgroundColor: MaterialStateProperty.all(Colors.pink[200]),
        //               ),
        //               onPressed: () {
        //                 // Get.to(FormwordPageView());
        //                 // Get.to(Formword3PageView());
        //               },
        //               child: const Text('Start',
        //                   style: TextStyle(
        //                       fontSize: 20,
        //                       fontWeight: FontWeight.bold,
        //                       color: Colors.white))),
        //         )
        //       ],
        //     ),
        //   );
        // }
      
        // Widget myname() {
        //   return Transform(
        //     transform: Matrix4.rotationZ(50),
        //     child: const Text(
        //       'Welcomme',
        //       style: TextStyle(color: Colors.white, fontSize: 20),
        //     ),
        //   );
        // }
      
        // Widget animationcentre() {
        //   return Center(
        //     child: Obx(() => AnimatedContainer(
        //           width: controller.width.value.toDouble(),
        //           height: controller.hight.value.toDouble(),
        //           decoration: BoxDecoration(
        //             color: const Color.fromARGB(255, 236, 163, 218),
        //             borderRadius: BorderRadius.circular(100),
        //             boxShadow: [
        //               BoxShadow(
        //                   color: Colors.grey.shade600,
        //                   spreadRadius: 1,
        //                   blurRadius: 15)
        //             ],
        //           ),
        //           duration: const Duration(seconds: 1),
        //           curve: Curves.fastOutSlowIn,
        //           child: mword(),
        //         )),
        //   );
        // }
      
        // Widget footertext() {
        //   return Center(
        //       child: Obx(() => AnimatedContainer(
        //             margin: EdgeInsets.only(left: controller.footermargin.value),
        //             width: controller.footerwidth.value.toDouble(),
        //             duration: const Duration(seconds: 2),
        //             curve: Curves.easeInOut,
        //             child: Obx(() =>
        //                 controller.mwidth.value == 90 && controller.footermargin < 90
        //                     ? Text(
        //                         'Form Word',
        //                         style: TextStyle(
        //                             color: const Color.fromARGB(255, 241, 128, 217),
        //                             fontSize: controller.footerFontersize.value),
        //                       )
        //                     : const Text('')),
        //           )));
        // }
      
        // Widget mword() {
        //   return Center(
        //       child: Obx(() => AnimatedContainer(
        //           width: controller.mwidth.value.toDouble(),
        //           duration: const Duration(seconds: 1),
        //           curve: Curves.fastOutSlowIn,
        //           child: Obx(
        //             () => controller.mwidth > 10
        //                 ? Text(
        //                     'W',
        //                     style: TextStyle(
        //                       fontSize: controller.mFontsize.value,
        //                       color: const Color.fromARGB(255, 235, 228, 200),
        //                     ),
        //                   )
        //                 : const Text(''),
        //           ))));
        ),
      ));
}}
