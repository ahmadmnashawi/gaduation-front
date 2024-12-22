import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:graduationproject/modules/MenuGame/controller/menu_game_controller.dart';

import '../controller/math_controller.dart';
import 'math4n.dart';
import 'math7.dart';
import 'mathn1.dart';

class DefineMath extends GetResponsiveView<MenuGameController> {
  MenuGameController controller=Get.put(MenuGameController());
  MathController t=Get.put(MathController());
  DefineMath({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: const AssetImage(
                      'assets/images/d.png',
                    ),
                    fit: BoxFit.cover,
                    colorFilter: ColorFilter.mode(
                        Colors.white.withOpacity(0.25), BlendMode.modulate))),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  InkWell(
                    onTap: () => Get.back(),
                    child: const Align(
                      alignment: Alignment.topLeft,
                      child: Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Icon(Icons.arrow_back_ios,
                            size: 20, color: Colors.grey),
                      ),
                    ),
                  ),
                   Padding(
                    padding: EdgeInsets.fromLTRB(8, 80, 8, 8),
                    child: Center(
                        child: Text(
                      'MathGame'.tr,
                      style: TextStyle(
                          fontSize: 30,
                          fontFamily: "Pacifico",
                          fontWeight: FontWeight.bold,
                          color: Colors.blueGrey),
                    )),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SizedBox(
                        height: 170,
                        width: 170,
                        child: Image.asset('assets/images/10.png')),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  TextButton(
                    onPressed: () {
                           switch(controller.numberlevel.value){
                  case 1:
                    Get.to(MathNew11PageView());
                      controller.onReady();
                    break;
                     case 2:
                    Get.to(MathNew4PageView());
                      controller.onReady();
                    break;
                    
                   default:
                      Get.to(MathNew7PageView());
                    break;
                }
              
                     
                    },
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(
                              color: const Color.fromARGB(255, 62, 153, 65),
                              width: 2)),
                      child:  Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text(
                          'areyouu'.tr,
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
            )
            ));
  }
}
