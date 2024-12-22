import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:graduationproject/app/model/user.dart';

import 'adapter/setting-adapter.dart';

class SettingRepository implements ISettingRepository {
  final _dio = Get.find<Dio>();

  @override
  Future<bool> Deluser(User u) async {
    var result = await _dio.delete('https://localhost:7192/api/User/Delete',
        queryParameters: {'user': u});
    return result.statusCode == 200;
  }
}
