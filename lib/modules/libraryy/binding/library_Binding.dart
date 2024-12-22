import 'package:get/get.dart';
import 'package:graduationproject/modules/libraryy/controller/library_controller.dart';


class LibraryBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(LibraryContrller());
  }
}