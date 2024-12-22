import 'package:dio/dio.dart';
import 'package:get/get.dart';

import 'adapter/password_adapter.dart';

class PasswordRepository implements IPasswordRepository {
  final _dio = Get.find<Dio>();
  //final _auth = Get.find<AuthService>();
  @override
  Future<bool> resetPassuser(String email, String newPassword) async {
    var result = await _dio.put(
        'https://localhost:7252/api/User/ChangePassword',
        queryParameters: {'email': email, 'password': newPassword});
    if (result.statusCode == 200) {
      return true;
    } else {
      print(result.statusMessage);
    }
    return false;
    //  return result.statusCode == 200;
//}
  }
}
