import 'package:get/get.dart';

import '../controller/splash-screen-controller.dart';

class IntroBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(SplashScreenController());
  }
}
