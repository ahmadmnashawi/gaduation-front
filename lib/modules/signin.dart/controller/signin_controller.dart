import 'package:flutter/animation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:graduationproject/app/model/user.dart';
import 'package:graduationproject/routes/app_pages.dart';

import '../../../api/storage/storge_service.dart';
import '../../sheard/auth_service.dart';
import '../data/signin_repository.dart';

const String KeyData = "AuthData";

class SignIncontroller extends GetxController {
  var passtoggle = true.obs;
  final userSingn = User().obs;
  RxBool hidePassword = true.obs;
  final userRepo = SiginRepository();
  final text = 'siginhelp'.tr;
  final stroge = Get.find<StorageService>();
  final auth = Get.find<AuthService>();
  var email = ''.obs;
  //  var useruses=userUsed().obs;
  var password = ''.obs;
  Future<void> SignIn() async {
    var d = await auth.logIn(email.value, password.value);
    if (d == null) {
      await Get.snackbar(
        ' Error',
        " Please Check of fields ",
        //  icon: Icon(Icons.person, color: Colors.white),
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Color.fromARGB(255, 246, 123, 127),
        borderRadius: 20,
        margin: const EdgeInsets.all(15),
        colorText: Colors.white,
        duration: const Duration(seconds: 4),
        isDismissible: true,
        //  dismissDirection: SnackDismissDirection.HORIZONTAL,
        forwardAnimationCurve: Curves.easeOutBack,
      );
    } else
      Get.rootDelegate.toNamed(Routes.home);
  }
}
