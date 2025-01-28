import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getwidget/getwidget.dart';
import 'package:graduationproject/api/ui/util.dart';
import 'package:graduationproject/modules/icons/Icon.dart';
import 'package:graduationproject/modules/libraryy/controller/library_controller.dart';

import '../../../app/model/book.dart';
import '../../../app/model/buy_book.dart';
import '../../sheard/text_feild_GP.dart';
import 'AddBook.dart';

class Librarypage extends GetResponsiveView<LibraryContrller> {
  final _formfield = GlobalKey<FormState>();

  Librarypage({super.key});

  @override
  Widget build(BuildContext context) {
    // var accessLib = controller.access
    //     .where((element) => element.object!.id == controller.IdLibrary.value)
    //     .first
    //     .accessibility;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 42, 42, 114),
        title: Center(
          child: Text(
            controller.Newlibrary.value.libraryName.toString(),
            style: const TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
                fontFamily: "Pacifico",
                color: Colors.white,
                decoration: TextDecoration.none),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Form(
          key: _formfield,
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Align(
                      alignment: Alignment.bottomRight,
                      child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              shadowColor:
                                  const Color.fromARGB(255, 42, 42, 114),
                              padding: const EdgeInsets.symmetric(
                                  vertical: 20, horizontal: 20),
                              shape: const CircleBorder(),
                              backgroundColor:
                                  const Color.fromARGB(255, 245, 146, 149)),
                          onPressed: () {
                            controller.user.value.Paypal ??= '123451';
                            Get.dialog(Align(
                                alignment: Alignment.center,
                                child: Material(
                                  child: Container(
                                    decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(10),
                                        border: Border.all(
                                            color: Colors.blueAccent)),
                                    width: 400,
                                    height: 300,
                                    child: SingleChildScrollView(
                                      child: Column(children: [
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Text(
                                            "infobuy".tr,
                                            style: const TextStyle(
                                                fontSize: 20,
                                                fontWeight: FontWeight.bold,
                                                fontFamily: "Pacifico",
                                                color: Color.fromARGB(
                                                    255, 42, 42, 114),
                                                decoration:
                                                    TextDecoration.none),
                                          ),
                                        ),
                                        Obx(() => Text(
                                              'Item To Buy : ${controller.wishListBuyBook.length}',
                                              style: const TextStyle(
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.bold,
                                                  fontFamily: "Pacifico",
                                                  color: Color.fromARGB(
                                                      255, 42, 42, 114),
                                                  decoration:
                                                      TextDecoration.none),
                                            )),
                                        Obx(() => Wrap(
                                              children: controller
                                                  .wishListBuyBook
                                                  .map((e) => Chip(
                                                      label: Text(
                                                          '${e.bookLibrary!.book!.bookName ?? ''} (${e.Count}) {${e.price}}')))
                                                  .toList(),
                                            )),
                                        Material(
                                          child: Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: SizedBox(
                                                width: 350,
                                                height: 60,
                                                child: TextFieldGPWidget(
                                                  obscureText: false,
                                                  type: TextInputType.text,
                                                  label: 'InputLocation'.tr,
                                                  validator: (value) {
                                                    if (value!.isEmpty ||
                                                        !RegExp(r'^[a-z A-Z]+$')
                                                            .hasMatch(value)) {
                                                      return "EnterCorrectAdress"
                                                          .tr;
                                                    } else {
                                                      return null;
                                                    }
                                                  },
                                                  prefIcon: Icons.location_on,
                                                  onChanged: (value) {
                                                    controller.buybook.value
                                                        .address = value;
                                                  },
                                                )),
                                          ),
                                        ),
                                        Material(
                                          child: Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: SizedBox(
                                                width: 350,
                                                height: 60,
                                                child: TextFieldGPWidget(
                                                  obscureText: false,
                                                  type: TextInputType.text,
                                                  label: 'InputPayBal'.tr,
                                                  validator: (value) {
                                                    if (value!.isEmpty ||
                                                        !RegExp(r"^[a-zA-Z0-9.!#$%&'*+-/+?^_`{|}~]")
                                                            .hasMatch(value)) {
                                                      return "EnterCorrectPaybal"
                                                          .tr;
                                                    } else {
                                                      return null;
                                                    }
                                                  },
                                                  prefIcon: Icons.money,
                                                  onChanged: (value) {
                                                    if (controller.user.value
                                                            .Paypal ==
                                                        value) {
                                                      controller.staute.value =
                                                          'A';
                                                    } else {
                                                      controller.staute.value =
                                                          'B';
                                                    }
                                                    value;
                                                  },
                                                )),
                                          ),
                                        ),
                                        Center(
                                          child: GFButton(
                                            onPressed: () async {
                                              if (_formfield.currentState!
                                                  .validate()) {
                                                if (controller.staute.value ==
                                                    'A') {
                                                  Get.back();
                                                  Baket();

                                                  print(
                                                      "Data Added Successfully");
                                                } else {
                                                  Get.snackbar(
                                                    'Error'.tr,
                                                    "SureFromPayBal".tr,
                                                    //  icon: Icon(Icons.person, color: Colors.white),
                                                    snackPosition:
                                                        SnackPosition.BOTTOM,
                                                    backgroundColor:
                                                        const Color.fromARGB(
                                                            255, 246, 123, 127),
                                                    borderRadius: 20,
                                                    margin:
                                                        const EdgeInsets.all(
                                                            15),
                                                    colorText: Colors.white,
                                                    duration: const Duration(
                                                        seconds: 4),
                                                    isDismissible: true,
                                                    //  dismissDirection: SnackDismissDirection.HORIZONTAL,
                                                    forwardAnimationCurve:
                                                        Curves.easeOutBack,
                                                  );
                                                }
                                              }
                                              //Get.back();
                                            },
                                            text: "Input".tr,
                                            color: const Color.fromARGB(
                                                255, 42, 42, 114),
                                            shape: GFButtonShape.pills,
                                          ),
                                        ),
                                      ]),
                                    ),
                                  ),
                                )));
                          },
                          child: const Icon(
                            AppIconn.shopping_cart,
                            color: Colors.white,
                            size: 25,
                          )),
                    ),
                  ),
                  Align(
                    alignment: Alignment.bottomRight,
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            shadowColor: const Color.fromARGB(255, 42, 42, 114),
                            padding: const EdgeInsets.symmetric(
                                vertical: 20, horizontal: 20),
                            shape: const CircleBorder(),
                            backgroundColor:
                                const Color.fromARGB(255, 245, 146, 149)),
                        onPressed: controller.user.value.Id == 2 ||
                                controller.auth.isAdmin()
                            ? () async {
                                await controller.getAllBookType();
                                controller.selectBookType.value =
                                    controller.Booktype.first;
                                await controller.getAllWriter();

                                Get.dialog(Align(
                                  alignment: Alignment.center,
                                  child: Container(
                                    width: 450,
                                    height: 500,
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
                                                padding:
                                                    const EdgeInsets.all(8.0),
                                                child: Text(
                                                  "AddBook".tr,
                                                  style: const TextStyle(
                                                      fontSize: 25,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontFamily: "Pacifico",
                                                      color: Color.fromARGB(
                                                          255, 42, 42, 114),
                                                      decoration:
                                                          TextDecoration.none),
                                                ),
                                              )),
                                          Container(
                                            child: Addbookpage22(),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ));
                              }
                            : () {
                                Get.showSnackbar(const GetSnackBar(
                                  duration: Duration(seconds: 2),
                                  title: 'Access',
                                  message: 'You Dont Have Permission',
                                ));
                              },
                        child: const Icon(
                          Icons.bookmark_add,
                          color: Colors.white,
                          size: 25,
                        )),
                  )
                ],
              ),
              Obx(() => controller.Booklist.isEmpty
                  ? Center(child: Text('No Data'))
                  : Wrap(
                      children: controller.Booklist.map(
                          (element) => shapCard(element)).toList())),
            ],
          ),
        ),
      ),
    );
  }

  Widget TextCategory(String name) {
    return TextButton(
      style: ButtonStyle(
        foregroundColor: MaterialStateProperty.resolveWith<Color>(
            (Set<MaterialState> states) {
          if (states.contains(MaterialState.focused)) return Colors.red;
          if (states.contains(MaterialState.hovered)) {
            return const Color.fromARGB(255, 246, 123, 127);
          }
          if (states.contains(MaterialState.pressed)) return Colors.blue;
          return Colors.blueGrey; // null throus error in flutter 2.2+.
        }),
      ),
      onPressed: () {
        Get.dialog(Align(
          alignment: Alignment.center,
          child: Container(
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(
                    color: const Color.fromARGB(255, 42, 42, 114), width: 3)),
            width: 300,
            height: 300,
            child: SingleChildScrollView(
              child: Column(children: [
                Text(
                  name,
                  style: const TextStyle(
                      fontSize: 24,
                      fontFamily: "Pacifico",
                      color: Color.fromARGB(255, 246, 123, 127),
                      decoration: TextDecoration.none),
                ),
                name == "BookType"
                    ? Column(
                        children: controller.Booktype.map((e) =>
                                buildItem(e.bookType.toString(), e.id!, 'B'))
                            .toList(),
                      )
                    : Column(
                        children: controller.AllAutour.map((e) =>
                                buildItem(e.writerName.toString(), e.id!, 'A'))
                            .toList(),
                      )
              ]),
            ),
          ),
        ));
      },
      child: Text(name,
          style: const TextStyle(
              fontSize: 18,
              fontFamily: "Pacifico",
              fontWeight: FontWeight.bold)),
    );
  }
  //  Widget BookCard(){

  //  }
  Widget shapCard(Book d) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(8, 8, 8, 8),
      child: InkWell(
        onTap: () async {
          await controller.getInfoBook(d.id!);
          Get.dialog(Align(
            alignment: Alignment.center,
            child: Material(
              child: Container(
                width: 400,
                height: Get.height / 2.5,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: Colors.blueAccent)),
                ////////here item book
                child: SingleChildScrollView(
                  child: Obx(
                    () => Column(
                      children: [
                        const SizedBox(
                          height: 10,
                        ),
                        Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                children: [
                                  Text(
                                    'NameBook : '.tr,
                                    style: const TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                        fontFamily: "Pacifico",
                                        color: Color.fromARGB(255, 42, 42, 114),
                                        decoration: TextDecoration.none),
                                  ),
                                  Text(
                                    controller.bookInfo.value.book!.bookName ??
                                        '',
                                    style: const TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                        fontFamily: "Pacifico",
                                        color: Colors.black54,
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
                                    'Price'.tr,
                                    style: const TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                        fontFamily: "Pacifico",
                                        color: Color.fromARGB(255, 42, 42, 114),
                                        decoration: TextDecoration.none),
                                  ),
                                  Text(
                                      '${controller.bookInfo.value.book!.bookPrice!}\$',
                                      style: const TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black54,
                                          decoration: TextDecoration.none)),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                children: [
                                  Text(
                                    'Type : '.tr,
                                    style: const TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                        fontFamily: "Pacifico",
                                        color: Color.fromARGB(255, 42, 42, 114),
                                        decoration: TextDecoration.none),
                                  ),
                                  Text(controller.bookInfo.value.Type ?? "",
                                      style: const TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black54,
                                          decoration: TextDecoration.none)),
                                ],
                              ),
                            ),
                          ],
                        ),
                        controller.bookInfo.value.writer!.isEmpty
                            ? SizedBox()
                            : Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Wrap(
                                  children: [
                                    Text(
                                      'Writers :'.tr,
                                      style: const TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold,
                                          fontFamily: "Pacifico",
                                          color:
                                              Color.fromARGB(255, 42, 42, 114),
                                          decoration: TextDecoration.none),
                                    ),
                                    Wrap(
                                      children:
                                          controller.bookInfo.value.writer!
                                              .map((t) => Padding(
                                                    padding:
                                                        const EdgeInsets.all(3),
                                                    child: Chip(label: Text(t)),
                                                  ))
                                              .toList(),
                                    ),
                                  ],
                                ),
                              ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text('nu'.tr,
                              style: const TextStyle(
                                  fontSize: 18,
                                  color: Color.fromARGB(255, 42, 42, 114),
                                  decoration: TextDecoration.none,
                                  fontFamily: "Pacifico")),
                        ),
                        Row(
                          children: [
                            const SizedBox(
                              width: 200,
                            ),
                            Obx(
                              () => Center(
                                  child: Text(
                                // controller.buybook.value.Count.toString(),
                                controller.valuepice.value.toString(),
                                style: const TextStyle(
                                  fontSize: 23,
                                  color: Colors.black54,
                                  decoration: TextDecoration.none,
                                ),
                              )),
                            ),
                            Text('pice'.tr,
                                style: const TextStyle(
                                  fontSize: 18,
                                  color: Colors.black54,
                                  decoration: TextDecoration.none,
                                ))
                          ],
                        ),
                        Center(
                          child: Row(
                            children: [
                              const SizedBox(
                                width: 185,
                              ),
                              Material(
                                  child: IconButton(
                                icon: const Icon(
                                  Icons.add,
                                  color: Color.fromARGB(255, 246, 123, 127),
                                ),
                                onPressed: () {
                                  if (controller.valuepice.value < 21) {
                                    controller.valuepice.value += 1;
                                  }
                                },
                              )),
                              Material(
                                  child: IconButton(
                                icon: const Icon(
                                  Icons.remove,
                                  color: Color.fromARGB(255, 246, 123, 127),
                                ),
                                onPressed: () {
                                  if (controller.valuepice.value > 0) {
                                    controller.valuepice.value -= 1;
                                  }
                                },
                              )),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Align(
                            alignment: Alignment.bottomRight,
                            child: ElevatedButton(
                              onPressed: () {
                                controller.AddToBuyBooktempority(d);
                                Get.back();
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor:
                                    const Color.fromARGB(255, 246, 123, 127),
                                padding: const EdgeInsets.symmetric(
                                    vertical: 20, horizontal: 20),
                                shape: const CircleBorder(),
                              ),
                              child: const Icon(
                                AppIconn.shopping_cart,
                                size: 16,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ));
        },
        child: Container(
          width: Get.width / 2.5,
          padding: const EdgeInsets.symmetric(horizontal: 4),
          decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 5,
                  blurRadius: 7,
                  offset: Offset(0, 3),
                ),
              ],
              border: Border.all(
                color: const Color.fromARGB(255, 42, 42, 114),
                width: 1.3,
              ),
              color: Colors.white,
              borderRadius: BorderRadius.circular(15)),
          child: SingleChildScrollView(
            child: Column(children: [
              Padding(
                padding: const EdgeInsets.all(3),
                child: Utility.getImage(
                    width: Get.width / 2.8,
                    hight: 120,
                    base64StringPh: d.bookImage,
                    link: d.imageOnline),
              ),
              Text(
                d.bookName ?? '',
                style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    fontFamily: "Pacifico",
                    color: Color.fromARGB(255, 42, 42, 114),
                    decoration: TextDecoration.none),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Row(
                      children: [
                        const SizedBox(
                          width: 10,
                        ),
                        Text(d.bookPrice!.toString(),
                            style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Colors.black54,
                                decoration: TextDecoration.none)),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        /////Update book info
                        Material(
                            child: IconButton(
                                onPressed: controller.auth.isAdmin() ||
                                        controller.user.value.Id == 2
                                    ? () async {
                                        controller.addOneBook.value = d;
                                        controller.getIdBookWritter(d.id!);

                                        await controller.getAllBookType();
                                        controller.selectBookType.value =
                                            controller.Booktype.where(
                                                    (t) => t.id == d.idBookType)
                                                .first;
                                        await controller.getAllWriter();
                                        controller.selectWriter.value =
                                            controller.AllAutour.where((t) =>
                                                t.id ==
                                                controller.updatebookwritter
                                                    .value.Id).first;
                                        Get.dialog(Align(
                                          alignment: Alignment.center,
                                          child: Container(
                                            width: 350,
                                            height: 500,
                                            decoration: BoxDecoration(
                                                color: Colors.white,
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                                border: Border.all(
                                                    color: Colors.blueAccent)),
                                            child: SingleChildScrollView(
                                              child: Column(
                                                children: [
                                                  const SizedBox(
                                                    height: 10,
                                                  ),
                                                  Align(
                                                      alignment:
                                                          Alignment.center,
                                                      child: Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .all(8.0),
                                                        child: Text(
                                                          "up".tr,
                                                          style: const TextStyle(
                                                              fontSize: 25,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold,
                                                              fontFamily:
                                                                  "Pacifico",
                                                              color: Colors
                                                                  .blueGrey,
                                                              decoration:
                                                                  TextDecoration
                                                                      .none),
                                                        ),
                                                      )),
                                                  Container(
                                                      child: Addbookpage22()),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ));
                                      }
                                    : () {
                                        Get.showSnackbar(const GetSnackBar(
                                          duration: Duration(seconds: 2),
                                          title: 'Access',
                                          message: 'You Dont Have Permission',
                                        ));
                                      },
                                icon: const Icon(
                                  Icons.edit,
                                  color: Color.fromARGB(255, 42, 42, 114),
                                ))),
                        Material(
                            child: IconButton(
                                onPressed: controller.auth.isAdmin() ||
                                        controller.user.value.Id == 2
                                    ? () {
                                        Get.dialog(Align(
                                            alignment: Alignment.center,
                                            child: Container(
                                                width: 280,
                                                height: 120,
                                                decoration: BoxDecoration(
                                                    color: Colors.white,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10),
                                                    border: Border.all(
                                                        color:
                                                            Colors.blueAccent)),
                                                child: Column(
                                                  children: [
                                                    Center(
                                                      child: Text(
                                                        'AreSureToRemove'.tr,
                                                        style: const TextStyle(
                                                            fontSize: 18,
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            fontFamily:
                                                                "Pacifico",
                                                            color:
                                                                Color.fromARGB(
                                                                    255,
                                                                    42,
                                                                    42,
                                                                    114),
                                                            decoration:
                                                                TextDecoration
                                                                    .none),
                                                      ),
                                                    ),
                                                    const SizedBox(
                                                      height: 20,
                                                    ),
                                                    Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .center,
                                                      children: [
                                                        GFButton(
                                                          color: const Color
                                                              .fromARGB(255,
                                                              246, 123, 127),
                                                          onPressed: () {
                                                            controller
                                                                .dellBookLibrary(
                                                                    controller
                                                                        .IdLibrary
                                                                        .value,
                                                                    d.id!);
                                                          },
                                                          text: "Delete".tr,
                                                          shape: GFButtonShape
                                                              .pills,
                                                        ),
                                                        const SizedBox(
                                                          width: 2,
                                                        ),
                                                        GFButton(
                                                          color: const Color
                                                              .fromARGB(255,
                                                              246, 123, 127),
                                                          onPressed: () {
                                                            Get.back();
                                                          },
                                                          text: "Cancle".tr,
                                                          shape: GFButtonShape
                                                              .pills,
                                                        ),
                                                      ],
                                                    )
                                                  ],
                                                ))));
                                      }
                                    : () {
                                        Get.showSnackbar(const GetSnackBar(
                                          duration: Duration(seconds: 2),
                                          title: 'Access',
                                          message: 'You Dont Have Permission',
                                        ));
                                      },
                                icon: const Icon(
                                  Icons.delete,
                                  color: Colors.red,
                                ))),
                      ],
                    ),
                  ],
                ),
              )
            ]),
          ),
        ),
      ),
    );
  }

  Widget shapPice(int? idlibrarybook, int? count, Buybook? m) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
          width: 400,
          height: 120,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              border:
                  Border.all(color: const Color.fromARGB(255, 42, 42, 114))),
          child: Column(
              children: controller.wishListBuyBook
                  .map(
                    (e) => Column(
                      children: [
                        const SizedBox(
                          height: 20,
                        ),
                        Text(
                          e.bookLibrary!.book!.bookName ?? '',
                          style: const TextStyle(
                              fontSize: 18,
                              decoration: TextDecoration.none,
                              color: Color.fromARGB(255, 42, 42, 114)),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Text('count'.tr,
                                    style: const TextStyle(
                                        fontSize: 18,
                                        decoration: TextDecoration.none,
                                        color:
                                            Color.fromARGB(255, 42, 42, 114))),
                                Text(e.Count != null ? e.Count.toString() : '0',
                                    style: const TextStyle(
                                        fontSize: 18,
                                        decoration: TextDecoration.none,
                                        color: Colors.black54)),
                              ],
                            ),
                            Row(
                              children: [
                                Material(
                                  child: Tooltip(
                                    message: 'editcount'.tr,
                                    child: IconButton(
                                        onPressed: () {
                                          Get.dialog(Align(
                                              alignment: Alignment.center,
                                              child: Container(
                                                  width: 300,
                                                  height: 250,
                                                  decoration: BoxDecoration(
                                                      color: Colors.white,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10),
                                                      border: Border.all(
                                                          color: Colors
                                                              .blueAccent)),
                                                  child: Column(
                                                    children: [
                                                      Center(
                                                        child: Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                  .all(8.0),
                                                          child: Text(
                                                            'UpdateCount'.tr,
                                                            style: const TextStyle(
                                                                fontSize: 18,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold,
                                                                fontFamily:
                                                                    "Pacifico",
                                                                color: Color
                                                                    .fromARGB(
                                                                        255,
                                                                        42,
                                                                        42,
                                                                        114),
                                                                decoration:
                                                                    TextDecoration
                                                                        .none),
                                                          ),
                                                        ),
                                                      ),
                                                      Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .all(8.0),
                                                        child: Text(
                                                          "${'p'.tr}  $count",
                                                          style: const TextStyle(
                                                              fontSize: 18,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold,
                                                              color: Colors
                                                                  .black54,
                                                              decoration:
                                                                  TextDecoration
                                                                      .none),
                                                        ),
                                                      ),
                                                      Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .all(8.0),
                                                        child: Text(
                                                          'NewCount'.tr,
                                                          style: const TextStyle(
                                                              fontSize: 18,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold,
                                                              color: Colors
                                                                  .black54,
                                                              decoration:
                                                                  TextDecoration
                                                                      .none),
                                                        ),
                                                      ),
                                                      Center(
                                                        child: Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .center,
                                                          children: [
                                                            Material(
                                                                child:
                                                                    IconButton(
                                                              icon: const Icon(
                                                                Icons.add,
                                                                color: Color
                                                                    .fromARGB(
                                                                        255,
                                                                        246,
                                                                        123,
                                                                        127),
                                                              ),
                                                              onPressed: () {
                                                                controller
                                                                    .valuepice
                                                                    .value += 1;
                                                              },
                                                            )),
                                                            Obx(
                                                              () => Center(
                                                                  child: Text(
                                                                controller
                                                                    .valuepice
                                                                    .value
                                                                    .toString(),
                                                                style:
                                                                    const TextStyle(
                                                                  fontSize: 23,
                                                                  color: Colors
                                                                      .black54,
                                                                  decoration:
                                                                      TextDecoration
                                                                          .none,
                                                                ),
                                                              )),
                                                            ),
                                                            Material(
                                                                child:
                                                                    IconButton(
                                                              icon: const Icon(
                                                                Icons.remove,
                                                                color: Color
                                                                    .fromARGB(
                                                                        255,
                                                                        246,
                                                                        123,
                                                                        127),
                                                              ),
                                                              onPressed: () {
                                                                if (controller
                                                                        .valuepice
                                                                        .value >
                                                                    0) {
                                                                  controller
                                                                      .valuepice
                                                                      .value -= 1;
                                                                }
                                                              },
                                                            )),
                                                          ],
                                                        ),
                                                      ),
                                                      const SizedBox(
                                                        height: 10,
                                                      ),
                                                      Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .center,
                                                        children: [
                                                          GFButton(
                                                            color: const Color
                                                                .fromARGB(255,
                                                                246, 123, 127),
                                                            onPressed: () {
                                                              // contrller.sum.value -=   (e.book!.bookPrice! * count).toDouble();
                                                              e.Count =
                                                                  controller
                                                                      .valuepice
                                                                      .value;
                                                              //  contrller.sum.value +=
                                                              //  (e.book!.bookPrice! * count).toDouble();
                                                              // contrller.UpdateBuyBook(m);
                                                            },
                                                            text: "Save".tr,
                                                            shape: GFButtonShape
                                                                .pills,
                                                          ),
                                                          const SizedBox(
                                                            width: 4,
                                                          ),
                                                          // GFButton(
                                                          //   color: const Color.fromARGB(
                                                          //       255, 246, 123, 127),
                                                          //   onPressed: () {},
                                                          //   text: "Cancle",
                                                          //   shape: GFButtonShape.pills,
                                                          // ),
                                                        ],
                                                      )
                                                    ],
                                                  ))));
                                        },
                                        icon: const Icon(
                                          Icons.edit,
                                          color:
                                              Color.fromARGB(255, 42, 42, 114),
                                        )),
                                  ),
                                ),
                                Material(
                                  child: Tooltip(
                                    message: 'rd'.tr,
                                    child: IconButton(
                                        onPressed: () {
                                          Get.dialog(Align(
                                              alignment: Alignment.center,
                                              child: Container(
                                                  width: 280,
                                                  height: 120,
                                                  decoration: BoxDecoration(
                                                      color: Colors.white,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10),
                                                      border: Border.all(
                                                          color: Colors
                                                              .blueAccent)),
                                                  child: Column(
                                                    children: [
                                                      Center(
                                                        child: Text(
                                                          'AreYouSureRemove'.tr,
                                                          style: const TextStyle(
                                                              fontSize: 18,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold,
                                                              fontFamily:
                                                                  "Pacifico",
                                                              color: Color
                                                                  .fromARGB(
                                                                      255,
                                                                      42,
                                                                      42,
                                                                      114),
                                                              decoration:
                                                                  TextDecoration
                                                                      .none),
                                                        ),
                                                      ),
                                                      const SizedBox(
                                                        height: 20,
                                                      ),
                                                      Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .center,
                                                        children: [
                                                          GFButton(
                                                            color: const Color
                                                                .fromARGB(255,
                                                                246, 123, 127),
                                                            onPressed: () {
                                                              controller
                                                                  .wishListBuyBook
                                                                  .remove(m);
                                                            },
                                                            text: "Delete".tr,
                                                            shape: GFButtonShape
                                                                .pills,
                                                          ),
                                                          const SizedBox(
                                                            width: 4,
                                                          ),
                                                          GFButton(
                                                            color: const Color
                                                                .fromARGB(255,
                                                                246, 123, 127),
                                                            onPressed: () {
                                                              Get.back();
                                                            },
                                                            text: "Cancle".tr,
                                                            shape: GFButtonShape
                                                                .pills,
                                                          ),
                                                        ],
                                                      )
                                                    ],
                                                  ))));
                                        },
                                        icon: const Icon(
                                          Icons.delete,
                                          color: Colors.red,
                                        )),
                                  ),
                                )
                              ],
                            ),
                          ],
                        )
                      ],
                    ),
                  )
                  .toList())),
    );
  }

  Future Baket() {
    for (var element in controller.wishListBuyBook) {
      controller.sum.value += element.price!;
    }

    return Get.dialog(Align(
      alignment: Alignment.topRight,
      child: Container(
          width: 450,
          height: 1000,
          color: Colors.white,
          child: SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'Basket'.tr,
                    style: const TextStyle(
                        fontSize: 24,
                        fontFamily: "Pacifico",
                        color: Color.fromARGB(255, 246, 123, 127),
                        decoration: TextDecoration.none),
                  ),
                ),
                Obx(() => Column(
                    children: controller.wishListBuyBook
                        .map((element) => shapPice(
                            element.IdBookLibrary, element.Count, element))
                        .toList())),
                Row(
                  children: [
                    const SizedBox(
                      width: 160,
                    ),
                    Text('t'.tr,
                        style: const TextStyle(
                            fontSize: 18,
                            decoration: TextDecoration.none,
                            color: Color.fromARGB(255, 42, 42, 114))),
                    Text('${controller.sum.value}\$',
                        style: const TextStyle(
                            fontSize: 18,
                            decoration: TextDecoration.none,
                            color: Colors.black54)),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Align(
                        alignment: Alignment.bottomRight,
                        child: ElevatedButton(
                          onPressed: () async {
                            for (var element in controller.wishListBuyBook) {
                              element.address =
                                  controller.buybook.value.address;
                              element.idUser =
                                  controller.auth.getDataFromStorage()!.Id;
                              element.IdBookLibrary = element.bookLibrary!.Id;
                              element.price = double.tryParse(
                                  (element.bookLibrary!.book!.bookPrice! *
                                          element.Count!)
                                      .toString());
                              await controller.AddToBuyBookback(element);
                            }
                            Get.back();
                            controller.wishListBuyBook.clear();
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor:
                                const Color.fromARGB(255, 246, 123, 127),
                            padding: const EdgeInsets.symmetric(
                                vertical: 20, horizontal: 20),
                            shape: const CircleBorder(),
                          ),
                          child: const Icon(
                            Icons.check,
                            size: 16,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          )),
    ));
  }

  Widget buildItem(String value, int id, String type) {
    return Material(
      child: InkWell(
        onTap: () {
          if (type == 'B') {
            controller.getAllBookByType(id);
          } else {
            controller.getAllBookByWritter(id);
          }
        },
        child: SizedBox(
          height: 100,
          width: 280,
          child: Text(
            value,
            style: const TextStyle(
                color: Colors.black54,
                fontSize: 18,
                decoration: TextDecoration.none),
          ),
        ),
      ),
    );
  }
}
