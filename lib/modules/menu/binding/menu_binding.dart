import 'package:get/get.dart';

import '../controller/menu.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(HomeController());
  }
}