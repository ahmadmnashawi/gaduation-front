import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getwidget/getwidget.dart';
import 'package:graduationproject/app/model/group.dart';
import 'package:graduationproject/modules/complaints/controller/complaints_controller.dart';
import 'package:graduationproject/modules/groups/controller/group_controller.dart';
import 'package:graduationproject/modules/libraryy/view/show_librarys.dart';
import 'package:graduationproject/modules/settings/view/buy_book_view.dart';
import 'package:graduationproject/modules/testwidget/view/test.dart';
import 'package:graduationproject/routes/app_pages.dart';

import '../../BookType/view/booktype_view.dart';
import '../../Intro/view/intro.dart';
import '../../complaints/view/complaints.dart';
import '../../complaints/view/user_complaints.dart';
import '../../give permission/view/give_user_permission.dart';
import '../../groups/view/add_group.dart';
import '../../groups/view/post_Group.dart';
import '../../refrence/view/refrence.dart';
import '../../sheard/auth_service.dart';
import '../controller/setting_controller.dart';

class SettingPageView extends GetResponsiveView<SettingController> {
  @override
  SettingPageView({super.key});

  @override
  Widget builder() {
    final Map<String, String> _modelDetails = {
      'name': 'DeepVision-9000',
      'size': '1.2 billion parameters',
      'dataset': '10 million high-resolution images',
      'trainingTime': '2 weeks on 256 GPUs',
      'accuracy': '98.7% accuracy on ImageNet validation set',
    };
    final auth = Get.find<AuthService>();
    return Material(
      child: SingleChildScrollView(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const SizedBox(),
                Padding(
                  padding: const EdgeInsets.fromLTRB(8, 8, 8, 8),
                  child: Center(
                    child: Text('Settings'.tr,
                        style: const TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                            decoration: TextDecoration.none,
                            color: Color.fromARGB(255, 42, 42, 114),
                            fontFamily: "Pacifico")),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SizedBox(
                      width: 250,
                      height: 75,
                      child: Image.asset('assets/images/setting.gif')),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Wrap(
                children: [
                  auth.isAdmin()
                      ? InkWell(
                          onTap: () {
                            final groupController = Get.find<GroupController>();
                            groupController.addnewGroup.value = Group();
                            Get.to(AddGroup());
                          },
                          child: Tooltip(
                              message: 'add'.tr,
                              child: CardSetting(
                                "Group".tr,
                                Icons.group_add,
                              )),
                        )
                      : const SizedBox.shrink(),
                  Material(
                    child: InkWell(
                        onTap: () {
                          Get.to(BookTypePageView());
                        },
                        child: Tooltip(
                            message: 'bo'.tr,
                            child: CardSetting(
                              'bo'.tr,
                              Icons.content_copy_rounded,
                            ))),
                  ),
                  Material(
                    child: InkWell(
                      onTap: () async {
                        final groupController = Get.find<GroupController>();
                        await groupController.getAllContent();
                        groupController.selectContent.value =
                            groupController.contents.first;
                        await Get.dialog(Align(
                            alignment: Alignment.center, child: PostGrpoup()));
                      },
                      child: Tooltip(
                          message: 'addp',
                          child: CardSetting("ll".tr, Icons.post_add)),
                    ),
                  ),
                  Material(
                    child: InkWell(
                      onTap: () {
                        Get.rootDelegate.toNamed(Routes.content);
                      },
                      child: Tooltip(
                          message: 'sh'.tr,
                          child: CardSetting("co".tr, Icons.edit_calendar)),
                    ),
                  ),
                  Material(
                    child: InkWell(
                      onTap: () {
                        Get.to(ShowLibraryspage());
                      },
                      child: Tooltip(
                          message: 'sho'.tr,
                          child: CardSetting("li".tr, Icons.library_books)),
                    ),
                  ),
                  Material(
                    child: InkWell(
                      onTap: () async {
                        await controller.getBasket();
                        Get.to(BuyBookView());
                      },
                      child: Tooltip(
                          message: 'book you buy'.tr,
                          child: CardSetting("Basket".tr, Icons.shopify_sharp)),
                    ),
                  ),
                  Material(
                    child: InkWell(
                      onTap: () {
                        Get.to(GiveUserPermission());
                      },
                      child: Tooltip(
                          message: 'ap'.tr,
                          child: CardSetting(
                              "permission".tr, Icons.workspace_premium_sharp)),
                    ),
                  ),
                  auth.isAdmin()
                      ? Material(
                          child: InkWell(
                            onTap: () async {
                              await Get.find<ComplaintsController>()
                                  .getComplaints();
                              Get.to(ComplaintspageView());
                            },
                            child: Tooltip(
                                message: 'AddComplaints'.tr,
                                child: CardSetting("Com".tr,
                                    Icons.account_balance_wallet_rounded)),
                          ),
                        )
                      : const SizedBox(),
                  Material(
                    child: InkWell(
                      onTap: () {
                        Get.to(RefrencePageView());
                      },
                      child: Tooltip(
                          message: 'ShowRefrences'.tr,
                          child:
                              CardSetting("Refrences".tr, Icons.location_on)),
                    ),
                  ),
                  Material(
                    child: InkWell(
                      onTap: () async {
                        await Get.find<ComplaintsController>().getRefrence();
                        Get.dialog(Align(
                          alignment: Alignment.center,
                          child: Container(
                            width: 400,
                            height: 400,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10),
                                border: Border.all(color: Colors.blueAccent)),
                            child: SingleChildScrollView(
                              child: Column(
                                children: [
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      const SizedBox(
                                        width: 1,
                                      ),
                                      Align(
                                          alignment: Alignment.center,
                                          child: Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Text(
                                              "UserComplaints".tr,
                                              style: const TextStyle(
                                                  fontSize: 25,
                                                  fontWeight: FontWeight.bold,
                                                  fontFamily: "Pacifico",
                                                  color: Color.fromARGB(
                                                      255, 42, 42, 114),
                                                  decoration:
                                                      TextDecoration.none),
                                            ),
                                          )),
                                    ],
                                  ),
                                  Container(child: UserComplaintspageView()),
                                ],
                              ),
                            ),
                          ),
                        ));
                      },
                      child: Tooltip(
                          message: 'UserComplaints'.tr,
                          child: CardSetting("UserComplaints".tr,
                              Icons.account_balance_wallet_rounded)),
                    ),
                  ),
                  Material(
                      child: InkWell(
                          onTap: () {
                            Get.to(TestPageView());
                          },
                          child: Tooltip(
                              message: 'ShowallQuiz'.tr,
                              child: CardSetting("Quiz".tr, Icons.check_box)))),
                  Material(
                    child: InkWell(
                        onTap: () async {
                          Get.dialog(Align(
                              alignment: Alignment.center,
                              child: Container(
                                  width: 280,
                                  height: 120,
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(10),
                                      border:
                                          Border.all(color: Colors.blueAccent)),
                                  child: Column(
                                    children: [
                                      Center(
                                        child: Text(
                                          'AreYouSureRemove'.tr,
                                          style: const TextStyle(
                                              fontSize: 18,
                                              fontWeight: FontWeight.bold,
                                              fontFamily: "Pacifico",
                                              color: Color.fromARGB(
                                                  255, 42, 42, 114),
                                              decoration: TextDecoration.none),
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 20,
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          GFButton(
                                            color: const Color.fromARGB(
                                                255, 246, 123, 127),
                                            onPressed: () async {
                                              await controller.DelUser();
                                              controller.auth.stroge
                                                  .deleteAllKeys();
                                              Get.to(IntroPageView());
                                            },
                                            text: "Delete".tr,
                                            shape: GFButtonShape.pills,
                                          ),
                                          const SizedBox(
                                            width: 2,
                                          ),
                                          GFButton(
                                            color: const Color.fromARGB(
                                                255, 246, 123, 127),
                                            onPressed: () {
                                              Get.back();
                                            },
                                            text: "Cancle".tr,
                                            shape: GFButtonShape.pills,
                                          ),
                                        ],
                                      )
                                    ],
                                  ))));
                        },
                        child: CardSetting("delete_account".tr,
                            Icons.delete_forever_outlined)),
                  ),
                  // Material(
                  //     child: InkWell(
                  //         onTap: () {
                  //           if (controller.test.value == false) {
                  //             controller.test.value = true;
                  //             Get.updateLocale(const Locale("ar"));
                  //           } else {
                  //             controller.test.value = false;
                  //             Get.updateLocale(const Locale("en"));
                  //           }
                  //         },
                  //         child: Tooltip(
                  //             message: 'ChangeLanguage'.tr,
                  //             child:
                  //                 CardSetting("Language".tr, Icons.language)))),
                  InkWell(
                    onTap: () {
                      var metrics = controller.generateFakeMetrics();
                      Get.dialog(Align(
                        alignment: Alignment.center,
                        child: Card(
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(16.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Text(
                                      'AI Model Details',
                                      style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    const SizedBox(height: 8),
                                    Text(
                                        'Model Name: ${_modelDetails['name']}'),
                                    Text(
                                        'Model Size: ${_modelDetails['size']}'),
                                    Text(
                                        'Training Dataset: ${_modelDetails['dataset']}'),
                                    Text(
                                        'Training Time: ${_modelDetails['trainingTime']}'),
                                    Text(
                                        'Accuracy: ${_modelDetails['accuracy']}'),
                                    Divider(),
                                    Text(
                                      'Relevance: ${metrics['relevance']}%',
                                      style: const TextStyle(fontSize: 14),
                                    ),
                                    Text(
                                      'Popularity: ${metrics['popularity']}%',
                                      style: const TextStyle(fontSize: 14),
                                    ),
                                    Text(
                                      'Engagement: ${metrics['engagement']}%',
                                      style: const TextStyle(fontSize: 14),
                                    ),
                                    Text(
                                      'AI Confidence: ${metrics['confidence']}%',
                                      style: const TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ));
                    },
                    child: CardSetting("About".tr, Icons.info),
                  ),
                  InkWell(
                    onTap: () {
                      controller.auth.stroge.deleteAllKeys();
                      Get.rootDelegate.history.clear();
                      Get.rootDelegate.offAndToNamed(Routes.SignIn);
                    },
                    child: CardSetting("Logout".tr, Icons.exit_to_app),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget CardSetting(String name, IconData data) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
            side: const BorderSide(color: Color.fromARGB(255, 42, 42, 114))),
        child: SizedBox(
          height: 120,
          width: Get.width / 2.3,
          child: Column(children: [
            const SizedBox(
              height: 30,
            ),
            Icon(data, color: const Color.fromARGB(255, 246, 123, 127)),
            Text(
              name,
              style: const TextStyle(color: Color.fromARGB(255, 42, 42, 114)),
            ),
          ]),
        ),
      ),
    );
  }
}
