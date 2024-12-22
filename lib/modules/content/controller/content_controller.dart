import 'package:flutter/animation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:graduationproject/modules/sheard/auth_service.dart';

import '../../../api/storage/storge_service.dart';
import '../../../app/model/content.dart';
import '../data/content_repositry.dart';

class ContentController extends GetxController {
  var show = false.obs;
  static const String KeyData = "AuthData";
  final stroge = Get.find<StorageService>();
  final contents = <Content>[].obs;
  final contRepo = ContentRepository();
  final addcontent = Content().obs;
  final text = 'te'.tr;
  final addtext = 'at'.tr;

  @override
  Future<void> onInit() async {
    super.onInit();
    await getAllContent();
  }

  Future<void> getAllContent() async {
    var data = await contRepo.GetContent();
    contents.assignAll(data);
  }

  Future<void> delcontentelement(Content content) async {
    var res = await contRepo.DelContent(content);
    if (res) {
      getAllContent();
    }
  }

  Future<void> addcontentelement(Content content) async {
    var res = await contRepo.AddContent(content);
    if (res) {
      //for refresh
      getAllContent();
      Get.back();
    }
  }
}
