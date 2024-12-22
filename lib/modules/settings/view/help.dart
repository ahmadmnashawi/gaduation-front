import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/simple/get_responsive.dart';

import '../../../app/model/refrenceDto.dart';
import '../../BookType/view/booktype_view.dart';
import '../../MenuGame/view/splash_game.dart';
import '../../complaints/view/user_complaints.dart';
import '../../content/view/content.dart';
import '../../genereted/sheard/util.dart';
import '../../groups/view/group.dart';
import '../../groups/view/show_group.dart';
import '../../libraryy/view/show_librarys.dart';
import '../../menu/view/HomePage.dart';
import '../../password/view/password.dart';
import '../../profile/view/edit_profile.dart';
import '../../profile/view/profile.dart';
import '../../refrence/view/refrence.dart';
import '../../signin.dart/view/signin.dart';
import '../../signup/view/signup1.dart';
import '../../testwidget/view/test.dart';
import '../controller/setting_controller.dart';

class HelpPageView extends GetResponsiveView <SettingController>{
  SettingController controller=Get.put(SettingController());
  @override
  Widget builder() {
    return Container(
        height: 600,
        child: SingleChildScrollView(
          child: Column(children: [
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
                        Padding(
                    padding:  EdgeInsets.all(8),
                    child: Center(
                      child: Text('AllHelp'.tr,
                          style: TextStyle(
                              fontSize: 30,
                              fontWeight: FontWeight.bold,
                              decoration: TextDecoration.none,
                              color: Color.fromARGB(255, 42, 42, 114),
                              fontFamily: "Pacifico")),
                    ),
                  ),
                  Column(
                    children: [
                      CardHelp(SignInViewPage(),'SingIn'.tr, 'k'.tr),
 CardHelp(signupage(),'SigUp'.tr, 'a'.tr),
    CardHelp(HomePage(),'HomePage'.tr, 'b'.tr),
         CardHelp(Profileview(),'Profile'.tr, 'c'.tr),
          CardHelp(EditProfileview (),'EditProfile'.tr, 'd'.tr),
                        CardHelp(  ForgetViewPage(),'ForgetPassword'.tr, 'e'.tr),
                          CardHelp(SplashGame(),'MenuGame'.tr, 'f'.tr),
                      CardHelp(ShowGroupPageView(),'AllGroups'.tr, 'g'.tr),
                      //  CardHelp(GroupView(),'Group', 'In this interface, all the information of this group is displayed'),
                       CardHelp(ShowLibraryspage(),'AllLibrarays'.tr, 'h'.tr),
                    //  CardHelp('Library', 'In this interface you will display all the books in the library And You Can Buy Book From Icon Bascket'),
                     CardHelp(Contentpage(),"Content".tr,'i'.tr ),
                      CardHelp(UserComplaintspageView (),'Complaints'.tr,'j'.tr),
                  CardHelp(RefrencePageView(),'AllRefrence'.tr, 'l'.tr),
                  
                  
                       CardHelp(TestPageView(),'Tests'.tr,'m'.tr),
                    CardHelp(BookTypePageView(),'BookType'.tr, 'n'.tr),
                    
                 
                
               
                   
                 
                    
                    
                   
               
                    ],
                  )
                  
          ])));}
      Widget  CardHelp(Widget w,String WidgetName,String text){
            return Padding(
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
                                            alignment: Alignment.topLeft,
                                            child: Padding(
                                              padding: EdgeInsets.all(8.0),
                                              child: Text(
                                              WidgetName,
                                                style: TextStyle(
                                                    fontSize: 20,
                                                    fontWeight: FontWeight.bold,
                                                    fontFamily: "Pacifico",
                                                    color: Color.fromARGB(255, 246, 123, 127),
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
                                             Padding(
                                               padding: const EdgeInsets.all(8.0),
                                               child: Align(
                                                alignment: Alignment.bottomRight,
                                                 child: Tooltip(
                                                  message: 'open'.tr,
                                                   child: TextButton(onPressed: (){
                                                    Get.to(w);
                                                   }, child: Text('view'.tr,
                                                    style: TextStyle(
                                                          fontSize: 20,
                                                          fontWeight: FontWeight.bold,
                                                          fontFamily: "Pacifico",
                                                          color:Color.fromARGB(255, 235, 129, 133),
                                                          decoration: TextDecoration.none),
                                                                                              
                                                   )),
                                                 ),
                                               ),
                                             )
                                    ],
                                  ),
                                ),
                              ),
                            ),
            );
          }
          }