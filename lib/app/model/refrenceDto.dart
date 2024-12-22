
import 'dart:typed_data';

import 'package:graduationproject/app/model/user.dart';

class RefrenceDto {
  User? Admin ;
 List<String>? type ;
RefrenceDto( {
    this. Admin,
    this.type,
  });

RefrenceDto.fromJson(Map<String, dynamic> json) {
   Admin=json[' Admin'];
 type=json['type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = new Map<String, dynamic>();
    json[' Admin']= Admin;
   json['type']=type;
    return json;
  }
}
