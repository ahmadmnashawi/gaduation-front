import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:graduationproject/app/model/comment.dart';
import 'package:graduationproject/app/model/group.dart';
import 'package:graduationproject/app/model/user.dart';
import 'package:graduationproject/app/model/userPost.dart';
import 'package:graduationproject/app/model/user_Group.dart';

import '../../../app/model/content.dart';
import '../../../app/model/post.dart';
import '../../../app/model/postdto.dart';
import 'adapter/profile_adapter.dart';

class ProfileRepository implements IProfileRepository {
  final _dio = Get.find<Dio>();

  @override
  Future<bool> UpdateProfile(User user, int iduser) async {
    var result = await _dio.put(
      'https://localhost:7252/api/User/Put/$iduser',
      data: user.toJson(),
    );
    if (result.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  }

  //
  @override
  Future<List<PostDto>> GetUserPost(int iduser) async {
    var result = await _dio
        .get('https://localhost:7252/api/Profile/GetPosts?IdUser=$iduser');
    var list = <PostDto>[];
    if (result.statusCode == 200) {
      for (var item in result.data) {
        list.add(PostDto.fromJson(item));
      }
    } else {
      return list;
    }
    return list;
  }

  @override
  Future<bool> UpdatePost(int idpost, Post post) async {
    var result = await _dio.put(
      'https://localhost:7252/api/Post/UpdatePost/$idpost',
      data: post.toJson(),
    );
    if (result.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  }

//   @override
//   Future<bool> DeletePost(int idpost)async {
//     var result= await _dio.delete('path',);
//  if(ExpastionStatus(result.statusCode!)){
//        return true;
//   }else{
//     return false;
//   }

  @override
  Future<bool> InteractionUser(UserPost userPost, int idpost) async {
    var data = await _dio.put('https://localhost:7252/api/UserPost/$idpost',
        data: userPost.toJson());
    if (data.statusCode == 200) {
      return true;
    } else {
      print(data.statusMessage);
    }
    return false;
  }

  @override
  Future<List<Comments>> GetComments(int idpost) async {
    var result = await _dio.get(
      'https://localhost:7252/api/Comments/Get/$idpost',
    );
    var list = <Comments>[];
    if (result.statusCode == 200) {
      for (var item in result.data) {
        list.add(Comments.fromJson(item));
      }
    }
    return list;
  }

  @override
  Future<bool> AddComment(Comments comments) async {
    var data = await _dio.post('https://localhost:7252/api/Comments/AddComment',
        data: comments.toJson());
    if (data.statusCode == 200) {
      return true;
    } else {
      print(data.statusMessage);
    }
    return false;
  }

  @override
  Future<List<Content>> GetContent() async {
    var result =
        await _dio.get('https://localhost:7252/api/Content/GetContents');
    print(result);
    var list = <Content>[];
    for (var item in result.data) {
      list.add(Content.fromJson(item));
    }
    return list;
  }

  @override
  Future<bool> DeletePost(Post post) async {
    var result = await _dio.delete('https://localhost:7252/api/Post/Delete',
        data: post.toJson());
    if (result.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  }

  @override
  Future<List<User>> GetFollow(int iduser) async {
    var result = await _dio.get(
      'https://localhost:7252/api/Profile/GetFollow?IdUser=$iduser',
    );
    print(result);
    var list = <User>[];
    if (result.statusCode == 200) {
      for (var item in result.data) {
        list.add(User.fromJson(item));
      }
    }
    return list;
  }

  @override
  Future<List<User>> GetFollowed(int iduser) async {
    var result = await _dio.get(
      ' https://localhost:7252/api/Profile/GetFollowed?IdUser=$iduser',
    );
    print(result);
    var list = <User>[];
    for (var item in result.data) {
      list.add(User.fromJson(item));
    }
    return list;
  }

  @override
  Future<List<Group>> GetUserGroups(int iduser) async {
    var result = await _dio
        .get('https://localhost:7252/api/Profile/GetGroups?IdUser=$iduser');
    print(result);
    var list = <Group>[];
    for (var item in result.data) {
      list.add(Group.fromJson(item));
    }
    return list;
  }

  @override
  Future<bool> DelFollowed(int iduser, int iddelete) async {
    var result = await _dio.delete('https://localhost:7252/api/Follow/$iduser',
        queryParameters: {"id": iddelete});
    if (result.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  }

  Future<bool> DelFollowedGroup(UserGroup userGroup) async {
    var result = await _dio.delete('https://localhost:7252/api/UserGroup',
        data: userGroup.toJson());
    if (result.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  }
  // @override
  // Future<Post?> Getpost(int idpost)async {
  //   var result=await _dio.get('path');
  //   if(ExpastionStatus(result.statusCode!)){
  //   var data =
  //             Post.fromJson(result.data as Map<String, dynamic>);
  //             return data;}
  //             else{
  //               return null;
  //             }}

  //     @override
  //     Future< Content?> GetIdContent(String content)async {
  //    var result= await _dio.get("path",
  //    queryParameters: {'content':content}
  //    );
  //     if(ExpastionStatus(result.statusCode!)){
  //  var data =
  //   Content.fromJson(result.data as Map<String, dynamic>);
  //   return data;  }
  //   else{
  //     return null;
  //   }
  //     }
}
