import 'package:graduationproject/app/model/Accsessbuility.dart';
import 'package:graduationproject/app/model/user.dart';

class AccessiblityLogIn {
  Accessibility? accessibility;
  User? user;
  Object? object;
  String? type;
  AccessiblityLogIn({this.accessibility, this.object, this.type});

  AccessiblityLogIn.fromJson(Map<String, dynamic> json) {
    accessibility = json['accessibility'] != null
        ? Accessibility.fromJson(json['accessibility'])
        : null;
    object = json['object'] != null ? Object.fromJson(json['object']) : null;
    type = json['type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (accessibility != null) {
      data['accessibility'] = accessibility!.toJson();
    }
    if (object != null) {
      data['object'] = object!.toJson();
    }
    data['type'] = type;
    return data;
  }
}

class Object {
  int? id;
  String? groupName;
  String? description;
  bool? isDeleted;
  int? idContent;

  Object({
    this.id,
    this.groupName,
    this.description,
    this.isDeleted,
    this.idContent,
  });

  Object.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    groupName = json['groupName'];
    description = json['description'];
    isDeleted = json['isDeleted'];
    idContent = json['idContent'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['groupName'] = groupName;
    data['description'] = description;
    data['isDeleted'] = isDeleted;

    return data;
  }
}
