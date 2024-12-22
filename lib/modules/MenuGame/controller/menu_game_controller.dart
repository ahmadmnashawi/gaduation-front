import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../app/model/GameDto.dart';
import '../../../app/model/game.dart';
import '../../../app/model/game_user.dart';
import '../../../app/model/user.dart';
import '../../sheard/auth_service.dart';
import '../data/game_repositry.dart';
import '../view/all_games/foucs/view/define_foucs.dart';
import '../view/all_games/letter_game/view/define_letter.dart';
import '../view/all_games/math/view/define_math.dart';
import '../view/all_games/packet/view/packet.dart';
import '../view/all_games/word_game/view/define_word.dart';

class MenuGameController extends GetxController
    with GetSingleTickerProviderStateMixin {
  late AnimationController ancontroller;
  final text =
      'In this interface, you will display all the existing games, where each game has three levels, and each level has three stages';
  late Animation<double> animation;
  static MenuGameController get find => Get.find();
  var level = ''.obs;
  var numberlevel = 0.obs;
  final ListGameUser = <GameDto>[].obs;
  final gamRepo = GameRepository();
  RxBool animate = false.obs;
  final auth = Get.find<AuthService>();
  final user = User().obs;
  final updateUserGame = GameUser().obs;
  final selectedgame = Game().obs;
  final idnowGameuser = 0.obs;
  @override
  void onInit() {
    super.onInit();
    ancontroller =
        AnimationController(duration: const Duration(seconds: 5), vsync: this);
    animation = CurvedAnimation(parent: ancontroller, curve: Curves.linear);
    ancontroller.repeat();
    GetUser();
    getAllGame();
  }

  Future<void> NumberLevel() async {
    var levaeGame = auth
        .getGameUser()!
        .where((element) => element.IdGame == selectedgame.value.Id)
        .first
        .userLevel;
    switch (level.value) {
      case 'First Level':
        if (int.parse(levaeGame!) > 1) {
          Get.dialog(Material(
            child: Column(
              children: [
                const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text('You Passed Level1 Want to rePaly?'),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      TextButton(
                          onPressed: () {
                            numberlevel.value = 1;
                            updateUserGame.value.userLevel = 'First Level';
                            Get.back();
                            Get.to(getGamenow(id: selectedgame.value.Id!));
                          },
                          child: Text('Yes'.tr)),
                      TextButton(
                          onPressed: () {
                            Get.back();
                          },
                          child: Text('No'.tr)),
                    ],
                  ),
                )
              ],
            ),
          ));
        } else {
          numberlevel.value = 1;
          updateUserGame.value.userLevel = 'First Level';
          Get.to(getGamenow(id: selectedgame.value.Id!));
        }

        break;
      case 'Second Level':
        if (int.parse(levaeGame!) > 2) {
          Get.dialog(Column(
            children: [
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: Text('You Passed Level12 Want to rePaly?'),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    TextButton(
                        onPressed: () {
                          numberlevel.value = 2;
                          updateUserGame.value.userLevel = 'Second Level';
                          Get.back();
                          Get.to(getGamenow(id: selectedgame.value.Id!));
                        },
                        child: Text('Yes'.tr)),
                    TextButton(
                        onPressed: () {
                          Get.back();
                        },
                        child: Text('No'.tr)),
                  ],
                ),
              )
            ],
          ));
        } else {
          numberlevel.value = 2;
          updateUserGame.value.userLevel = 'Second Level';

          Get.to(getGamenow(id: selectedgame.value.Id!));
        }

        break;
      default:
        if (int.parse(levaeGame!) > 3) {
          Get.dialog(Column(
            children: [
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: Text('You Passed Level3 Want to rePaly?'),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    TextButton(
                        onPressed: () {
                          numberlevel.value = 3;
                          updateUserGame.value.userLevel = 'Final Level';

                          Get.to(getGamenow(id: selectedgame.value.Id!));
                          Get.back();
                        },
                        child: Text('Yes'.tr)),
                    TextButton(
                        onPressed: () {
                          Get.back();
                        },
                        child: Text('No'.tr)),
                  ],
                ),
              )
            ],
          ));
        } else {
          numberlevel.value = 3;
          updateUserGame.value.userLevel = 'Final Level';
          Get.to(getGamenow(id: selectedgame.value.Id!));
        }
    }
  }

  Future<void> GetUser() async {
    user.value = auth.getDataFromStorage()!;
    updateUserGame.value.IdUser = user.value.Id;
    updateUserGame.value.user = user.value;
  }

  Future<void> getAllGame() async {
    var data = await gamRepo.Getgame(user.value.Id!);
    ListGameUser.assignAll(data);
  }

  Future<void> UpdateGame() async {
    var res =
        await gamRepo.updateUserGame(idnowGameuser.value, updateUserGame.value);
    if (res) {
      Get.back();
    }
  }

  Widget getGamenow({required int id}) {
    Widget widget;
    switch (id) {
      case 1:
        widget = splashscreenLetter();
        break;
      case 2:
        widget = Splashscrren();
        break;
      case 3:
        widget = DefineMath();
        break;
      case 4:
        widget = FoucsGameView();
        break;
      default:
        widget = PacketPageView();

        break;
    }
    return widget;
  }
}
