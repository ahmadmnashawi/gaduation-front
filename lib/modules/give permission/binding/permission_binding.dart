import 'package:get/get.dart';
import 'package:graduationproject/modules/give%20permission/controller/premission_controller.dart';

class PermissionBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(PermissionController());
  }
}
