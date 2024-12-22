import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'controller/menu_game_controller.dart';

class LevelPageView extends GetResponsiveView<MenuGameController> {
  @override
  MenuGameController controller = Get.put(MenuGameController());

  LevelPageView({super.key});
  @override
  Widget builder() {
    return SingleChildScrollView(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Center(
              child: Text('Levels'.tr,
                  style: const TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      decoration: TextDecoration.none,
                      color: Color.fromARGB(255, 42, 42, 114),
                      fontFamily: "Pacifico")),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Center(
              child: Text('g3'.tr,
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    decoration: TextDecoration.none,
                    color: Color.fromARGB(255, 248, 150, 153),
                  )),
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          shap('gf'.tr),
          shap('gs'.tr),
          shap('g4'.tr),
        ],
      ),
    );
  }

  Widget shap(String title) {
    return Padding(
      padding: const EdgeInsets.all(6.0),
      child: Material(
        child: InkWell(
          onTap: () {
            controller.level.value = title.toString();
            controller.NumberLevel();
          },
          child: Container(
            height: 75,
            width: 300,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(30), //border corner radius
              boxShadow: [
                BoxShadow(
                  color: const Color.fromARGB(255, 185, 97, 123)
                      .withOpacity(0.5), //color of shadow
                  spreadRadius: 3, //spread radius
                  blurRadius: 7, // blur radius
                  offset: const Offset(0, 2),
                ),
              ],
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(
                    width: 4,
                  ),
                  Center(
                    child: Text(title,
                        style: const TextStyle(
                          fontSize: 30,
                          fontFamily: "Pacifico",
                          decoration: TextDecoration.none,
                          color: Colors.black54,
                        )),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
