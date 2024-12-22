import 'dart:async';

import 'package:get/get.dart';

import '../../../../../sheard/auth_service.dart';

class MathController extends GetxController {
  Timer? _timer;
  var answer = 0.obs;
  var answer2 = 0.obs;
  var answer3 = 0.obs;
  int remanningsecond = 1;
  final time = '00.00'.obs;
  var result = 0.obs;
  var result2 = 100.obs;
  var score = 0.obs;
  var score2 = 0.obs;
  var score3 = 0.obs;
  var result3 = 200.obs;
  final auth = Get.find<AuthService>();
  final text =
      'In this game, a set of arithmetic operations will appear, and you must choose the correct answer';
  @override
  void onClose() {
    if (_timer != null) {
      _timer!.cancel();
    }
    super.onClose();
    var guser =
        auth.getGameUser()!.where((element) => element.IdGame == 3).first;
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
