import 'package:graduationproject/app/model/user.dart';

abstract class IPasswordRepository {
  Future<bool> resetPassuser(String email, String newPassword);
}
