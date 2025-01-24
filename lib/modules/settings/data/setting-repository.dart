import 'package:dio/dio.dart';
import 'package:get/get.dart';

import 'adapter/setting-adapter.dart';

class SettingRepository implements ISettingRepository {
  final _dio = Get.find<Dio>();

  @override
  Future<bool> Deluser(int idUser) async {
    var result = await _dio.delete(
      'https://localhost:7252/api/User/Delete/$idUser',
    );
    return result.statusCode == 200;
  }
}
