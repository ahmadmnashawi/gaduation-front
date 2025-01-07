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
  late AnimationController animationController;
  final textMath =
      'In this game, a set of arithmetic operations will appear, and you must choose the correct answer';
  final textWordGame =
      'In this game a picture will appear and you must find out all the words that can apply to the picture';
  final textLetter =
      'In this game a group of letters will appear and all the words that can be formed from these letters must be found';
  final textFoucs =
      'In this game, a picture appears with a question that needs to be focused before answering';
  final text =
      'In this interface, you will display all the existing games, where each game has three levels, and each level has three stages';
  late Animation<double> animation;
  static MenuGameController get find => Get.find();
  var level = ''.obs;
  var numberlevel = 0.obs;
  final listGameUser = <GameDto>[].obs;
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
    animationController =
        AnimationController(duration: const Duration(seconds: 5), vsync: this);
    animation =
        CurvedAnimation(parent: animationController, curve: Curves.linear);
    animationController.repeat();
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
              mainAxisSize: MainAxisSize.min,
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
          Get.dialog(Material(
            child: Column(
              mainAxisSize: MainAxisSize.min,
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
            ),
          ));
        } else {
          numberlevel.value = 2;
          updateUserGame.value.userLevel = 'Second Level';

          Get.to(getGamenow(id: selectedgame.value.Id!));
        }

        break;
      default:
        if (int.parse(levaeGame!) > 3) {
          Get.dialog(Material(
            child: Column(
              mainAxisSize: MainAxisSize.min,
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
            ),
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

  Future<GameDto> getUserLevel(int gameId) async {
    final result = await gamRepo.getUserGameLevels(user.value.Id!, gameId);
    return result;
  }

  Future<void> getAllGame() async {
    var data = await gamRepo.Getgame(user.value.Id!);
    listGameUser.assignAll(data);
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
