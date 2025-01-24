import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../controller/menu_game_controller.dart';
import '../controller/word_controller.dart';
import 'first_level.dart';
import 'second_level.dart';
import 'third_level.dart';

class Splashscrren extends GetView<MenuGameController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
              Get.find<SplashScreencontroller>().initLetter();

              switch (controller.numberlevel.value) {
                case 1:
                  Get.to(const FirstLevelWord());
                  controller.onReady();
                  break;
                case 2:
                  Get.to(const SecondLevelWord());
                  controller.onReady();
                  break;
                default:
                  Get.to(const ThirdLevelWord());
                  controller.onReady();
                  break;
              }
            },
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: Colors.pink, width: 2)),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'WelcomtoWordPlay'.tr,
                  style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      color: Colors.black87),
                ),
              ),
            ),
          ),
          Container(height: 160),
        ],
      ),
    );
  }
}
