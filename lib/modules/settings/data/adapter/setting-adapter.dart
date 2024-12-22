import 'package:graduationproject/app/model/user.dart';

abstract class ISettingRepository {
  Future<bool> Deluser(User u);
}
