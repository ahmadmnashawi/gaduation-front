import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getwidget/getwidget.dart';
import 'package:graduationproject/app/model/writter.dart';

import '../../genereted/sheard/util.dart';
import '../controller/library_controller.dart';

class Addbookpage22 extends GetResponsiveView<LibraryContrller> {
  @override
  LibraryContrller controller = Get.put(LibraryContrller());
     final _formfield = GlobalKey<FormState>();
     final RegExp price = new RegExp(r'^[6-9]\d{9}$');
  Uint8List? image;
  @override
  Widget builder() {
    return Form(
       key: _formfield,
      child: Column(
        children: [
          Center(
              child: Column(
            children: [
              const SizedBox(width: 170),
              Material(child: Imageprofile(controller)),
            ],
          )),
          
           Material(
                child: Padding(
                  padding: const EdgeInsets.all(6),
                  child: Container(
                    decoration: BoxDecoration(
                        border:
                            Border.all(color: Color.fromARGB(255, 194, 192, 192)),
                        borderRadius: BorderRadius.circular(10)),
                    child: GFAccordion(
                      title: "BookType".tr,
                      textStyle: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,  
                          color: Color.fromARGB(255, 246, 123, 127),
                          decoration: TextDecoration.none),
                      contentChild: Column(
                        children: controller.Booktype
                            .map((element) => TextButton(
                                onPressed: () {
                         controller.addoneBook.value.bookType=element;
                                },
                                child: Text(element.bookType.toString(),   style: TextStyle(
                                              fontSize: 18,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.black54,
                                              decoration: TextDecoration.none))))
                            .toList(),
                      ),
                    ),
                  ),
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
                    }},
                onChanged: (value) {
                  controller.addoneBook.value.bookName=value;
                },
                decoration: InputDecoration(
                  labelText: "BookType".tr,
                  labelStyle: TextStyle(
                      color: Colors.black45, fontWeight: FontWeight.bold),
                  hintText:"BookType".tr,
                  prefixIcon: Icon(
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
                     controller.addoneBook.value.bookPrice=int.parse(value).toInt();
                  },
                  decoration:  InputDecoration(
                    labelText: 'BookPrice'.tr,
                    labelStyle: TextStyle(
                        color: Colors.black45, fontWeight: FontWeight.bold),
                    hintText: 'BookPrice'.tr,
                    prefixIcon: Icon(
                      Icons.price_change,
                      color: Color.fromARGB(255, 245, 146, 149),
                    ),
                  )),
            )),
          ),
    
