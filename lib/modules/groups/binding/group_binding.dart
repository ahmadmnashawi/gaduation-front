import 'package:get/get.dart';
import 'package:graduationproject/modules/groups/controller/group_controller.dart';

class GroupBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(GroupController());
  }
}
