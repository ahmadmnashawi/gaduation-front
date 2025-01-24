import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:graduationproject/modules/MenuGame/controller/menu_game_controller.dart';
import 'package:graduationproject/modules/MenuGame/view/all_games/math/controller/math_controller.dart';
import 'package:graduationproject/modules/MenuGame/view/all_games/math/view/second_level.dart';
import 'package:graduationproject/modules/MenuGame/view/all_games/math/view/third_level.dart';

import 'first_level.dart';

class DefineMath extends GetResponsiveView<MenuGameController> {
  DefineMath({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        Container(
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: const AssetImage(
                    'assets/images/d.png',
                  ),
                  fit: BoxFit.cover,
                  colorFilter: ColorFilter.mode(
                      Colors.white.withOpacity(0.25), BlendMode.modulate))),
          child: SizedBox(
            height: context.height,
            width: context.width,
          ),
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            InkWell(
              onTap: () => Get.back(),
              child: const Align(
                alignment: Alignment.topLeft,
                child: Padding(
                  padding: EdgeInsets.all(8.0),
                  child:
                      Icon(Icons.arrow_back_ios, size: 20, color: Colors.grey),
                ),
              ),
            ),
            Column(
              children: [
                Padding(
                  padding: EdgeInsets.fromLTRB(8, 80, 8, 8),
                  child: Center(
                      child: Text(
                    'MathGame'.tr,
                    style: const TextStyle(
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
                    final mathController = Get.find<MathController>();
                    mathController.initTime();

                    switch (controller.numberlevel.value) {
                      case 1:
                        mathController.score.value = 0;
                        Get.to(const FirstLevelMath());

                        break;
                      case 2:
                        mathController.score.value = 0;
                        Get.to(const SecondLevelMath());

                        break;

                      default:
                        mathController.score.value = 0;
                        Get.to(const ThirdLevelMath());
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
                        'areyouu'.tr,
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
      ],
    ));
  }
}
