import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:graduationproject/app/model/GameDto.dart';
import 'package:graduationproject/modules/menu/view/HomePage.dart';

import '../../api/ui/help_page.dart';
import '../../api/ui/util.dart';
import 'controller/menu_game_controller.dart';
import 'levels.dart';

// ignore: must_be_immutable
class MenuGamePageView extends GetResponsiveView<MenuGameController> {
  MenuGamePageView({super.key});
  @override
  Widget builder() {
    final random = Random();

    return SizedBox(
        height: screen.height,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Row(
                children: [
                  Material(
                    child: InkWell(
                      onTap: () => Get.to(HomePage()),
                      child: const Align(
                        alignment: Alignment.topLeft,
                        child: Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Icon(Icons.arrow_back_ios,
                              size: 20, color: Colors.grey),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 8,
                  ),
                  Text('g5'.tr,
                      style: const TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                          decoration: TextDecoration.none,
                          color: Color.fromARGB(255, 42, 42, 114),
                          fontFamily: "Pacifico")),
                ],
              ),
              const SizedBox(
                height: 15,
              ),
              Obx(() => Column(
                  children: controller.listGameUser
                      .map((e) => cardShape(e, random))
                      .toList())),
              HelpPage()
            ],
          ),
        ));
  }

  Widget cardShape(GameDto game, Random random) {
    return Material(
        child: InkWell(
            onTap: () {
              final id = controller.auth.getDataFromStorage()!.Id;
              if (game.gameUser!.any((element) => element.IdUser == id)) {
                controller.auth.SaveGameUser(game.gameUser!
                    .where((element) => element.IdUser == id)
                    .toList());
              }
              controller.selectedgame.value = game.game!;
              Get.dialog(Align(
                alignment: Alignment.center,
                child: Container(
                  width: 400,
                  height: 400,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: Colors.blueAccent)),
                  child: LevelPageView(),
                ),
              ));
            },
            child: SizedBox(
                width: 800,
                child: Card(
                    margin: const EdgeInsets.all(10),
                    color: const Color.fromARGB(255, 42, 42, 114),
                    shadowColor: const Color.fromARGB(255, 42, 42, 114),
                    elevation: 30,
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Utility.getImage(
                                  base64StringPh: game.game!.Image,
                                  link: game.game!.imageOnline,
                                  hight: 150,
                                  width: 150),
                              Column(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      game.game!.GameName!,
                                      style: const TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white,
                                          fontSize: 20),
                                    ),
                                  ),
                                  Column(
                                    children: game.gameUser!
                                        .map((e) => Column(
                                              children: [
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.all(4),
                                                  child: Text(
                                                    '${'g6'.tr} :${e.userLevel}',
                                                    style: const TextStyle(
                                                      color: Color.fromARGB(
                                                          255, 230, 219, 219),
                                                      fontSize: 15,
                                                    ),
                                                  ),
                                                ),
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.all(4),
                                                  child: Text(
                                                      '${'g7'.tr}${e.Score}',
                                                      style: const TextStyle(
                                                        color: Color.fromARGB(
                                                            255, 230, 219, 219),
                                                        fontSize: 15,
                                                      )),
                                                ),
                                              ],
                                            ))
                                        .toList(),
                                  ),
                                ],
                              ),
                              const SizedBox()
                            ],
                          ),
                        ])))));
  }
}
