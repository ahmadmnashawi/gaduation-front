import 'dart:async';

import 'package:flutter/animation.dart';
import 'package:get/get.dart';

import '../../../../../sheard/auth_service.dart';
import '../../../../controller/menu_game_controller.dart';

class FoucsController extends GetxController
    with GetSingleTickerProviderStateMixin {
  late AnimationController animationController;
  var isAnimating = false.obs;
  var score = 0.obs;
  final auth = Get.find<AuthService>();
  Timer? _timer;
  int remainingSecond = 1;
  final indexLevel = 1.obs;
  final word1Level = [
    ' How many numbers are there in the picture',
    '  How Number The SquareIn This Photo ?',
    'How Many Nignt  In This Photo ?'
  ];
  final image1Level = [
    'assets/images/24.png',
    'assets/images/20.png',
    'assets/images/23.png'
  ];
  final answer1Level = [
    ['7', '8', '9'],
    ['7', '8', '9'],
    ['9', '7', '5']
  ];
  final right1Answer = ['7', '8', '9'];

  final word2Level = [
    'How many Cubes are there in the picture?',
    'How Many Square In This Photo ?',
    'How Number The triangle In This Photo ?'
  ];
  final image2Level = [
    'assets/images/cubes.png',
    'assets/images/19.png',
    'assets/images/18.png'
  ];
  final answer2Level = [
    ['7', '8', '9'],
    ['11', '13', '15'],
    ['30', '33', '35'],
  ];
  final right2Answer = ['9', '11', '35'];

  final word3Level = [
    ' How Many Traingles In  This Photo ?',
    ' How Many  Square In  This Photo ?',
    ' How Many triangle In This Photo ?'
  ];
  final image3Level = [
    'assets/images/17.png',
    'assets/images/22.png',
    'assets/images/16.png'
  ];
  final answer3Level = [
    ['24', '19', '27'],
    ['44', '42', '40'],
    ['44', '42', '40'],
  ];
  final right3Answer = ['27', '40', '44'];
  final time = '00.00'.obs;
  @override
  void onInit() {
    super.onInit();
    score.value = 0;
    animationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 5000));
  }

  @override
  void onClose() {
    if (_timer != null) {
      _timer!.cancel();
    }
    super.onClose();
  }

  Future<void> saveScore(int score, int level) async {
    var guser =
        auth.getGameUser()!.where((element) => element.IdGame == 4).first;

    guser.Score = score;
    guser.userLevel = level.toString();
    var result = await auth.updateUserGame(guser);
    if (result) {
      await Get.find<MenuGameController>().getAllGame();
    }
  }

  void initTime() {
    _starTimer(120);
  }

  void _starTimer(int seconds) {
    const duration = Duration(seconds: 1);
    remainingSecond = seconds;
    _timer = Timer.periodic(duration, (Timer timer) {
      if (remainingSecond == 0) {
        timer.cancel();
      } else {
        int minutes = (remainingSecond ~/ 60);
        int seconds = (remainingSecond % 60);
        time.value =
            '${minutes.toString().padLeft(2, '0')}:${seconds.toString().padLeft(2, '0')}';
        remainingSecond--;
      }
    });
  }
}
