import 'package:get/get.dart';
import 'package:graduationproject/modules/password/controller/password_controller.dart';

class PasswordBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(passwordController());
  }
}
