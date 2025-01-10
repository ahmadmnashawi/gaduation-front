import 'package:dio/dio.dart';
import 'package:get/get.dart';

import '../../../app/model/comment.dart';
import '../../sheard/auth_service.dart';

class CommentController extends GetxController {
  var allCommentPerson = <CommentsDto>[].obs;
  var textfield = ''.obs;
  final dio = Get.find<Dio>();

  // Future<void> getAllCommentByPost(int idPost) async {
  //   var result = await dio.get(
  //       'https://localhost:7252/api/Comments/PostCommentDto?IdPost=$idPost');

  //   var list = <CommentsDto>[];
  //   for (var item in result.data) {
  //     list.add(CommentsDto.fromJson(item));
  //   }
  //   allCommentPerson.assignAll(list);
  // }

  Future<bool> putComment(int idPost) async {
    final auth = Get.find<AuthService>().getDataFromStorage();
    var data = Comments(
      comment: textfield.value,
      idPost: idPost,
      idUser: auth!.Id!,
    );
    var result = await dio.post(
        'https://localhost:7252/api/Comments/AddComment',
        data: data.toJson());
    if (result.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  }
}
