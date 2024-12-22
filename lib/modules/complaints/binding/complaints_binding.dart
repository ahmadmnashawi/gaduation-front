
import 'package:get/get.dart';
import 'package:graduationproject/modules/complaints/controller/complaints_controller.dart';

class ComplainsBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(ComplaintsController());
  }
}