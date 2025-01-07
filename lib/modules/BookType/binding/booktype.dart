import 'package:get/get.dart';

import '../controller/booktype_controller.dart';

class BooktypeBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(BookTypeController());
  }
}
