import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getwidget/components/button/gf_button.dart';
import 'package:getwidget/components/image/gf_image_overlay.dart';
import 'package:getwidget/shape/gf_button_shape.dart';

import '../../../app/model/buybookDetailsDto.dart';
import '../../../app/model/buybookDto.dart';
import '../../genereted/sheard/util.dart';
import '../controller/library_controller.dart';

class InvoicLibraryepage extends GetResponsiveView<LibraryContrller> {
  @override
  Widget build(BuildContext context) {
    controller.getlibrary();
    controller.getBuyBookDto();
    return Scaffold(
      body: Container(
        color: Color.fromARGB(178, 255, 255, 255),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Material(
                child: InkWell(
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
              ),
              Align(
                  alignment: Alignment.center,
                  child: Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      "Invoce".tr +
                          controller.currentLibrary.value.libraryName
                              .toString(),
                      style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                          fontFamily: "Pacifico",
                          color: Color.fromARGB(255, 42, 42, 114),
                          decoration: TextDecoration.none),
                    ),
                  )),
              Column(
                  children: controller.listBuyBookDto
                      .map((element) => CardInvoic(
                          element.user!.Name.toString(), context, element))
                      .toList()),
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
                                                               controller.fatouralibrary,
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
              // CardInvoic('Asia Badnjki', context),
              //    CardInvoic('Hadel Dabbas', context),
              //       CardInvoic('Haya Yosofi', context),
              //          CardInvoic('Asia Badnjki', context)
            ],
          ),
        ),
      ),
    );
  }

  Widget CardInvoic(String nameuser, BuildContext context, BuyBookDto d) {
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
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            d.user!.Image == null
                                ? Image.asset(
                                    'assets/images/2.png',
                                    width: 40,
                                    height: 40,
                                    fit: BoxFit.cover,
                                  )
                                : Utility.imageFromBase64String(
                                    Utility.base64String(d.user!.Image!),
                                    40,
                                    40,
                                  ),
                            // Padding(
                            //     padding: const EdgeInsets.all(8.0),
                            //     child: GFImageOverlay(
                            //       height: 40,
                            //       width: 40,
                            //       shape: BoxShape.circle,
                            //       image:
                            //        AssetImage(
                            //         'assets/images/2.png'),
                            //       boxFit: BoxFit.cover,
                            //     ),
                            //   ),
                            Text(
                              nameuser,
                              style: TextStyle(
                                fontFamily: "Pacifico",
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Color.fromARGB(255, 246, 123, 127),
                              ),
                            ),
                          ],
                        ),
                        Align(
                          alignment: Alignment.topRight,
                          child: Tooltip(
                            message: 'de'.tr,
                            child: GFButton(
                              onPressed: () {
                                controller.getDetailsBuyBook(
                                    controller.currentLibrary.value.Id!,
                                    d.user!.Id!);
                                Get.dialog(Align(
                                  alignment: Alignment.center,
                                  child: Container(
                                    width: 350,
                                    height: 430,
                                    decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(10),
                                        border: Border.all(
                                            color: Colors.blueAccent)),
                                    child: SingleChildScrollView(
                                      child: Column(
                                        children: [
                                          const SizedBox(
                                            height: 10,
                                          ),
                                          Align(
                                              alignment: Alignment.center,
                                              child: Padding(
                                                padding: EdgeInsets.all(8.0),
                                                child: Text(
                                                  "Invoice".tr +
                                                      d.user!.Name.toString(),
                                                  style: TextStyle(
                                                      fontSize: 25,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontFamily: "Pacifico",
                                                      color: Colors.blueGrey,
                                                      decoration:
                                                          TextDecoration.none),
                                                ),
                                              )),
                                          Column(
                                              children: controller
                                                  .listDetailsBuyBook
                                                  .map((element) =>
                                                      itemBook(element))
                                                  .toList())
                                          // itemBook(),
                                          //  itemBook(),
                                          //   itemBook(),
                                        ],
                                      ),
                                    ),
                                  ),
                                ));
                              },
                              text: "detalies".tr,
                              color: Color.fromARGB(255, 109, 157, 197),
                              shape: GFButtonShape.pills,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                //  color: Color.fromARGB(255, 246, 123, 127),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'tt'.tr,
                      style: TextStyle(
                          fontFamily: "Pacifico",
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.black54),
                    ),
                    Text(
                      '5008\$ ',
                      style: TextStyle(
                          fontSize: 20,
                          fontFamily: "Pacifico",
                          fontWeight: FontWeight.bold,
                          color: Color.fromARGB(255, 246, 123, 127),
                          decoration: TextDecoration.none),
                    ),
                  ],
                )
              ]),
            ),
          ),
        ),
      ),
    );
  }

  Widget itemBook(BuyBookDetailsDto d) {
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
                        d.book!.bookName.toString(),
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
                              d.buybooks!.firstWhere((element) => element.IdBookLibrary==controller.GetCountdete(d.book!.id!,controller.currentLibrary.value.Id!)).Count.toString(),
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
                          Text(
                            d.book!.bookPrice.toString()+'\$ to one',
                            style: TextStyle(
                                fontSize: 20,
                                fontFamily: "Pacifico",
                                fontWeight: FontWeight.bold,
                                color: Color.fromARGB(255, 246, 123, 127),
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
