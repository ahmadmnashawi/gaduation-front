import 'dart:typed_data';

import 'package:graduationproject/app/model/post.dart';
import 'package:graduationproject/app/model/user.dart';

class Comments {
  int? id;
  String? comment;
  int? idPost;
  Post? post;
  int? idUser;
  User? user;
  Comments({
    this.id,
    this.comment,
    this.idPost,
    this.post,
    this.idUser,
    this.user,
  });

  Comments.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    comment = json['comment'];
    idPost = json['idPost'];
    post = json['post'];
    idUser = json['idUser'];
    user = json['user'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = <String, dynamic>{};
    json['comment'] = comment;
    json['idPost'] = idPost;
    json['idUser'] = idUser;
    return json;
  }
}

class CommentsDto {
  Comments? comment;
  Uint8List? userImage;
  String? userName;

  CommentsDto({
    this.userImage,
    this.userName,
    this.comment,
  });

  CommentsDto.fromJson(Map<String, dynamic> json) {
    userName = json['userName'];
    userImage = json['userImage'] == null
        ? null
        : Uint8List.fromList(
            List<int>.from(json['userImage']! as List<dynamic>));
    comment = Comments.fromJson(json['comment'] as Map<String, dynamic>);
  }
}
