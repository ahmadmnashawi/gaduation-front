import 'package:get/get.dart';

import '../controller/math_controller.dart';

class MathBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(MathController());
  }
}
