import 'package:get/get.dart';

import '../controller/letter_controller.dart';

class LetterBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(LetterController());
  }
}
