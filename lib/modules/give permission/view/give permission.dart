import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:getwidget/colors/gf_color.dart';
import 'package:getwidget/components/accordion/gf_accordion.dart';
import 'package:getwidget/components/button/gf_button.dart';
import 'package:getwidget/components/dropdown/gf_multiselect.dart';
import 'package:getwidget/getwidget.dart';
import 'package:getwidget/types/gf_checkbox_type.dart';

import '../controller/premission_controller.dart';

class Givepermission extends GetResponsiveView<PermissionController> {
  PermissionController controller = Get.put(PermissionController());
  List<String> permission = [
    'Admain All permission',
    'Admain All',
    'Admain Library',
    'Admain post',
    'Admain Group'
  ];
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
           Material(
                child: InkWell(
                  onTap: () => Get.back(),
                  child: Align(
                    alignment: Alignment.topLeft,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Icon(Icons.arrow_back_ios,
                          size: 20, color: Colors.grey),
                    ),
                  ),
                ),
              ),
        // Material(
        //     child: Container(
        //   width: 350,
        //   height: 60,
        //   child: TextField(
        //       decoration: InputDecoration(
        //     labelText: 'Administrator Name ',
        //     labelStyle:
        //         TextStyle(color: Colors.black45, fontWeight: FontWeight.bold),
        //     hintText: 'Enter Administrator Name ',
        //     prefixIcon: Icon(
        //       Icons.person_2_outlined,
        //       color: Color.fromARGB(255, 245, 146, 149),
        //     ),
        //   ),
        //   onChanged: (value){
        //       controller.userAccssebility.value.
        //   },
          
        //   ),
        // )),
         Material(
          child: Padding(
            padding: const EdgeInsets.all(6),
            child: Container(
              decoration: BoxDecoration(
                  border: Border.all(color: Color.fromARGB(255, 194, 192, 192)),
                  borderRadius: BorderRadius.circular(10)),
              child: GFAccordion(
                title: "Choose User",
                textStyle: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    color: Color.fromARGB(255, 246, 123, 127),
                    decoration: TextDecoration.none),
                contentChild: Column(
                  children: controller.AllUser
                      .map((element) => TextButton(
                          onPressed: () {
                           controller.userAccssebility.value.IdUser=element.Id; 
                           controller.currentUser.value=element;
                          },
                          child: Text(element.toString(),
                              style: TextStyle(
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
        Material(
          child: Padding(
            padding: const EdgeInsets.all(6),
            child: Container(
              decoration: BoxDecoration(
                  border: Border.all(color: Color.fromARGB(255, 194, 192, 192)),
                  borderRadius: BorderRadius.circular(10)),
              child: GFAccordion(
                title: "Admain Library",
                textStyle: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    color: Color.fromARGB(255, 246, 123, 127),
                    decoration: TextDecoration.none),
                contentChild: Column(
                  children: controller.listLibrary
                      .map((element) => TextButton(
                          onPressed: () {
                           controller.userAccssebility.value.accessibility!.AccessibilityType='Admain Library';
                            controller.userAccssebility.value.accessibility!.id=element.Id;
                            controller.addUserpremissiont(controller.userAccssebility.value);
                            controller.userAccssebility.value.accessibility!.AccessibilityType=null;
                            controller.userAccssebility.value.accessibility!.id=null;
                          },
                          child: Text(element.toString(),
                              style: TextStyle(
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
        Material(
          child: Padding(
            padding: const EdgeInsets.all(6),
            child: Container(
              decoration: BoxDecoration(
                  border: Border.all(color: Color.fromARGB(255, 194, 192, 192)),
                  borderRadius: BorderRadius.circular(10)),
              child: GFAccordion(
                title: "Admain Group",
                textStyle: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    color: Color.fromARGB(255, 246, 123, 127),
                    decoration: TextDecoration.none),
                contentChild: Column(
                  children: controller.AllGroups
                      .map((element) => TextButton(
                          onPressed: () {
                                   controller.userAccssebility.value.accessibility!.AccessibilityType='Admain Group';
                            controller.userAccssebility.value.accessibility!.id=element.Id;
                            controller.addUserpremissiont(controller.userAccssebility.value);
                            controller.userAccssebility.value.accessibility!.AccessibilityType=null;
                            controller.userAccssebility.value.accessibility!.id=null;
                          },
                          child: Text(element.toString(),
                              style: TextStyle(
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
        Column(
          children: [
            checkShose(' All Permission'),
            checkShose('Add New Group'),
            checkShose('Add New Refrence'),
               checkShose('Add New  Test'),
            checkShose('Add New Library'),
            checkShose('Delete Librarys'),
            checkShose('Delete Groups'),
             checkShose('Delete Refrence'),
               checkShose('Delete Test'),
          ],
        ),
         Center(
           child: Material(
             child: GFButton(
              color:Color.fromARGB(255, 42, 42, 114),
               onPressed: (){
                       Get.snackbar(
                                              'Save ',
                                              "All Permissions Are Added To "+controller.currentUser.value.Name.toString(),
                                              //  icon: Icon(Icons.person, color: Colors.white),
                                              snackPosition: SnackPosition.BOTTOM,
                                              backgroundColor: Color.fromARGB(
                                                  255, 246, 123, 127),
                                              borderRadius: 20,
                                              margin: EdgeInsets.all(15),
                                              colorText: Colors.white,
                                              duration: Duration(seconds: 4),
                                              isDismissible: true,
                                              //  dismissDirection: SnackDismissDirection.HORIZONTAL,
                                              forwardAnimationCurve:
                                                  Curves.easeOutBack,
                                            );
               },
               text: "Save",textStyle: TextStyle(color: Colors.white),
             ),
           ),
         ),
              Tooltip(
              message: 'Help About Page',
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Align(
                  alignment: Alignment.bottomRight,
                  child: Material(
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
                                        child: const Align(
                                            alignment: Alignment.center,
                                            child: Padding(
                                              padding: EdgeInsets.all(8.0),
                                              child: Text(
                                                "Help",
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
                                                                 controller. text,
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
              ),
            )
      ],
    );
  }

  Widget checkShose(String text) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: 40,
        decoration: BoxDecoration(
            border: Border.all(color: Color.fromARGB(255, 194, 192, 192)),
            borderRadius: BorderRadius.circular(10)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                text,
                style: TextStyle(
                    color: Colors.black54,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    decoration: TextDecoration.none),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Material(
                child: GFIconButton(
                  color: Color.fromARGB(255, 246, 123, 127),
                  onPressed: () {
                     controller.userAccssebility.value.accessibility!.AccessibilityType=text;
                            controller.addUserpremissiont(controller.userAccssebility.value);
                            controller.userAccssebility.value.accessibility!.AccessibilityType=null;
                            controller.userAccssebility.value.accessibility!.id=null;
                    controller.isChecked.value=true;
                  },
                  icon: Icon(Icons.check,size: 10,
                  color: Colors.white,
                   
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
