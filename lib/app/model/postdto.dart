import 'dart:typed_data';

import 'package:graduationproject/app/model/post.dart';

import 'comment.dart';

class PostDto {
  int? Id;
  String? UserName;
  String? GroupName;
  bool? Interaction;
  int? numberLike;
  int? userPostId;
  Post? post;

  // Double? NumberLike;
  Comments? comment;
  Uint8List? UserImage;
  Uint8List? GroupImage;
  String? UserImageOnline;
  String? GroupImageOnline;
  PostDto(
      {this.Id,
      this.UserName,
      this.GroupName,
      this.Interaction,
      this.numberLike,
      this.comment,
      this.UserImage,
      this.GroupImage,
      this.post});

  PostDto.fromJson(Map<String, dynamic> json) {
    Id = json['id'];
    UserName = json['userName'];
    GroupName = json['groupName'];
    userPostId = json['userPostId'];
    Interaction = json['interaction'];
    comment = json['comment'];
    UserImage = json['userImage'] == null
        ? null
        : Uint8List.fromList(
            List<int>.from(json['userImage']! as List<dynamic>));

    // GroupImage = json['groupImage'];
    UserImageOnline = json['userImageOnline'];
    GroupImageOnline = json['groupImageOnline'];
    numberLike = json['numberLike'];
    post = Post.fromJson(json['post'] as Map<String, dynamic>);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = <String, dynamic>{};
    json['id'] = Id;
    json['userName'] = UserName;
    json['groupName'] = GroupName;
    json['interaction'] = Interaction;
    json['userPostId'] = userPostId;

    //json['numberLike'] = NumberLike;
    json['comment'] = comment;
    json['userImage'] = UserImage;
    json[' groupImage'] = GroupImage;
    json[' post'] = post;
    return json;
  }
}
