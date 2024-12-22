
import 'dart:typed_data';

import 'package:graduationproject/app/model/post.dart';
import 'package:graduationproject/app/model/user.dart';

class  Comments{
  int? Id;
  String? commentName ;
  int? IdPost ;
  Post ?post;
  int? IdUser;
  User?user;
Comments( {
    this.Id,
    this.commentName,
    this.IdPost,
    this.post,
    this.IdUser,
    this.user,
  });

Comments.fromJson(Map<String, dynamic> json) {
   Id = json['id'];
   commentName=json['comment '];
   IdPost=json[' idPost '];
   post=json[' post '];
   IdUser=json[' idUser '];
   user=json['user'];


  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = new Map<String, dynamic>();
    json['typeName']=commentName;
    json[' idPost ']=IdPost;
    json[' post ']=post;
    json[' idUser ']=IdUser;
    json['user']=user;
    return json;
  }
}
