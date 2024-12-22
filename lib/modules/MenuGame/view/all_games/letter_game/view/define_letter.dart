import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../controller/menu_game_controller.dart';
import '../controller/letter_controller.dart';
import 'letter4.dart';
import 'letter6.dart';
import 'letter7.dart';

class splashscreenLetter extends GetResponsiveView< MenuGameController> {
   MenuGameController controller=Get.put( MenuGameController());
LetterController t=Get.put(LetterController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: Center(
          child:
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
              child: Image.asset('assets/images/letter.png'),
                     ),
                     TextButton(
              onPressed: () {
                switch(controller.numberlevel.value){
                  case 1:
                    Get.to(Letter4pageview());
                      controller.onReady();
                    break;
                     case 2:
                    Get.to(Letter6pageview());
                      controller.onReady();
                    break;
                   default:
                    Get.to(Letter7pageview());
                      controller.onReady();
                    break;
                }
              },
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                        color: const Color.fromARGB(255, 62, 153, 65), width: 2)),
                child:  Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    'WelcomtoLetterPlay'.tr,
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
                                                                 t. text,
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
           )),
    );
  }
}
