import 'package:get/get.dart';

import '../controller/foucs_controller.dart';

class FoucsBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(FoucsController());
  }
}
