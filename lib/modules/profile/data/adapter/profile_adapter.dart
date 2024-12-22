import 'package:graduationproject/app/model/group.dart';
import 'package:graduationproject/app/model/user.dart';

import '../../../../app/model/comment.dart';
import '../../../../app/model/content.dart';
import '../../../../app/model/post.dart';
import '../../../../app/model/postdto.dart';
import '../../../../app/model/userPost.dart';

abstract class IProfileRepository {
  Future<List<PostDto>> GetUserPost(int iduser);
  Future<bool> InteractionUser(UserPost userPost, int idpost);
  Future<List<Comments>> GetComments(int idpost);
  Future<bool> AddComment(Comments comments);
  Future<List<Content>> GetContent();
  Future<bool> UpdatePost(int idpost, Post post);
  Future<bool> DeletePost(Post post);
  Future<List<User>> GetFollow(int iduser);
  Future<List<User>> GetFollowed(int iduser);
  Future<bool>DelFollowed(int iduser,int iddelete);
  Future<List<Group>> GetUserGroups(int iduser);
  Future<bool> UpdateProfile(User user, int iduser);

  // Future<Post?>Getpost(int idpost);
  //Future<Content?>GetIdContent(String content);
}
