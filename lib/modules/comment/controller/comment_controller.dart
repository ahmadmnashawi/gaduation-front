import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:graduationproject/modules/comment/view/comment.dart';

class CommentController extends GetxController {
  var objcomment = commentt('', '', '', 1);
  var allcommentperson = <commentt>[].obs;
  var textfieldd = ''.obs;
  @override
  void onInit() {
    super.onInit();
    getallcomment();
  }

  Future getallcomment() async {
    objcomment.setcomment('Haya Ye', 'Nice ', 'assets/images/girl.gif', 1);
    objcomment.setcomment(
        'Asia ba', 'Good  Idea ', 'assets/images/girl.gif', 1);
    objcomment.setcomment(
        'Hadeel da', 'Think You for Information  ', 'assets/images/boy.gif', 1);
    objcomment.setcomment('Asia Bi', ' I liked ', 'assets/images/girl.gif', 1);
    objcomment.setcomment('Abd bnu', ' very good ', 'assets/images/boy.gif', 1);
    allcommentperson.assignAll(objcomment.allcomment);
  }

  Future<bool> Putcomplaints(commentt c) async {
    final dio = Get.find<Dio>();
    var result = await dio.post(
        'https://localhost:7252/api/Comments/AddComment',
        data: c.toJson());
    if (result.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  }

  Future<void> addComment(commentt comm) async {
    objcomment.allcomment.add(comm);
    allcommentperson.value = objcomment.allcomment;
  }
}
