import 'package:get/get.dart';

import '../controller/menu_game_controller.dart';

class MenuGameBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(MenuGameController());
  }
}
