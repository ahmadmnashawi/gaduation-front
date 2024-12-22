import 'package:graduationproject/app/model/content.dart';

import '../../../../app/model/comment.dart';
import '../../../../app/model/postdto.dart';
import '../../../../app/model/userPost.dart';

abstract class IHomeRepository {
  Future<List<Content>> GetContent();
  Future<List<PostDto>> GetAllPost();
  Future<List<PostDto>> GetByContent(int idcontent);
  Future<bool> AddComment(Comments comments, int Iduser);
  Future<List<Comments>> GetComment(int idpost);
  Future<bool> InteractionUser(UserPost userPost);
}
