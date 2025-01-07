import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:graduationproject/app/model/group.dart';
import 'package:graduationproject/app/model/post.dart';
import 'package:graduationproject/app/model/user_Group.dart';
import 'package:graduationproject/modules/profile/data/profile_repositry.dart';
import 'package:image_picker/image_picker.dart';

import '../../../api/storage/storge_service.dart';
import '../../../api/ui/util.dart';
import '../../../app/model/comment.dart';
import '../../../app/model/content.dart';
import '../../../app/model/follow.dart';
import '../../../app/model/postdto.dart';
import '../../../app/model/user.dart';
import '../../../app/model/userPost.dart';
import '../../sheard/auth_service.dart';

class ProfileController extends GetxController {
  var click = false.obs;
  final selectContent = Content().obs;
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
  // final user = User().obs;
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

  final formfield = GlobalKey<FormState>();
  final emailcontroller = TextEditingController();
  final passcontroller = TextEditingController();
  Uint8List? image;
  @override
  void onInit() {
    super.onInit();
    GetUser();
    GetAllContent();
    GetPostUser();
  }

  Future<void> GetUser() async {
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
    var data = await profileRepo.GetUserPost(userprofile.value.Id!);

    Listuserpost.assignAll(data);
  }

  Future pickImage() async {
    try {
      final image = await ImagePicker().pickImage(source: ImageSource.gallery);
      if (image == null) return;
      stringPickImage.value = Utility.base64String(await image.readAsBytes());
    } catch (e) {
      print('Failed to pick image: $e');
    }
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
    print(data);
  }

  Future<void> GetAllComments(int idpost) async {
    var data = await profileRepo.GetComments(idpost);
    comments.assignAll(data);
  }

  Future<void> AddComment(int idpost) async {
    var data = await profileRepo.GetComments(idpost);
    print(data);
  }

  Future<void> GetAllContent() async {
    var data = await profileRepo.GetContent();
    Contents.assignAll(data);
    selectContent.value = Contents.first;
  }

  Future<void> UpdatePost() async {
    if (stringPickImage.value.isNotEmpty) {
      postidnew.value.Image =
          Utility.dataFromBase64String(stringPickImage.value);
    }
    var result =
        await profileRepo.UpdatePost(postidnew.value.Id!, postidnew.value);
    if (result) {
      stringPickImage.value = '';
      Get.back();
      await GetUser();
      await GetAllContent();
      await GetPostUser();
    }
  }

  Future<void> DeletPost(int idPost) async {
    var data = await profileRepo.DeletePost(idPost);
    if (data) {
      await GetUser();
      await GetAllContent();
      await GetPostUser();
    }
  }

  Future<void> Delefolloewd(int id) async {
    var data = await profileRepo.DelFollowed(userprofile.value.Id!, id);
    if (data) {
      GetUserFollow();
    }
  }

  Future<bool> DelefolloewdGroup(UserGroup group) async {
    var data = await profileRepo.DelFollowedGroup(group);
    if (data) {
      await GetUserFollow();
      await GetuserGroup();
      Get.back();
      return data;
    }
    return false;
  }

  Future<bool> Updateprofile() async {
    if (stringPickImage.value.isNotEmpty) {
      userprofile.value.Image =
          Utility.dataFromBase64String(stringPickImage.value);
    }

    var data = await profileRepo.UpdateProfile(
        userprofile.value, userprofile.value.Id!);
    if (data) {
      auth.stroge.deleteDataByKey(KeyData);
      await auth.logIn(userprofile.value.Email!, userprofile.value.Password!);
    }
    return data;
  }

  Future<void> GetUserFollow() async {
    var data = await profileRepo.GetFollow(userprofile.value.Id!);
    UserFollow.assignAll(data);
  }

  Future<void> GetFollowuser() async {
    var data = await profileRepo.GetFollow(userprofile.value.Id!);
    FollowUser.assignAll(data);
  }

  Future<void> GetuserGroup() async {
    var data = await profileRepo.GetUserGroups(userprofile.value.Id!);
    userfollowGroups.assignAll(data);
  }

  Future<void> Getusepost() async {
    var data = await profileRepo.GetUserPost(userprofile.value.Id!);
    listpost.assignAll(data);
  }
}
