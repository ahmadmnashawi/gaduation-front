import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:graduationproject/app/model/user.dart';

import 'adapter/sigin_adapter.dart';

class SiginRepository implements ISigninRepository {
  final _dio = Get.find<Dio>();

  @override
  Future<User?> SignInUser(String email, String Password) async {
    var result = await _dio.get('https://localhost:7252/api/User/SignIn',
        queryParameters: {"email": email, "password": Password});
    if (result.statusCode == 200) {
      var data = User.fromJson(result.data as Map<String, dynamic>);
      return data;
    } else {
      return null;
    }
  }
}
