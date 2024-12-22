import 'package:get/get.dart';

import '../controller/packet_controller.dart';

class PacketBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(PacketController());
  }
}
