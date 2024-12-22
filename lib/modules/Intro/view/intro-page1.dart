import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/splash-screen-controller.dart';

import 'intro-page2.dart';

class Intro1 extends GetView<SplashScreenController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        const SizedBox(),
        SizedBox(
          width: 600,
          height: 300,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Image.asset('assets/images/intro4.png'),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Wrap(
            children: [
              Center(
                  child: Text(
                'Thisapplicationgivesyouadditionalexperiencesthrough'.tr,
                style: TextStyle(fontSize: 18, color: Colors.grey),
              )),
              Center(
                  child: Text(
                'asetofscientificandentertainingtestsinaddition'.tr,
                style: TextStyle(fontSize: 18, color: Colors.grey),
              )),
              Center(
                  child: Text(
                'toscientificgamesthatstrengthenperception'.tr,
                style: TextStyle(fontSize: 18, color: Colors.grey),
              )),
              Center(
                  child: Text(
                'perceptionandstimulatethebrain'.tr,
                style: TextStyle(fontSize: 18, color: Colors.grey),
              )),
            ],
          ),
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
                      Get.back();
                    },
                    child: Text('back'.tr),
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
                      Get.to(Intro2());
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
