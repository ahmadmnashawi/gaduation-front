import 'dart:convert';

import 'package:get/get.dart';
import 'package:graduationproject/app/model/group.dart';
import 'package:graduationproject/app/model/post.dart';
import 'package:graduationproject/app/model/user_Group.dart';
import 'package:graduationproject/modules/profile/data/profile_repositry.dart';
import 'package:image_picker/image_picker.dart';

import '../../../api/storage/storge_service.dart';
import '../../../app/model/comment.dart';
import '../../../app/model/content.dart';
import '../../../app/model/follow.dart';
import '../../../app/model/postdto.dart';
import '../../../app/model/user.dart';
import '../../../app/model/userPost.dart';
import '../../genereted/sheard/util.dart';
import '../../sheard/auth_service.dart';

class ProfileController extends GetxController {
  var click = false.obs;
  var passtoggle = true.obs;
  final newcontent = Content().obs;
  final editpost = Post().obs;
  final stroge = Get.find<StorageService>();
  final profileRepo = ProfileRepository();
  static const String KeyData = "AuthData";
  final userprofile = User().obs;
  final Listuserpost = <PostDto>[].obs;
  final UpdateUser = User().obs;
  final auth = Get.find<AuthService>();
  final followdelete = Follow().obs;
  final user = User().obs;
  final ImagePicker imagepicker = ImagePicker();
  PickedFile? imagefile;
  var valuechoice = ''.obs;
  var dropdownvalue = 'History'.obs;
  final Contents = <Content>[].obs;
  final stringPickImage = ''.obs;
  final userpost = UserPost().obs;
  final comments = <Comments>[].obs;
  final addcomment = Comments().obs;
  final postidnew = Post().obs;
  final UserFollow = <User>[].obs;
  final FollowUser = <User>[].obs;
  final userfollowGroups = <Group>[].obs;
  final currentGroup = Group().obs;
  final listpost = <PostDto>[];
  final texteditprofile =
      'In this interface, you can modify any information you have';
  final texteditpost =
      'In this interface, it is possible to modify the information that needs to be modified, whether an image or text';
  final textprofile =
      'In this interface, your personal information and all the posts that you have published will appear';
  final interActive = [
    {0: true}
  ].obs;
  @override
  void onInit() {
    super.onInit();
    GetUser();
    GetAllContent();
    GetPostUser();
  }

  Future<void> GetUser() async {
    user.value = auth.getDataFromStorage()!;
    userprofile.value = auth.getDataFromStorage()!;
  }

  Future takePhoto(ImageSource source) async {
    final PiickedFile = await imagepicker.getImage(source: source);
    imagefile = PiickedFile;
  }

  Future pickImageFun() async {
    try {
      final image = await ImagePicker().pickImage(source: ImageSource.gallery);
      if (image == null) return;
      stringPickImage.value = Utility.base64String(await image.readAsBytes());
    } catch (e) {
      print('Failed to pick image: $e');
    }
  }

  Future<void> GetPostUser() async {
    var data = await profileRepo.GetUserPost(user.value.Id!);

    Listuserpost.assignAll(data);
  }

  // Future <void>UpduteUserInfo()async{
  // UpdateUser.value.Image = Utility.dataFromBase64String(stringPickImage.value);
  //   var res=await profileRepo.UpdateProfile(UpdateUser.value, user.value.Id!);
  //   if(res){
  //     print('update user');
  //   }else{
  //     print('not update user');
  //   }
  // }
  // Future <void> UpdatePostUser(int idpost)async{
  //     var res=await profileRepo.UpdatePost(idpost,editpost.value);
  //   if(res){
  //     print('update user');
  //   }else{
  //     print('not update user');
  //   }
  // }
  // Future <void> DeletPost(int idpost)async{
  //      var res=await profileRepo.DeletePost(idpost);
  //   if(res){
  //     GetPostUser();
  //     print('update user');

  //   }else{
  //     print('not update user');
  //   }
  // }
  //   Future <void>Getpost(int idpost)async{
  //  var result=await profileRepo.Getpost(idpost);
  //  editpost.value=result!;
  //   }
  //      Future <void>Updatecontentpost(String content)async{
  //  var result=await profileRepo.GetIdContent(content);
  //       newcontent.value=result!;
  //   }
  Future<void> GetInterActionUser(int idpost) async {
    var data = await profileRepo.InteractionUser(userpost.value, idpost);
  }

  Future<void> GetAllComments(int idpost) async {
    var data = await profileRepo.GetComments(idpost);
    comments.assignAll(data);
  }

  Future<void> AddComment(int idpost) async {
    var data = await profileRepo.GetComments(idpost);
  }

  Future<void> GetAllContent() async {
    var data = await profileRepo.GetContent();
    Contents.assignAll(data);
  }

  Future<void> UpdatePost() async {
    await profileRepo.UpdatePost(postidnew.value.Id!, postidnew.value);
    Get.back();
    GetUser();
    GetAllContent();
    GetPostUser();
  }

  Future<void> DeletPost(Post post) async {
    var data = await profileRepo.DeletePost(post);
    GetUser();
    GetAllContent();
    GetPostUser();
  }

  Future<void> Delefolloewd(int id) async {
    var data = await profileRepo.DelFollowed(user.value.Id!, id);
    GetUserFollow();
  }

  Future<void> DelefolloewdGroup(UserGroup group) async {
    var data = await profileRepo.DelFollowedGroup(group);
    GetUserFollow();
  }

  Future<void> Updateprofile() async {
    var data = await profileRepo.UpdateProfile(user.value, user.value.Id!);
    auth.stroge.deleteDataByKey(KeyData);
    auth.stroge.saveData(KeyData, jsonDecode(user.toJson()));
    user.value = auth.getDataFromStorage()!;
  }

  Future<void> GetUserFollow() async {
    var data = await profileRepo.GetFollow(user.value.Id!);
    UserFollow.assignAll(data);
  }

  Future<void> GetFollowuser() async {
    var data = await profileRepo.GetFollow(user.value.Id!);
    FollowUser.assignAll(data);
  }

  Future<void> GetuserGroup() async {
    var data = await profileRepo.GetUserGroups(user.value.Id!);
    userfollowGroups.assignAll(data);
  }

  Future<void> Getusepost() async {
    var data = await profileRepo.GetUserPost(user.value.Id!);
    listpost.assignAll(data);
  }
}
