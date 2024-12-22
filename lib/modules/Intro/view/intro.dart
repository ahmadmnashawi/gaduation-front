import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../routes/app_pages.dart';
import '../controller/splash-screen-controller.dart';
import 'intro-page1.dart';

// ignore: must_be_immutable
class IntroPageView extends GetView<SplashScreenController> {
  const IntroPageView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Column(children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Center(
              child: Text('welcom'.tr,
                  style: const TextStyle(
                      fontSize: 40,
                      fontWeight: FontWeight.bold,
                      color: Colors.blueGrey,
                      fontFamily: "Pacifico")),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Center(
                child: Text(
              'WelcomToYouInInformationCity'.tr,
              style: const TextStyle(fontSize: 20, color: Colors.grey),
            )),
          ),
          Center(
              child: Text(
            "Wewillhavefuntogether".tr,
            style: const TextStyle(fontSize: 20, color: Colors.grey),
          )),
        ]),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
              width: 600,
              height: 300,
              child: Image.asset('assets/images/pepole.gif')),
        ),
        const SizedBox(),
        Padding(
          padding: const EdgeInsets.all(12),
          child: Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(120)),
                        padding: const EdgeInsets.symmetric(
                            vertical: 10, horizontal: 10)),
                    onPressed: () {
                      Get.rootDelegate.toNamed(Routes.SignIn);
                    },
                    child: Text('Skip'.tr),
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor:
                            const Color.fromARGB(255, 246, 123, 127),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(120)),
                        padding: const EdgeInsets.symmetric(
                            vertical: 10, horizontal: 10)),
                    onPressed: () {
                      Get.to(Intro1());
                    },
                    child: Text('Next'.tr),
                  )
                ],
              ),
            ),
          ),
        )
      ],
    ));
  }
}
