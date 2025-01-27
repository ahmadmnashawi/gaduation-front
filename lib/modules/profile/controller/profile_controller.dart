import 'dart:typed_data';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:graduationproject/app/model/group.dart';
import 'package:graduationproject/app/model/post.dart';
import 'package:graduationproject/app/model/user_Group.dart';
import 'package:graduationproject/modules/profile/data/profile_repositry.dart';
import 'package:image_picker/image_picker.dart';

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

  final profileRepo = ProfileRepository();
  final userprofile = User().obs;
  final Listuserpost = <PostDto>[].obs;
  final auth = Get.find<AuthService>();
  final followdelete = Follow().obs;
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

  final interActive = [
    {0: true}
  ].obs;

  final formfield = GlobalKey<FormState>();
  final emailcontroller = TextEditingController();
  final passcontroller = TextEditingController();
  final textDescription = <String>[].obs;
  final listImage = <String>[].obs;

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

  Future<void> getImage() async {
    var value = postidnew.value.Description ?? '';
    var data = await fetchUnsplashImages(value);
    listImage.assignAll(data);
  }

  Future<List<String>> fetchUnsplashImages(String query) async {
    const apiKey = "V83HBiC1FxRJUZMq14Vp4R7TBXo99F_j6vioIfjufgI";

    final response = await Get.find<Dio>().get(
      "https://api.unsplash.com/search/photos?query=$query",
      options: Options(headers: {
        "Authorization": "Client-ID $apiKey",
      }),
    );
    // print('///////////////////${response.data}');
    if (response.statusCode == 200) {
      final List<dynamic> results = response.data["results"];
      final List<String> imageUrls =
          results.map((item) => (item["urls"]["small"].toString())).toList();
      var data =
          results.map((item) => (item["description"].toString())).toList();
      textDescription.assignAll(data);
      return imageUrls;
    } else {
      throw Exception("Failed to fetch images");
    }
  }

  Future<String> generateDescription(String text) async {
    final apiKey = "e1b992cb-e561-4333-9143-83cd0edd26c6";
    final url = "https://api.deepai.org/api/text-generator";

    try {
      final dio = Dio();
      final response = await dio.post(
        url,
        options: Options(headers: {"api-key": apiKey}),
        data: {"text": text},
      );

      if (response.statusCode == 200) {
        return response.data["output"];
      } else {
        throw Exception("Failed to generate description");
      }
    } catch (e) {
      throw Exception("Error occurred: $e");
    }
  }

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
    postidnew.value.IdContent = selectContent.value.Id;
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
      stringPickImage.value = '';
      Get.back();
      await GetUser();
      await GetAllContent();
      await GetPostUser();
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
