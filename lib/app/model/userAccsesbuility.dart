import 'package:graduationproject/app/model/user.dart';

import 'Accsessbuility.dart';

class UserAccessibility {
  int? Id;
  int? IdAccessibility;
  Accessibility? accessibility;
  List<Accessibility>? listAccess;
  int? IdUser;
  int? IdReference;
  int? IdTest;
  int? IdLibrary;
  int? IdGroup;
  User? user;
  UserAccessibility({
    this.IdAccessibility,
    this.accessibility,
    this.listAccess,
    this.IdUser,
    this.Id,
    this.user,
  });

  UserAccessibility.fromJson(Map<String, dynamic> json) {
    Id = json['id'];
    IdReference = json['idReference'];
    IdTest = json['idTest'];
    IdLibrary = json['idLibrary'];
    IdGroup = json['idGroup'];
    IdAccessibility = json['idAccessibility'];
    accessibility = json['accessibility'];
    IdUser = json['idUser'];
    user = json['user'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = <String, dynamic>{};
    json['idAccessibility'] = IdAccessibility;
    json['accessibility'] = accessibility;
    json['idReference'] = IdReference ?? 0;
    json['idTest'] = IdTest ?? 0;
    json['idLibrary'] = IdLibrary ?? 0;
    json['idGroup'] = IdGroup ?? 0;
    json['idUser'] = IdUser;
    return json;
  }
}
