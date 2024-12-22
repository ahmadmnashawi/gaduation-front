// import 'package:get/get.dart';

import 'package:dio/dio.dart';
import 'package:get/get.dart';

import '../../../app/model/user.dart';
import 'adapter/signup_adapter.dart';

class SingUpRepository extends ISingUpRepository {
  final _dio = Get.find<Dio>();
  @override
  Future<bool> regierterPerson(User object) async {
    var data = await _dio.post('https://localhost:7252/api/User/AddUser',
        data: object.toJson());
    if (data.statusCode == 200) {
      return true;
    } else {
      print(data.statusMessage);
    }
    return false;
  }
}
