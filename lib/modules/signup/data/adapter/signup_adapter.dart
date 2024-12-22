

import 'package:graduationproject/app/model/user.dart';

abstract class ISingUpRepository {
  Future<bool> regierterPerson(User object);
}