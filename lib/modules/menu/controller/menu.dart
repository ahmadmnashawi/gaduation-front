import 'package:flutter/animation.dart';
import 'package:get/get.dart';
import 'package:graduationproject/app/model/postdto.dart';

import '../../../app/model/comment.dart';
import '../../../app/model/content.dart';
import '../../../app/model/user.dart';
import '../../../app/model/userPost.dart';
import '../../sheard/auth_service.dart';
import '../data/home_repositry.dart';

class HomeController extends GetxController
    with GetSingleTickerProviderStateMixin {
  var page = 2.obs;
  var click = false.obs;
  static const String KeyData = "AuthData";
//  late Animation<Offset> offsetAnimation;
//  late AnimationController ancontroller;
  late Animation<double> animation;
  final onepostDto = PostDto();
  final Contents = <Content>[].obs;
  final postDto = <PostDto>[].obs;
  final listComment = <CommentsDto>[].obs;
  final idcontent = 0.obs;
  final homeRepo = HomeRepository();
  final auth = Get.find<AuthService>();
  final interActive = [
    {0: true}
  ].obs;
  final user = User().obs;
  final interaction = false.obs;
  final Iduser = 0;
  final IdPost = 0;
  final addcomment = Comments().obs;
  final userpost = UserPost().obs;

//  @override
// dispose() {
//  ancontroller.dispose(); // you need this
//   super.dispose();
// }
  @override
  Future<void> onInit() async {
    super.onInit();
    await GetUser();
    await GetAllPosts();
  }

  Future<void> GetUser() async {
    user.value = auth.getDataFromStorage() as User;
//  print(user.value.Email);
  }

  Future<void> GetAllContent() async {
    var data = await homeRepo.GetContent();
    Contents.assignAll(data);
  }

  Future<void> GetAllPosts() async {
    var data = await homeRepo.GetAllPost();
    if (data.isNotEmpty) {
      postDto.assignAll(data);
    }
  }

  Future<void> GetpostByType() async {
    var data = await homeRepo.GetByContent(idcontent.value);
    postDto.assignAll(data);
    Get.back();
  }

  Future<void> AddComment() async {
    var data = await homeRepo.AddComment(addcomment.value, Iduser);

    if (data) {
      print('True');
    } else {
      print('false');
    }
  }

  Future<void> GetComments(int idPost) async {
    var data = await homeRepo.GetComment(idPost);
    listComment.assignAll(data);
  }

  Future<void> addInterActionUser() async {
    userpost.value.IdUser = user.value.Id!;
    await homeRepo.InteractionUser(userpost.value);

    await GetAllPosts();
  }
}
