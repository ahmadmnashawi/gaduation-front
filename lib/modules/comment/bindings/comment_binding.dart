import 'package:get/get.dart';

import '../controller/comment_controller.dart';

class CommentBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(CommentController());
  }
}
