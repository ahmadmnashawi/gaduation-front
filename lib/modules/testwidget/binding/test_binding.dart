import 'package:get/get.dart';

import '../controller/test_controller.dart';

class TestdBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(TestController());
  }
}