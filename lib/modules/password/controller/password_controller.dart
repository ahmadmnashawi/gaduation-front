import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:graduationproject/routes/app_pages.dart';

import '../../sheard/auth_service.dart';
import '../data/password_repostiry.dart';

class passwordController extends GetxController {
  var passtoggle = true.obs;
  RxBool hidePassword = true.obs;
  var newPassword = ''.obs;
  var confirmpassword = ''.obs;

  final pass = PasswordRepository();
  final auth = Get.find<AuthService>();
  var email = ''.obs;
  Future<void> confirmPassword() async {
    var data = await pass.resetPassuser(email.value, newPassword.value);

    if (data) {
      var user = await auth.logIn(email.value, newPassword.value);
      if (user != null) {
        Get.snackbar(
          'Good'.tr,
          "suc".tr,
          icon: const Icon(Icons.person, color: Colors.white),
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: const Color.fromARGB(255, 246, 123, 127),
          borderRadius: 20,
          margin: const EdgeInsets.all(15),
          colorText: Colors.white,
          duration: const Duration(seconds: 4),
          isDismissible: true,
          forwardAnimationCurve: Curves.easeOutBack,
        );
        Get.rootDelegate.toNamed(Routes.home);
      }
    } else {
      Get.snackbar(
        'Errore'.tr,
        "sure".tr,
        icon: const Icon(Icons.person, color: Colors.white),
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: const Color.fromARGB(255, 246, 123, 127),
        borderRadius: 20,
        margin: const EdgeInsets.all(15),
        colorText: Colors.white,
        duration: const Duration(seconds: 4),
        isDismissible: true,
        //  dismissDirection: SnackDismissDirection.HORIZONTAL,
        forwardAnimationCurve: Curves.easeOutBack,
      );
    }
  }
}
