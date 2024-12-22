import 'package:get/get.dart';

import '../../../app/model/complaints.dart';
import '../../../app/model/user.dart';
import '../../sheard/auth_service.dart';
import '../data/complaints_repositiory.dart';

class ComplaintsController extends GetxController {
  final comRepo = ComplaintsRepository();
  final ListComplaintsAdmain = <Complaint>[].obs;
  final listUser = <Complaint>[].obs;
  final newComplaint = Complaint().obs;
  final auth = Get.find<AuthService>();
  final user = User().obs;
  final numtype = 0.obs;
  final text = 'inthis'.tr;
  final textcuser1 = 'to'.tr;
  final txt = ''.obs;
  @override
  Future<void> onInit() async {
    super.onInit();
    // dont forget test stauteuser
    getComplaints();
    GetUser();
    getRefrence();
    getComplaints();
  }

  Future<void> GetUser() async {
    user.value = auth.getDataFromStorage()!;
  }

  Future<void> getComplaints() async {
    var data = await comRepo.GetAllComplaint();
    for (var element in data) {
      element.user = user.value;
    }
    ListComplaintsAdmain.assignAll(data);
  }

  Future<void> getRefrence() async {
    var data = await comRepo.GetcomplaintUser(user.value.Id!);

    for (var element in data) {
      element.user = auth.getDataFromStorage();
    }
    listUser.assignAll(data);
  }

  Future<void> addComplaint() async {
    newComplaint.value.IdUser = user.value.Id;
    var res = await comRepo.Putcomplaints(newComplaint.value);
    if (res) {
      getRefrence();
      Get.back();
    }
  }

  Future<void> UpdateComplaint(Complaint c) async {
    c.IdUser = user.value.Id;
    var res = await comRepo.Updatecomplaint(c);
    if (res) {
      getComplaints();
      Get.back();
    }
  }
}
