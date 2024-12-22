import 'package:graduationproject/app/model/content.dart';
import 'package:graduationproject/app/model/user.dart';

import '../../../../app/model/Accsessbuility.dart';
import '../../../../app/model/group.dart';
import '../../../../app/model/library.dart';
import '../../../../app/model/userAccsesbuility.dart';

abstract class IPremissionRepository {
  Future<List<Accessibility>> GetPermission();
  Future<List<User>> GetAllUser();
  Future<bool> DelContent(int id);
  Future<bool> AddContent(Content content);
  Future<List<Library>> getAllLibrary();
  Future<List<Group>> GetAllGroup();
  Future<List<UserAccessibility>> GetUserPermission();
  Future<bool> AddUserAccessibility(UserAccessibility user);
  Future<bool> DelUserAccessibility(UserAccessibility user);
}
