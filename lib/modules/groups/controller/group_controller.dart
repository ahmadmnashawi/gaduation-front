import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:graduationproject/app/model/user.dart';
import 'package:graduationproject/app/model/user_Group.dart';
import 'package:graduationproject/modules/profile/data/profile_repositry.dart';
import 'package:image_picker/image_picker.dart';

import '../../../api/ui/util.dart';
import '../../../app/model/accessiblity_logIn.dart';
import '../../../app/model/comment.dart';
import '../../../app/model/content.dart';
import '../../../app/model/group.dart';
import '../../../app/model/post.dart';
import '../../../app/model/postdto.dart';
import '../../../app/model/userPost.dart';

import '../../menu/data/home_repositry.dart';
import '../../sheard/auth_service.dart';
import '../data/group_repository.dart';

class GroupController extends GetxController {
  var page = 2.obs;
  var click = false.obs;
  var press = false.obs;
  final nowgroup = 0.obs;
  final newpost = Post().obs;
  final selectContent = Content().obs;
  final contents = <Content>[].obs;
  final selectContentGroup = Content().obs;
  var dropdownvalue = 'History'.obs;
  final ImagePicker imagepicker = ImagePicker();
  var allGroups = <Group>[].obs;
  var groupRepo = GroupRepository();
  final addcomment = Comments().obs;
  var currentGroup = Group().obs;
  final msg = ''.obs;
  var members = <User>[].obs;
  var postsList = <PostDto>[].obs;
  var addnewGroup = Group().obs;
  final stringPickImage = ''.obs;
  final userpost = UserPost().obs;
  final auth = Get.find<AuthService>();
  final user = User().obs;
  final personExsisting = false.obs;
  final IdPost = 0;
  final addMember = UserGroup().obs;
  final removeMember = UserGroup().obs;
  final editpost = Post().obs;
  final listComment = <CommentsDto>[].obs;
  final access = <AccessiblityLogIn>[].obs;
  PickedFile? imagefile;
  final textshowgroup = 'ac'.tr;
  final textaddgroup = 'ae'.tr;
  final texteditg = 'af'.tr;
  final textgroup = 'ag'.tr;
  final formfield = GlobalKey<FormState>();
  final formFieldGroup = GlobalKey<FormState>();
  //List <String> Content=['History ','IT','Culture','Senice','Math','Medical','Global'];
  final textDescription = <String>[].obs;
  final listImage = <String>[].obs;
  @override
  void onInit() {
    getAllGroups();
    user.value = auth.getDataFromStorage()!;
    access.value = auth
        .getUserLogInAccess()
        .where((element) => element.type == 'Group')
        .toList();
    existingMember();
    super.onInit();
  }