             Tooltip(
                message: 'adlib'.tr,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Align(
                    alignment: Alignment.topRight,
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Color.fromARGB(255, 246, 123, 127),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(126)),
                            padding: const EdgeInsets.symmetric(
                                vertical: 17, horizontal: 17)),
                        onPressed: () {
                                                       if (_formfield.currentState!.validate()) {
                    print("Data Added Successfully");
                   
                  }
                          controller.addBookone();
                          controller.getIdBook(controller.addoneBook.value.bookName.toString());
                        },
                        child: Icon(Icons.add)),
                  ),
                ),
              ),
              Text('cw'.tr,style: TextStyle(fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.grey
              ),),
       
               Material(
                child: Padding(
                  padding: const EdgeInsets.all(6),
                  child: Container(
                    decoration: BoxDecoration(
                        border:
                            Border.all(color: Color.fromARGB(255, 194, 192, 192)),
                        borderRadius: BorderRadius.circular(10)),
                    child: GFAccordion(
                      title: "BookWritter".tr,
                      textStyle: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,  
                          color: Color.fromARGB(255, 246, 123, 127),
                          decoration: TextDecoration.none),
                      contentChild: Column(
                        children: controller.AllAutour
                            .map((element) => TextButton(
                                onPressed: () {
                          controller.writerBook.value.IdBook=controller.idbook.value;
                          controller.writerBook.value.IdWriter=element.id;
                          controller.writerBook.value.writer!.writerName=element.writerName ;
                      controller.  addBookwritter();
                                },
                                child: Text(element.writerName.toString(),   style: TextStyle(
                                              fontSize: 18,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.black54,
                                              decoration: TextDecoration.none))))
                            .toList(),
                      ),
                    ),
                  ),
                ),
              ),
      
          GFButton(
            color: Colors.blueGrey,
            onPressed: () {
              controller.booklibraryAdd.value.IdBook=controller.idbook.value;
              controller.booklibraryAdd.value.book=controller.addoneBook.value;
              controller.booklibraryAdd.value.IdLibrary=controller.IdLibrary.value;
              controller.addBooktolibrary();
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
            Tooltip(
                message: 'HelpAboutPage'.tr,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Align(
                    alignment: Alignment.bottomRight,
                    child: IconButton(onPressed: (){
                Get.dialog(Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Align(
                              alignment: Alignment.center,
                              child: Container(
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(20),
                                    border: Border.all(color: Colors.blueAccent)),
                                child: SingleChildScrollView(
                                  child: Column(
                                    children: [
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child:  Align(
                                            alignment: Alignment.center,
                                            child: Padding(
                                              padding: EdgeInsets.all(8.0),
                                              child: Text(
                                                "Help".tr,
                                                style: TextStyle(
                                                    fontSize: 25,
                                                    fontWeight: FontWeight.bold,
                                                    fontFamily: "Pacifico",
                                                    color: Color.fromARGB(255, 42, 42, 114),
                                                    decoration: TextDecoration.none),
                                              ),
                                            )),
                                      ),
                                               Padding(
                                                 padding: const EdgeInsets.fromLTRB(10, 8, 10, 10),
                                                 child: Column(
                                                             children: <Widget>[
                                                               new Text(
                                                                 controller.addbooktext,
                                                                 textAlign: TextAlign.left,
                                                                 style: TextStyle(
                                                                     fontSize: 18,
                                                                     decoration: TextDecoration.none,
                                                                     fontWeight: FontWeight.bold,
                                                                     color: Colors.black87),
                                                               ),
                                                             ],
                                                           ),
                                               ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                ));
                    }, icon: Icon(Icons.help_outline_outlined,
                    size: 30,
                    color:Color.fromARGB(255, 246, 123, 127) ,)),
                  ),
                ),
              )
        ],
      ),
    );
  }

  Widget Imageprofile(LibraryContrller controller) {
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
                    //    radius: 80.0,
                    //  borderRadius: BorderRadius.circular(100),
                    child: controller.stringPickImage.value.isNotEmpty
                        ? Utility.imageFromBase64String(
                            controller.stringPickImage.value, 200, 200)
                        : image == null
                            ? Image.asset(
                                'assets/images/book3.png',
                                width: 200,
                                height: 200,
                                fit: BoxFit.fill,
                              )
                            : Utility.imageFromBase64String(
                                Utility.base64String(image!), 200, 200),
                  ),
                )),
            Positioned(
                bottom: 20.0,
                right: 20.0,
                child: InkWell(
                  onTap: () async {
                    openBottomSheet(controller);
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
}

void openBottomSheet(LibraryContrller controller) {
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
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              // Row(
              //   children: [
              //     FloatingActionButton(
              //       backgroundColor: const Color.fromARGB(255, 246, 123, 127),
              //       foregroundColor: Colors.white,
              //       mini: true,
              //       onPressed: () {
              //         controller.pickImageFun();
              //       },
              //       child: const Icon(Icons.camera),
              //     ),
              //     const Text('  Camera'),
              //   ],
              // ),
              // const SizedBox(
              //   width: 10,
              // ),
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
          // OutlinedButton(
          //   onPressed: () {
          //     Get.back();
          //   },
          //   child: const Text('Close'),
          // ),
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
