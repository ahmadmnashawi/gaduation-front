import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../timer/view/timer.dart';
import '../controller/packet_controller.dart';

class PacketPageView extends GetResponsiveView<PacketController> {
  @override
  PacketController controller = Get.put(PacketController());

  PacketPageView({super.key});
  //PacketPageView({super.key});

  @override
  Widget builder() {
    return Scaffold(
        body: Padding(
      padding: const EdgeInsets.all(8.0),
      child: SingleChildScrollView(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InkWell(
                  onTap: () => Get.back(),
                  child: const Align(
                    alignment: Alignment.topLeft,
                    child: Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Icon(Icons.arrow_back_ios,
                          size: 20, color: Colors.grey),
                    ),
                  ),
                ),
                // const SizedBox(),
                Row(
                  children: [
                    TimerPageView(),
                    Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            color: Colors.blueGrey,
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                 Text(
                                  'CorrectAnswerr'.tr,
                                  style: TextStyle(
                                      color: Colors.white,
                                      decoration: TextDecoration.none,
                                      fontSize: 18),
                                ),
                                Obx(
                                  () => Text(
                                    controller.reminning.value.toString(),
                                    style: const TextStyle(
                                        color: Colors.white,
                                        decoration: TextDecoration.none,
                                        fontSize: 18),
                                  ),
                                )
                              ],
                            ),
                          ),
                        )),
                  ],
                ),
                TextButton(
                    onPressed: () {
                      if (controller.cardsSucc.length ==
                          controller.listpacket.length) {
                        if (controller.numberlevel.value == 1) {
                          controller.secandLevel();
                          controller.numberlevel.value = 2;
                        } else if (controller.numberlevel.value == 2) {
                          controller.therdLevel();
                          controller.numberlevel.value = 3;
                        } else if (controller.numberlevel.value == 3) {
                          Get.defaultDialog(
                            title: 'Congratulations'.tr,
                            middleText: 'youpass'.tr,
                          );
                        }
                      } else {
                        Get.defaultDialog(
                          middleText: 'yousho'.tr,
                        );
                      }
                    },
                    child:  Text('NEXTLevel'.tr))
              ],
            ),
            Obx(() => controller.isMessage.value
                ? Container(
                    color: Colors.green.shade300,
                    child:  Center(
                      child: Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text(
                          'Congratulations'.tr,
                          style: TextStyle(fontSize: 16, color: Colors.white),
                        ),
                      ),
                    ),
                  )
                : const SizedBox.shrink()),
            Obx(
              () => Wrap(
                children: controller.listpacket
                    .map((packet) => Material(
                          child: InkWell(
                            onTap: () async {
                              if (controller.openCards.isEmpty) {
                                controller.openCards.add(packet);
                              } else if (controller.openCards.isNotEmpty &&
                                  controller.openCards.length == 1) {
                                controller.openCards.add(packet);
                                await Future.delayed(
                                    const Duration(milliseconds: 50));
                                if (controller.openCards.first.index ==
                                    controller.openCards.last.index) {
                                  controller.reminning.value++;
                                  controller.cardsSucc
                                      .add(controller.openCards.first);
                                  controller.cardsSucc
                                      .add(controller.openCards.last);
                                  controller.isMessage(true);
                                  await Future.delayed(
                                      const Duration(seconds: 1));
                                  controller.isMessage(false);
                                }
                                controller.openCards.clear();
                              }
                            },
                            child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Container(
                                  width: 100,
                                  height: 100,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(12),
                                      border: Border.all(
                                          color: Colors.blueGrey, width: 3)),
                                  child: controller.cardsSucc
                                              .contains(packet) ||
                                          controller.openCards.contains(packet)
                                      ? Image.asset(packet.photo!)
                                      : Image.asset(packet.hidd!),
                                )),
                          ),
                        ))
                    .toList(),
              ),
            ),
          ],
        ),
      ),
    ));
  }
}
