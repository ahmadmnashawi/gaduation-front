import 'package:get/get.dart';

import '../controller/timer_controller.dart';

class TimerBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(TimerController());
  }
}
