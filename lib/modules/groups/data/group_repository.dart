import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:graduationproject/app/model/group.dart';
import 'package:graduationproject/app/model/user.dart';
import 'package:graduationproject/modules/sheard/auth_service.dart';

import '../../../app/model/comment.dart';
import '../../../app/model/content.dart';
import '../../../app/model/post.dart';
import '../../../app/model/postdto.dart';
import '../../../app/model/userPost.dart';
import '../../../app/model/user_Group.dart';
import 'adapter/group_adapter.dart';

class GroupRepository implements IGroupRepository {
  final _dio = Get.find<Dio>();

  @override
  Future<bool> AddGroup(Group group) async {
    var result = await _dio.post('https://localhost:7252/api/Group/AddGroup',
        data: group.toJson());
    return result.statusCode == 200;
  }

  @override
  Future<List<Content>> GetContent() async {
    var result =
        await _dio.get('https://localhost:7252/api/Content/GetContents');
    var list = <Content>[];
    for (var item in result.data) {
      list.add(Content.fromJson(item));
    }
    return list;
  }

  @override
  Future<bool> DeleteGroup(int idgroup) async {
    var result = await _dio
        .delete('https://localhost:7252/api/Group/Delete?group=$idgroup');
    return result.statusCode == 200;
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

  @override
  Future<List<Group>> GetAllGroup() async {
    var result = await _dio.get('https://localhost:7252/api/Group/GetGroups');
    print(result);
    var list = <Group>[];
    for (var item in result.data) {
      list.add(Group.fromJson(item));
    }
    return list;
  }

  @override
  Future<bool> UpdateGroup(int idgroup, Group group) async {
    var result = await _dio.put(
      'https://localhost:7252/api/Group/Put/${group.Id}',
      data: group.toJson(),
    );
    if (result.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  }

  @override
  Future<Group?> GetGroup(int idgroup) async {
    var result =
        await _dio.get('https://localhost:7252/api/Group/Get/$idgroup');
    if (result.statusCode == 200) {
      var data = Group.fromJson(result.data as Map<String, dynamic>);
      return data;
    } else {
      return null;
    }
  }

  @override
  Future<List<User>> GetMembers(int idgroup) async {
    var result = await _dio.get(
      'https://localhost:7252/api/Group/GetGroupMembers?IdGroup=$idgroup',
    );
    print(result);
    var list = <User>[];
    for (var item in result.data) {
      list.add(User.fromJson(item));
    }
    return list;
  }

  // @override
  // Future<bool> AddMember(int idperson, int idGroup) async {
  //   var result = await _dio.post('', queryParameters: {'id': idperson});
  //   return result.statusCode == 200;
  // }

  @override
  Future<List<PostDto>> GetAllPost(int idgroup) async {
    final idUser = Get.find<AuthService>().getDataFromStorage()!.Id;
    var result = await _dio.get(
        'https://localhost:7252/api/Group/GetGroupPosts?IdGroup=$idgroup&IdUser=$idUser');
    var list = <PostDto>[];
    for (var item in result.data) {
      list.add(PostDto.fromJson(item));
    }
    return list;
  }

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

  Future<bool> addUserPost(UserPost userPost) async {
    var data = await _dio.post('https://localhost:7252/api/UserPost',
        data: userPost.toJson());
    if (data.statusCode == 200) {
      return true;
    } else {
      print(data.statusMessage);
    }
    return false;
  }

  @override
  Future<List<Comments>> GetComment(int idpost) async {
    var data = await _dio.get('https://localhost:7252/api/Comment/$idpost');
    var list = <Comments>[];
    for (var item in data.data) {
      list.add(Comments.fromJson(item));
    }
    return list;
  }

  @override
  Future<bool> AddComment(Comments comments, int Iduser) async {
    var data = await _dio.post('https://localhost:7252/api/Post',
        data: comments.toJson());
    if (data.statusCode == 200) {
      return true;
    } else {
      print(data.statusMessage);
    }
    return false;
  }

  @override
  Future<bool> AddpostUser(Post post) async {
    var result = await _dio.post('https://localhost:7252/api/Post/AddPost',
        data: post.toJson());
    print(result.data);
    if (result.statusCode == 200) {
      return true;
    }
    return false;
  }

  @override
  Future<List<Content>> GetAllContent() async {
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
  Future<bool> RemoveMember(UserGroup userGroup) async {
    var result = await _dio.delete('https://localhost:7252/api/UserGroup',
        data: userGroup.toJson());
    return result.statusCode == 200;
  }

  @override
  Future<bool> AddMember(UserGroup userGroup) async {
    var result = await _dio.post('https://localhost:7252/api/UserGroup',
        data: userGroup.toJson());
    return result.statusCode == 200;
  }

  @override
  Future<List<UserGroup>> exsitingMember() async {
    var result = await _dio.get(
      'https://localhost:7252/api/UserGroup',
    );
    var list = <UserGroup>[];
    for (var item in result.data) {
      list.add(UserGroup.fromJson(item));
    }
    return list;
  }
}
