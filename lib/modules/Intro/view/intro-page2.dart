import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:graduationproject/modules/signin.dart/view/signin.dart';

import '../../../routes/app_pages.dart';
import '../controller/splash-screen-controller.dart';

class Intro2 extends GetView<SplashScreenController> {
  const Intro2({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25),
          child: Wrap(
            children: [
              Center(
                child: Text(
                  'askyourquestionswithinaspecializedcommunity'.tr,
                  style: TextStyle(fontSize: 18, color: Colors.grey),
                ),
              ),
              Text(
                'anditallowsyoutobuythebookyouwant'.tr,
                style: TextStyle(fontSize: 18, color: Colors.grey),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
              height: 400,
              width: 600,
              child: Image.asset('assets/images/library.gif')),
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
                      Get.rootDelegate.toNamed(Routes.SignIn);
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