  Future<void> getImage() async {
    var value = newpost.value.Description ?? '';
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

  Future pickImageFun() async {
    try {
      final image = await ImagePicker().pickImage(source: ImageSource.gallery);
      if (image == null) return;
      stringPickImage.value = Utility.base64String(await image.readAsBytes());
    } catch (e) {
      print('Failed to pick image: $e');
    }
  }

  Future<void> getAllGroups() async {
    await getAllContent();
    var data = await groupRepo.GetAllGroup();
    for (var element in data) {
      element.content =
          contents.where((p0) => p0.Id == element.IdContent).first;
    }
    allGroups.assignAll(data);
  }

  Future<void> delGroup(int idgroup) async {
    var res = await groupRepo.DeleteGroup(idgroup);
    if (res) {
      getAllGroups();
      Get.back();
    }
  }

  Future<void> getGroup(int idgroup) async {
    var data = await groupRepo.GetGroup(idgroup);
    currentGroup.value = data!;
  }

  Future<void> getMembers() async {
    var data = await groupRepo.GetMembers(currentGroup.value.Id!);
    members.assignAll(data);
  }

  Future<void> getPosts() async {
    var data = await groupRepo.GetAllPost(currentGroup.value.Id!);
    postsList.assignAll(data);
  }

  Future<void> AddGroup() async {
    if (stringPickImage.value.isNotEmpty) {
      addnewGroup.value.Image =
          Utility.dataFromBase64String(stringPickImage.value);
    }
    addnewGroup.value.IdContent = selectContentGroup.value.Id;
    var res = await groupRepo.AddGroup(addnewGroup.value);
    if (res) {
      await getAllGroups();
      Get.back();
    }
  }

  Future<void> getAllContent() async {
    var data = await groupRepo.GetContent();
    contents.assignAll(data);
    selectContentGroup.value = contents.first;
  }

  Future<void> UpdateGroup() async {
    // currentGroup.value.Image =
    //     Utility.dataFromBase64String(stringPickImage.value);
    var res =
        await groupRepo.UpdateGroup(currentGroup.value.Id!, currentGroup.value);
    if (res) {
      Get.back();
    }
  }

  Future<void> UpdatePost() async {
    editpost.value.Image = Utility.dataFromBase64String(stringPickImage.value);
    await groupRepo.UpdatePost(editpost.value.Id!, editpost.value);
  }

  Future<void> addUserPost() async {
    var id = auth.getDataFromStorage()!.Id;
    var allPost = await ProfileRepository().GetUserPost(id!);
    await groupRepo.addUserPost(UserPost(
        Id: 0, Interaction: false, IdPost: allPost.last.post!.Id, IdUser: id));
  }

  Future<void> addInterActionUser() async {
    userpost.value.IdUser = user.value.Id!;
    await HomeRepository().InteractionUser(userpost.value);
    await getPosts();
  }

  Future<void> GetUser() async {
    user.value = auth.getDataFromStorage() as User;
//  print(user.value.Email);
  }

  Future<void> GetComments(int idPost) async {
    var data = await HomeRepository().GetComment(idPost);
    listComment.assignAll(data);
  }

  Future<void> AddComment() async {
    var data = await groupRepo.AddComment(addcomment.value, user.value.Id!);
    // GetComments( );
    if (data) {
      print('True');
    } else {
      print('false');
    }
  }

  Future<void> AddPost(bool fromGroup) async {
    newpost.value.IdContent = selectContent.value.Id;
    if (fromGroup) {
      newpost.value.IdGroup = currentGroup.value.Id;
      newpost.value.IdContent = currentGroup.value.IdContent;
    }

    newpost.value.IdUser = user.value.Id;
    newpost.value.dateTime = DateTime.now();
    if (stringPickImage.value.isNotEmpty) {
      newpost.value.Image = Utility.dataFromBase64String(stringPickImage.value);
    }
    var data = await groupRepo.AddpostUser(newpost.value);
    newpost.value = Post();
    if (data) {
      Get.back();
      Get.snackbar(
        'ah'.tr,
        "aj".tr,
        //  icon: Icon(Icons.person, color: Colors.white),
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: const Color.fromARGB(255, 246, 123, 127),
        borderRadius: 20,
        margin: const EdgeInsets.all(15),
        colorText: Colors.white,
        duration: const Duration(seconds: 4),
        isDismissible: true,
        //  dismissDirection: SnackDismissDirection.HORIZONTAL,
        forwardAnimationCurve: Curves.easeOutBack,
      );
    } else {
      Get.snackbar(
        'Errore'.tr,
        "ak".tr,
        //  icon: Icon(Icons.person, color: Colors.white),
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: const Color.fromARGB(255, 246, 123, 127),
        borderRadius: 20,
        margin: const EdgeInsets.all(15),
        colorText: Colors.white,
        duration: const Duration(seconds: 4),
        isDismissible: true,
        //  dismissDirection: SnackDismissDirection.HORIZONTAL,
        forwardAnimationCurve: Curves.easeOutBack,
      );
    }
  }

  Future<void> AddMember() async {
    await groupRepo.AddMember(addMember.value);
  }

  Future<void> existingMember() async {
    var data = await groupRepo.existingMember();
    personExsisting.value = data.any((element) =>
        element.IdUser == user.value.Id &&
        element.IdGroup == currentGroup.value.Id);
    msg.value = personExsisting.value ? 'w'.tr : 'z'.tr;
  }
}
