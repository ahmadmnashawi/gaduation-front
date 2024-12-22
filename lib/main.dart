import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:graduationproject/api/storage/storge_service.dart';

import 'locals.g.dart';
import 'modules/sheard/auth_service.dart';
import 'routes/app_pages.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(Dio());
    var storgae = Get.put(StorageService());
    storgae.init();
    Get.put(AuthService());

    return GetMaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Project',
      key: key,
      translations: AppTranslation(),
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
      ),
      locale: const Locale('en', 'EN'),
      defaultTransition: Transition.cupertino,
      getPages: AppPages.routes,
      enableLog: true,
    );
  }
}
