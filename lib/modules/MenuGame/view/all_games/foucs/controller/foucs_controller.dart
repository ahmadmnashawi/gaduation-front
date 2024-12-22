import 'dart:async';

import 'package:flutter/animation.dart';
import 'package:get/get.dart';

import '../../../../../sheard/auth_service.dart';

class FoucsController extends GetxController
    with GetSingleTickerProviderStateMixin {
  late AnimationController animationController;
  var isAnimating = false.obs;
  var score = 0.obs;
  final auth = Get.find<AuthService>();
  Timer? _timer;
  int remanningsecond = 1;
  final text =
      'In this game, a picture appears with a question that needs to be focused before answering';
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
    var guser =
        auth.getGameUser()!.where((element) => element.IdGame == 4).first;
    guser.Score = score.value;
    auth.updateUserGame(guser);
  }

  @override
  void onReady() {
    _startimer(50);
    super.onReady();
  }

  void _startimer(int seconds) {
    const duration = Duration(seconds: 1);
    remanningsecond = seconds;
    _timer = Timer.periodic(duration, (Timer timer) {
      if (remanningsecond == 0) {
        timer.cancel();
      } else {
        int minutes = (remanningsecond ~/ 60);
        int seconds = (remanningsecond % 60);
        time.value =
            '${minutes.toString().padLeft(2, '0')}:${seconds.toString().padLeft(2, '0')}';
        remanningsecond--;
      }
    });
  }
}
