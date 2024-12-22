import 'package:graduationproject/app/model/group.dart';

import '../../../../app/model/comment.dart';
import '../../../../app/model/content.dart';
import '../../../../app/model/post.dart';
import '../../../../app/model/postdto.dart';
import '../../../../app/model/user.dart';
import '../../../../app/model/userPost.dart';
import '../../../../app/model/user_Group.dart';

abstract class IGroupRepository {
  Future<List<Group>> GetAllGroup();
  Future<bool> AddGroup(Group group);
  Future<bool> DeleteGroup(int idgroup);
  Future<bool> UpdateGroup(int idgroup, Group group);
  Future<Group?> GetGroup(int idgroup);
  Future<List<User>> GetMembers(int idgroup);
  Future<bool> AddMember(UserGroup userGroup);
  Future<List<PostDto>> GetAllPost(int idgroup);
  Future<List<Content>> GetContent();
  Future<bool> InteractionUser(UserPost userPost, int idpost);
  Future<List<Comments>> GetComment(int idpost);
  Future<bool> AddComment(Comments comments, int Iduser);
  Future<bool> AddpostUser(Post post);
  Future<List<Content>> GetAllContent();
  Future<bool> RemoveMember(UserGroup userGroup);
  Future<List<UserGroup>> exsitingMember();
  Future<bool> UpdatePost(int idpost, Post post);
}
