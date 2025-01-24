import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getwidget/getwidget.dart';
import 'package:graduationproject/app/model/book_type.dart';
import 'package:graduationproject/app/model/bookwritter.dart';
import 'package:graduationproject/app/model/writter.dart';

import '../../../api/ui/util.dart';
import '../controller/library_controller.dart';

class Addbookpage22 extends GetResponsiveView<LibraryContrller> {
  final _formfield = GlobalKey<FormState>();
  final RegExp price = new RegExp(r'^[6-9]\d{9}$');
  // Uint8List? image;
  @override
  Widget builder() {
    return Form(
      key: _formfield,
      child: Material(
        child: Column(
          children: [
            Center(
                child: Column(
              children: [
                const SizedBox(width: 170),
                Material(child: Imageprofile()),
              ],
            )),
            Text(
              'BookType'.tr,
              style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.grey),
            ),
            Material(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                    decoration: BoxDecoration(
                        border: Border.all(
                            color: const Color.fromARGB(255, 194, 192, 192)),
                        borderRadius: BorderRadius.circular(10)),
                    child: Obx(() => DropdownButton<BookType>(
                        isExpanded: true,
                        underline: const SizedBox(),
                        value: controller.selectBookType.value,
                        items: controller.Booktype.map((element) =>
                                DropdownMenuItem<BookType>(
                                    value: element,
                                    child: Text(element.bookType.toString(),
                                        style: const TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.black54,
                                            decoration: TextDecoration.none))))
                            .toList(),
                        onChanged: (value) {
                          controller.selectBookType.value = value!;
                          controller.addOneBook.value.idBookType = value.id;
                        }))),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Material(
                  child: SizedBox(
                width: 450,
                child: TextFormField(
                  validator: (value) {
                    if (value!.isEmpty ||
                        !RegExp(r"^[a-zA-Z0-9.!#$%&'*+-/+?^_`{|}~]")
                            .hasMatch(value)) {
                      return "EnterCorrectName".tr;
                    } else {
                      return null;
                    }
                  },
                  onChanged: (value) {
                    controller.addOneBook.value.bookName = value;
                  },
                  decoration: InputDecoration(
                    labelText: controller.addOneBook.value.bookName ?? '',
                    labelStyle: const TextStyle(
                        color: Colors.black45, fontWeight: FontWeight.bold),
                    hintText: "Book Name".tr,
                    prefixIcon: const Icon(
                      Icons.bookmark_add_outlined,
                      color: Color.fromARGB(255, 245, 146, 149),
                    ),
                  ),
                ),
              )),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Material(
                  child: SizedBox(
                width: 450,
                child: TextFormField(
                    validator: (value) {
                      if (!price.hasMatch(value!)) {
                        return 'pe'.tr;
                      }
                      return null;
                    },
                    onChanged: (value) {
                      controller.addOneBook.value.bookPrice =
                          int.parse(value).toInt();
                    },
                    decoration: InputDecoration(
                      labelText: controller.addOneBook.value.bookPrice == null
                          ? ''
                          : controller.addOneBook.value.bookPrice.toString(),
                      labelStyle: const TextStyle(
                          color: Colors.black45, fontWeight: FontWeight.bold),
                      hintText: 'BookPrice'.tr,
                      prefixIcon: const Icon(
                        Icons.price_change,
                        color: Color.fromARGB(255, 245, 146, 149),
                      ),
                    )),
              )),
            ),
            Text(
              'cw'.tr,
              style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.grey),
            ),
            Obx(() => Wrap(
                  children: controller.listWriterToAdd
                      .map((w) => Padding(
                            padding: const EdgeInsets.all(3),
                            child:
                                Chip(label: Text(w.writer!.writerName ?? '')),
                          ))
                      .toList(),
                )),
            Material(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                    decoration: BoxDecoration(
                        border: Border.all(
                            color: const Color.fromARGB(255, 194, 192, 192)),
                        borderRadius: BorderRadius.circular(10)),
                    child: Obx(() => DropdownButton<Writer>(
                        isExpanded: true,
                        underline: const SizedBox(),
                        value: controller.selectWriter.value,
                        items: controller.AllAutour.map((element) =>
                                DropdownMenuItem<Writer>(
                                    value: element,
                                    child: Text(element.writerName.toString(),
                                        style: const TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.black54,
                                            decoration: TextDecoration.none))))
                            .toList(),
                        onChanged: (value) {
                          if (!controller.listWriterToAdd
                              .any((r) => r.IdWriter == value!.id)) {
                            controller.listWriterToAdd.add(BookWriter(
                                IdWriter: value!.id,
                                writer: Writer(writerName: value.writerName)));
                          }
                        }))),
              ),
            ),
            GFButton(
              color: Colors.blueGrey,
              onPressed: () async {
                await controller.addBookone();
                Get.snackbar(
                  'ok'.tr,
                  "AddeddNewBook".tr,
                  icon: const Icon(Icons.person, color: Colors.white),
                  snackPosition: SnackPosition.BOTTOM,
                  backgroundColor: const Color.fromARGB(255, 246, 123, 127),
                  borderRadius: 20,
                  margin: const EdgeInsets.all(15),
                  colorText: Colors.white,
                  duration: const Duration(seconds: 4),
                  isDismissible: true,
                  forwardAnimationCurve: Curves.easeOutBack,
                );
              },
              text: "AddBook".tr,
            ),
          ],
        ),
      ),
    );
  }

  Widget Imageprofile() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Center(
        child: Stack(
          children: <Widget>[
            Obx(() => Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    width: 400,
                    decoration: BoxDecoration(
                        border: Border.all(
                            color: const Color.fromARGB(255, 192, 189, 189))),
                    child: controller.stringPickImage.value.isNotEmpty
                        ? Utility.imageFromBase64String(
                            controller.stringPickImage.value, 200, 200)
                        : Utility.getImage(
                            base64StringPh:
                                controller.addOneBook.value.bookImage,
                            width: 200,
                            hight: 200),
                  ),
                )),
            Positioned(
                bottom: 20.0,
                right: 20.0,
                child: InkWell(
                  onTap: () async {
                    openBottomSheet();
                  },
                  child: const Icon(
                    Icons.camera_alt,
                    color: Color.fromARGB(255, 245, 146, 149),
                    size: 28.0,
                  ),
                ))
          ],
        ),
      ),
    );
  }

  void openBottomSheet() {
    Get.bottomSheet(
      Container(
        height: 120.0,
        width: 500,
        margin: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
        child: Column(
          children: [
            const SizedBox(height: 20),
            Center(
              child: Text(
                'ChoosePhoto'.tr,
                style: TextStyle(fontSize: 18),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              children: [
                FloatingActionButton(
                  backgroundColor: const Color.fromARGB(255, 246, 123, 127),
                  foregroundColor: Colors.white,
                  mini: true,
                  onPressed: () {
                    controller.pickImageFun();
                  },
                  child: const Icon(Icons.image),
                ),
                Text('Gallery'.tr),
              ],
            )
          ],
        ),
      ),
      backgroundColor: Colors.white,
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
    );
  }
}
