import 'package:get/get.dart';

import '../controller/refrence_controller.dart';

class RefrenceBinding extends Bindings {
  @override
  void dependencies() {
    Get.put( RerenceController());
  }
}