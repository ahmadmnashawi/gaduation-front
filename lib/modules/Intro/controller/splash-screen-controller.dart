import 'package:get/get.dart';

import '../view/intro.dart';

class SplashScreenController extends GetxController {
  static SplashScreenController get find => Get.find();
  final onlastpage = false.obs;
  RxBool animate = false.obs;

  Future<void> onInit() async {
    super.onInit();
    await Future.delayed(const Duration(seconds: 2));
    animate.value = true;
    await Future.delayed(const Duration(seconds: 4));
    Get.to(IntroPageView());
  }

  // void firstTime() {
  //   final isContains = Get.find<AuthService>().stroge.containsKey('one-Time');
  //   if (isContains) {
  //     if (Get.find<AuthService>().isAuth()) {
  //       Get.rootDelegate.offNamed(Paths.HOME);
  //     } else {
  //       Get.rootDelegate.offNamed(Paths.LogIn);
  //     }
  //   } else {
  //     Get.find<AuthService>().stroge.saveData('one-Time', 'saved');
  //     Get.rootDelegate.offNamed(Paths.Intro);
  //   }
  // }
}
