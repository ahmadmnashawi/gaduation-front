import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../api/ui/util.dart';
import '../controller/setting_controller.dart';

class BuyBookView extends GetResponsiveView<SettingController> {
  @override
  BuyBookView({super.key});

  @override
  Widget builder() {
    return Material(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                    onPressed: () {
                      Get.back();
                    },
                    icon: Icon(Icons.arrow_back_ios)),
                const Text(
                  'Basket',
                  style: const TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      fontFamily: "Pacifico",
                      color: Color.fromARGB(255, 42, 42, 114),
                      decoration: TextDecoration.none),
                ),
                const SizedBox(),
              ],
            ),
          ),
          Obx(() => SingleChildScrollView(
                child: Column(
                  children: controller.listBasket
                      .map((r) => Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Card(
                              elevation: 10,
                              shape: const RoundedRectangleBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(18)),
                                  side: BorderSide(
                                      color: Color.fromARGB(255, 42, 42, 114))),
                              child: ListTile(
                                leading: Utility.getImage(
                                    width: 80,
                                    hight: 100,
                                    base64StringPh: r.book!.bookImage,
                                    link: r.book!.imageOnline),
                                title: Text(
                                    'Book Name : ${r.book!.bookName ?? ''} {${r.library!.libraryName ?? ''}}'),
                                subtitle: r.buybooks == null
                                    ? const SizedBox()
                                    : Wrap(
                                        children: r.buybooks!
                                            .map((t) => Padding(
                                                  padding:
                                                      const EdgeInsets.all(3),
                                                  child: Chip(
                                                      label: Text(
                                                          '{${t.Count}} (${t.price})')),
                                                ))
                                            .toList(),
                                      ),
                              ),
                            ),
                          ))
                      .toList(),
                ),
              ))
        ],
      ),
    );
  }
}
