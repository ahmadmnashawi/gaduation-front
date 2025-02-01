import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:graduationproject/modules/MenuGame/controller/menu_game_controller.dart';
import 'package:graduationproject/modules/MenuGame/view/all_games/foucs/controller/foucs_controller.dart';
import 'package:graduationproject/modules/MenuGame/view/all_games/foucs/view/second_level.dart';
import 'package:graduationproject/modules/MenuGame/view/all_games/foucs/view/thrid_level.dart';

import 'first_level.dart';

class FoucsGameView extends GetResponsiveView {
  FoucsGameView({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<MenuGameController>();
    return Scaffold(
      body: SingleChildScrollView(
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
            padding: const EdgeInsets.all(8.0),
            child: Text(
              'fg'.tr,
              style: const TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(255, 179, 96, 154)),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              'g8'.tr,
              style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.grey),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              'eg'.tr,
              style: const TextStyle(
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
                  final foucsController = Get.find<FoucsController>();
                  foucsController.initTime();
                  switch (controller.numberlevel.value) {
                    case 1:
                      foucsController.score.value = 0;
                      Get.to(const FirstLevelFoucs());

                      break;
                    case 2:
                      foucsController.score.value = 0;
                      Get.to(const SecondLevelFoucs());

                      break;
                    default:
                      foucsController.score.value = 0;
                      Get.to(const ThirdLevelFoucs());

                      break;
                  }
                },
                child: Text('py'.tr,
                    style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.white))),
          ),
          Container(
            height: 160,
          ),
        ]),
      ),
    );
  }
}
