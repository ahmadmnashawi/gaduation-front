import 'package:get/get.dart';

import '../controller/setting_controller.dart';

class SetteingBinding extends Bindings {
  @override
  void dependencies() {
    Get.put( SettingController());
  }
}