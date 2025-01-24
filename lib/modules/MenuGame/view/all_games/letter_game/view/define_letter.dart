import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:graduationproject/modules/MenuGame/view/all_games/letter_game/controller/letter_controller.dart';
import 'package:graduationproject/modules/MenuGame/view/all_games/letter_game/view/second_level.dart';
import 'package:graduationproject/modules/MenuGame/view/all_games/letter_game/view/third_level.dart';

import '../../../../controller/menu_game_controller.dart';
import 'first_level.dart';

class splashscreenLetter extends GetResponsiveView<MenuGameController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
          Column(
            children: [
              SizedBox(
                width: 150,
                height: 150,
                child: Image.asset('assets/images/letter.png'),
              ),
              TextButton(
                onPressed: () {
                  Get.find<LetterController>().initLetter();

                  switch (controller.numberlevel.value) {
                    case 1:
                      Get.to(const FirstLevel());
                      break;
                    case 2:
                      Get.to(SecondLevel());
                      break;
                    default:
                      Get.to(ThirdLevel());
                      break;
                  }
                },
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(
                          color: const Color.fromARGB(255, 62, 153, 65),
                          width: 2)),
                  child: Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      'WelcomtoLetterPlay'.tr,
                      style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          color: Colors.black87),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
