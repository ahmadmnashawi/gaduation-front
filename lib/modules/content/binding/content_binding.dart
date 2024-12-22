import 'package:get/get.dart';
import 'package:graduationproject/modules/content/controller/content_controller.dart';

class ContentBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(ContentController());
  }
}
