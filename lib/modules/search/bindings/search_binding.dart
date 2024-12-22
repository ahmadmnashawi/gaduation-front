import 'package:get/get.dart';

import '../controller/serach_controller.dart';

class SearchBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(SearchPageContrller());
  }
}
