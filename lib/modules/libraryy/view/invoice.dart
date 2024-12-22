import 'dart:typed_data';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../app/model/book.dart';
import '../../../app/model/buybookUser.dart';
import '../../genereted/sheard/util.dart';
import '../controller/library_controller.dart';

class Invoicepage extends GetResponsiveView<LibraryContrller> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(children: [
          Material(
            child: InkWell(
              onTap: () => Get.back(),
              child: const Align(
                alignment: Alignment.topLeft,
                child: Padding(
                  padding: EdgeInsets.all(8.0),
                  child:
                      Icon(Icons.arrow_back_ios, size: 20, color: Colors.grey),
                ),
              ),
            ),
          ),
          Align(
              alignment: Alignment.center,
              child: Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                  "Invoce".tr,
                  style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      fontFamily: "Pacifico",
                      color: Color.fromARGB(255, 42, 42, 114),
                      decoration: TextDecoration.none),
                ),
              )),
              Column(
                children: controller.ListuserBuyBook.map((element) =>
                 CardInvoic(element.library!.libraryName.toString(),
                 context,element)).toList()
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
                                                               controller.fatorauesr,
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
          // CardInvoic('Al Hekma', context),
          //   CardInvoic('Al World', context),
        ]),
      ),
    );
  }

  Widget CardInvoic(String nameLIbr, BuildContext context,BuyBookUserDto b) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(8, 8, 8, 8),
      child: Align(
        alignment: Alignment.center,
        child: Center(
          child: Container(
            width: MediaQuery.of(context).size.width / 1.1,
            decoration: BoxDecoration(
                color: Color.fromARGB(255, 248, 251, 253),
                border: Border.all(
                  color: Colors.grey,
                  width: 1.3,
                ),
                borderRadius: BorderRadius.circular(22.0)),
            child: Center(
              child: Column(children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      nameLIbr,
                      style: TextStyle(
                          fontFamily: "Pacifico",
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: Color.fromARGB(255, 246, 123, 127),
                      ),
                    ),
                  ),
                ),
            
                itemBook(b),
                // itemBook(),
                    // Padding(
                    //   padding: const EdgeInsets.all(8.0),
                    //   child: Align(
                    //     alignment: Alignment.bottomRight,
                    //     child: Text(
                    //       'Total : 4556\$',
                    //         style: TextStyle(
                    //             fontSize: 20,
                    //             fontFamily: "Pacifico",
                    //             fontWeight: FontWeight.bold,
                    //      color: Color.fromARGB(255, 42, 42, 114),
                    //             decoration: TextDecoration.none),
                    //       ),
                    //   ),
                    // ),
              ]),
            ),
          ),
        ),
      ),
    );
  }

  Widget itemBook(BuyBookUserDto b) {
    return Padding(
      padding: const EdgeInsets.all(3.0),
      child: Container(
        child: Card(
          shape: RoundedRectangleBorder(
              side: BorderSide(
                  color: Color.fromARGB(255, 206, 204, 204), width: 1),
              borderRadius: BorderRadius.circular(12)),
          child: Column(children: [
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      Text(
                        "BookName".tr,
                        style: TextStyle(
                            fontSize: 19,
                            fontWeight: FontWeight.bold,
                               fontFamily: "Pacifico",
                            color: Color.fromARGB(255, 109, 157, 197),
                            decoration: TextDecoration.none),
                      ),
                      Text(
                     b.book!.bookName.toString(),
                        style: TextStyle(
                            fontSize: 19,
                            fontWeight: FontWeight.bold,
                            color: Colors.black87,
                            decoration: TextDecoration.none),
                      ),
                    ],
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          Text(
                            "Count".tr,
                            style: TextStyle(
                                fontSize: 19,
                                   fontFamily: "Pacifico",
                                fontWeight: FontWeight.bold,
                                color: Color.fromARGB(255, 109, 157, 197),
                                decoration: TextDecoration.none),
                          ),
                          Text(
                           controller.GetCount(b.book!.id!, b.library!.Id!).toString(),
                            style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.black87,
                                decoration: TextDecoration.none),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          // Text(
                          //   "  price one :",
                          //   style: TextStyle(
                          //       fontSize: 20,
                          //       fontWeight: FontWeight.bold,
                          //       color: Color.fromARGB(255, 109, 157, 197),
                          //       decoration: TextDecoration.none),
                          // ),
                          Text(
                           b.book!.bookPrice.toString()+'\$ to one' ,
                            style: TextStyle(
                                fontSize: 20,
                                   fontFamily: "Pacifico",
                                fontWeight: FontWeight.bold,
                          color:   Color.fromARGB(255, 246, 123, 127),
                                decoration: TextDecoration.none),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            )
          ]),
        ),
      ),
    );
  }
}
