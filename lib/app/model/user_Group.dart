import 'package:graduationproject/app/model/user.dart';

import 'group.dart';

class UserGroup {
  int? id;
  int? IdGroup;
  Group? group;
  int? IdUser;
  User? user;
  UserGroup({this.IdGroup, this.group, this.IdUser, this.user, this.id});

  UserGroup.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    IdGroup = json['idGroup'];
    IdUser = json['idUser'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = <String, dynamic>{};
    json['idGroup'] = IdGroup;
    json['idUser'] = IdUser;
    json['id'] = id ?? 0;
    return json;
  }
}
