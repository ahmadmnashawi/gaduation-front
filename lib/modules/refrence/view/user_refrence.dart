import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getwidget/getwidget.dart';

import '../../../app/model/refrenceDto.dart';
import '../../genereted/sheard/util.dart';
import '../controller/refrence_controller.dart';

class UserRefrencePageView extends GetResponsiveView<RerenceController> {
  RerenceController controller = Get.put(RerenceController());
  @override
  Widget builder() {
    return Container(
        height: 600,
        child: SingleChildScrollView(
          child: Column(children: [
               Row(
              children: [
                Material(
                  child: InkWell(
                    onTap: () => Get.back(),
                    child: Align(
                      alignment: Alignment.topLeft,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Icon(Icons.arrow_back_ios,
                            size: 17, color: Colors.grey),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: 18,
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(96, 8, 8, 8),
                  child: Center(
                    child: Text('AddedRefrenceses'.tr,
                        style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                            decoration: TextDecoration.none,
                            color: Color.fromARGB(255, 42, 42, 114),
                            fontFamily: "Pacifico")),
                  ),
                ),
              ],
            ),
            Column(
              children: controller.listAdmainrefrence.map((element) =>shapeUser( element.Admin!.Name.toString(),element)).toList()
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
                                                               controller. textallrefrence,
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
            // shapeUser('Aya Ahmad',),
            //       shapeUser('Randa  Ahjkdw',)
          ]),
        ),
        );}
        Widget shapeUser(String nameuser,RefrenceDto dto){
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
               decoration: BoxDecoration(
                border: Border.all(color: Color.fromARGB(255, 194, 192, 192)),
                borderRadius: BorderRadius.circular(10)),
            child: Column(
              children: [
                              Row(
                          children: [
                              dto.Admin!.Image == null
              ? Image.asset(
                  'assets/images/It.png',
                  width: 40,
              height: 40,
                  fit: BoxFit.fill,
                )
              : Utility.imageFromBase64String(
                  Utility.base64String( dto.Admin!.Image !),
                  40,
              40,),
            // Padding(
            //     padding: const EdgeInsets.all(8.0),
            //     child: GFImageOverlay(
            //       height: 40,
            //       width: 40,
            //       shape: BoxShape.circle,
            //       image: AssetImage(
            //         'assets/images/2.png'),
            //       boxFit: BoxFit.cover,
            //     ),
            //   ),
                    Text(
                        nameuser,
                        style: TextStyle(
                            fontFamily: "Pacifico",
                          fontSize: 20,
                          decoration: TextDecoration.none,
                          fontWeight: FontWeight.bold,
                       color: Colors.black54,
                        ),
                      ),
                          ],
                        ),
                Column(
                  children: dto.type!.map((e) =>    
                     Material(
                    child: InkWell(
                      //we need to call function to return refrence name and link to user
                      onTap: (){},
                      child: GFAccordion(
                      title: e,
                      textStyle: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          color: Color.fromARGB(255, 246, 123, 127),
                          decoration: TextDecoration.none),
                      contentChild: Column(
                          children: controller.ItRefrence.map(
                        (e) => Column(
                          children: [
                            Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Align(
                          alignment: Alignment.topLeft,
                          child: Text(
                          '',
                            style: TextStyle(
                                fontSize: 17,
                                fontWeight: FontWeight.bold,
                                color: Colors.black54),
                          ),
                        ),
                        IconButton(
                            onPressed: () {
                              Get.dialog(Align(
                                  alignment: Alignment.center,
                                  child: Container(
                                      width: 220,
                                      height: 120,
                                      decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius: BorderRadius.circular(10),
                                          border: Border.all(
                                              color: Colors.blueAccent)),
                                      child: SingleChildScrollView(
                                          child: Column(
                                        children: [
                                           Text(
                                            "AreSureToRemove?".tr,
                                            style: TextStyle(
                                                fontSize: 18,
                                                fontWeight: FontWeight.bold,
                                                fontFamily: "Pacifico",
                                                color: Color.fromARGB(255, 42, 42, 114),
                                                decoration: TextDecoration.none),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Center(
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  TextButton(
                                                      onPressed: () {
                                      controller.DelRefrence.value.content!.typeName=e.toString();      

                                      
                                                  
                                                 controller. DeleRefrence() ;
                                                      },
                                                      child:  Text(
                                                        'Yes'.tr,
                                                        style: TextStyle(
                                                            color: Color.fromARGB(
                                                                255,
                                                                245,
                                                                146,
                                                                149)),
                                                      )),
                                                  TextButton(
                                                      onPressed: () {
                                                        Get.back();
                                                      },
                                                      child:  Text(
                                                        'No'.tr,
                                                        style: TextStyle(
                                                            color: Color.fromARGB(
                                                                255,
                                                                245,
                                                                146,
                                                                149)),
                                                      )),
                                                ],
                                              ),
                                            ),
                                          )
                                        ],
                                      )))));
                            },
                            icon: Icon(
                              Icons.delete,
                              color: Color.fromARGB(255, 184, 183, 183),
                            ))
                      ],
                                      ),
                            Align(
                              alignment: Alignment.topLeft,
                              child: Text(
                                e,
                                style: TextStyle(
                                    color: Colors.blue,
                                    decoration: TextDecoration.none,
                                    fontSize: 17,
                                    fontWeight: FontWeight.bold),
                              ),
                            )
                          ],
                        ),
                      ).toList()),
                                  ),
                    ),
                  ), ).toList()
            
                  
                )
               
              ],
            ),
            
              // child: Column(
              //   children: [
              
              //   ],
              // ),
            ),
          );
        }
        }