import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:graduationproject/app/model/comment.dart';
import 'package:graduationproject/app/model/content.dart';
import 'package:graduationproject/app/model/postdto.dart';
import 'package:graduationproject/app/model/userPost.dart';

import '../../sheard/auth_service.dart';
import 'adapter/home_adapter.dart';

class HomeRepository implements IHomeRepository {
  final _dio = Get.find<Dio>();
  final auth = Get.find<AuthService>();
  @override
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
  Future<List<PostDto>> GetAllPost() async {
    var id = auth.getDataFromStorage()!.Id;
    var result =
        await _dio.get('https://localhost:7252/api/Main/Posts?IdUser=$id');

    var list = <PostDto>[];
    for (var item in result.data) {
      list.add(PostDto.fromJson(item));
    }
    return list;
  }

  @override
  Future<List<PostDto>> GetByContent(int idcontent) async {
    var id = Get.find<AuthService>().getDataFromStorage()!.Id;
    var result = await _dio.get(
        'https://localhost:7252/api/Main/PostsContent?IdUser=$id&IdContent=$idcontent');

    var list = <PostDto>[];
    for (var item in result.data) {
      list.add(PostDto.fromJson(item));
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
  Future<List<Comments>> GetComment(int idpost) async {
    var data = await _dio
        .get('https://localhost:7252/api/Comments/PostComment?IdPost=$idpost');
    var list = <Comments>[];
    for (var item in data.data) {
      list.add(Comments.fromJson(item));
    }
    return list;
  }

  @override
  Future<bool> InteractionUser(UserPost userPost) async {
    var data = await _dio.put('https://localhost:7252/api/UserPost',
        data: userPost.toJson());
    if (data.statusCode == 200) {
      return true;
    } else {
      print(data.statusMessage);
    }
    return false;
  }
}
