import 'dart:async';

import 'package:get/get.dart';

class TimerController extends GetxController {
  Timer? _timer;
  var answer = 0.obs;
  var answer2 = 0.obs;
  var answer3 = 0.obs;
  int remanningsecond = 1;
  final time = '00.00'.obs;
  var result = 0.obs;
  var result2 = 100.obs;
  var result3 = 200.obs;
  @override
  void onClose() {
    if (_timer != null) {
      _timer!.cancel();
    }
    super.onClose();
  }

  @override
  void onReady() {
    _startimer(01);
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
        remanningsecond++;
      }
    });
  }
}
