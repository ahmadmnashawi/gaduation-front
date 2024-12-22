import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:graduationproject/modules/MenuGame/controller/menu_game_controller.dart';

import '../controller/foucs_controller.dart';
import 'foucs2.dart';
import 'foucs4.dart';
import 'foucs5.dart';
import 'foucs7.dart';

class FoucsGameView extends GetResponsiveView<FoucsController> {
  MenuGameController Mcontroller=Get.put(MenuGameController());
  FoucsGameView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: SingleChildScrollView(
          child: Column(children: [
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
              height: 140,
            ),
            RotationTransition(
              turns: Tween(begin: 0.0, end: 1.0)
                  .animate(controller.animationController),
              child: Container(
                child: Center(
                  child: Image.asset(
                    'assets/images/15.png',
                    fit: BoxFit.cover,
                    height: 180,
                    width: 180,
                  ),
                ),
              ),
            ),
             Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                'fg'.tr,
                style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(255, 179, 96, 154)),
              ),
            ),
             Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                'g8'.tr,
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey),
              ),
            ),
             Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                'eg'.tr,
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(8, 15, 8, 8),
              child: ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(
                        const Color.fromARGB(255, 179, 96, 154)),
                  ),
                  onPressed: () {
                switch(Mcontroller.numberlevel.value){
                  case 1:
                    Get.to(FoucsGameView4());
                      controller.onReady();
                    break;
                     case 2:
                  Get.to(FoucsGameView5());
                      controller.onReady();
                    break;
                   default:
                   Get.to(FoucsGameView7());
                      controller.onReady();
                    break;
                };},
                  child:  Text('py'.tr,
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.white))),
            ),
             Container(height: 160,),
                    Tooltip(
                message: 'HelpAboutPage'.tr,
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
                                                "Help".tr,
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
                                                                 controller. text,
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
          ]),
        ),
      ),
    );
  }
}
