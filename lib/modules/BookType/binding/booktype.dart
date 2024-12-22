import 'package:get/get.dart';
import 'package:graduationproject/modules/content/controller/content_controller.dart';

import '../controller/booktype_controller.dart';

class BooktypeBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(BookTypeController ());
  }
}
