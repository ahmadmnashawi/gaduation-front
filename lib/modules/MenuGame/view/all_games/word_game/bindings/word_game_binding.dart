import 'package:get/get.dart';

import '../controller/word_controller.dart';

class WordGameBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(SplashScreencontroller());
  }
}
