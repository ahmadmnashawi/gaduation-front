import 'package:get/get.dart';
import 'package:graduationproject/app/model/accessiblity_logIn.dart';
import 'package:graduationproject/app/model/group.dart';
import 'package:graduationproject/app/model/refrence.dart';
import 'package:graduationproject/app/model/test.dart';
import 'package:graduationproject/app/model/user.dart';

import '../../../app/model/Accsessbuility.dart';
import '../../../app/model/library.dart';
import '../../../app/model/userAccsesbuility.dart';
import '../../sheard/auth_service.dart';
import '../data/premission_repositry.dart';

class PermissionController extends GetxController {
  List<String> permission = [
    'Admain All permission',
    'Admain All',
    'Admain Library',
    'Admain post',
    'Admain Group'
  ];

  final isChecked = false.obs;
  final user = User().obs;
  final perRepo = PremissionRepository();
  final listpermissin = <Accessibility>[].obs;
  final auth = Get.find<AuthService>();
  final listLibrary = <Library>[].obs;
  final AllGroups = <Group>[].obs;
  final AllUser = <User>[].obs;
  final AllRefr = <Reference>[].obs;
  final AllTest = <Test>[].obs;
  final currentUser = User().obs;
  final currentLibrary = Library().obs;
  final currentGroup = Group().obs;
  final currentAccessibility = Accessibility().obs;
  final currentReference = Reference().obs;
  final currentTest = Test().obs;
  final userAccssebility = UserAccessibility().obs;
  final listuserAccssebility = <UserAccessibility>[].obs;
  final accssAllPram = <AllPram>[].obs;
  final allUserAccssebilityForEdit = <AccessiblityLogIn>[].obs;

  @override
  void onInit() {
    super.onInit();
    GetUser();
    getGetUserPermission(user.value.Id!);
    GetAllData();
    getAllGroups();
    getAllLibrary();
    getAllRef();
    getAllTest();
  }

  Future<void> getPramForEdit(int idUser) async {
    allUserAccssebilityForEdit.clear();
    var data = await perRepo.GetUserAllWithAllPermission(idUser);
    allUserAccssebilityForEdit.assignAll(data);
  }

  Future<void> GetUser() async {
    user.value = auth.getDataFromStorage()!;
  }

  String GetType(int id) {
    switch (id) {
      case 1:
        return 'All';
      case 2:
        return 'Add';
      case 3:
        return 'Update';
      case 4:
        return 'Delete';
      default:
    }
    return '';
  }

  Future<void> GetAllUserAccess() async {
    var data = await perRepo.GetUserPermission();
    listuserAccssebility.assignAll(data);
  }

  Future<void> GetAllData() async {
    accssAllPram.clear();
    var data = await perRepo.GetAllUser();
    for (var element in data) {
      var access = await auth.userAccessibilites(element.Id!);
      var alltype = <AllType>[].obs;
      for (var element1 in access!) {
        switch (element1.type) {
          case 'Group':
            var filter = <Accessibility>[];
            for (var f in access) {
              if (f.type == 'Group') {
                f.accessibility!.AccessibilityType =
                    GetType(f.accessibility!.id!);
                filter.add(f.accessibility!);
              }
            }
            alltype.add(AllType(
                'Group', filter, element1.object!.id!.toString(), true));
            break;
          case 'Library':
            var filter = <Accessibility>[];
            for (var f in access) {
              if (f.type == 'Library') {
                f.accessibility!.AccessibilityType =
                    GetType(f.accessibility!.id!);
                filter.add(f.accessibility!);
              }
            }
            alltype.add(AllType(
                'Library', filter, element1.object!.id!.toString(), true));
            break;
          case 'Test':
            var filter = <Accessibility>[];
            for (var f in access) {
              if (f.type == 'Test') {
                f.accessibility!.AccessibilityType =
                    GetType(f.accessibility!.id!);
                filter.add(f.accessibility!);
              }
            }
            alltype.add(
                AllType('Test', filter, element1.object!.id!.toString(), true));
            break;
          case 'Reference':
            var filter = <Accessibility>[];
            for (var f in access) {
              if (f.type == 'Reference') {
                f.accessibility!.AccessibilityType =
                    GetType(f.accessibility!.id!);
                filter.add(f.accessibility!);
              }
            }
            alltype.add(AllType(
                'Reference', filter, element1.object!.id!.toString(), true));
            break;
        }
      }
      accssAllPram.add(AllPram(element, alltype));
    }
  }

  Future<void> getGetUserPermission(int iduser) async {
    var data = await perRepo.GetPermission();
    for (var element in data) {
      element.AccessibilityType = GetType(element.id!);
    }
    listpermissin.assignAll(data);
    currentAccessibility.value = listpermissin.first;
  }

  Future<void> getAllGroups() async {
    var data = await perRepo.GetAllGroup();
    AllGroups.assignAll(data);
    currentGroup.value = AllGroups.first;
  }

  Future<void> getAllLibrary() async {
    var data = await perRepo.getAllLibrary();
    listLibrary.assignAll(data);
    currentLibrary.value = listLibrary.first;
  }

  Future<void> getAllRef() async {
    var data = await perRepo.getAllRefr();
    AllRefr.assignAll(data);
    currentReference.value = AllRefr.first;
  }

  Future<void> getAllTest() async {
    var data = await perRepo.getAllTest();
    AllTest.assignAll(data);
    currentTest.value = AllTest.first;
  }

  Future<void> getAllUser() async {
    var data = await perRepo.GetAllUser();
    AllUser.assignAll(data);
    currentUser.value = AllUser.first;
  }

  Future<void> delUserpremission(
      int idAc, int idUser, String type, int id) async {
    var res = await perRepo.DelUserAccessibility(idAc, idUser, type, id);
    if (res) {}
  }

  Future<void> addUserpremissiont(UserAccessibility u) async {
    var res = await perRepo.AddUserAccessibility(u);
    if (res) {
      Get.back();
    }
  }
}

class AllPram {
  User? user;
  List<AllType>? allType;
  AllPram(this.user, this.allType);
}

class AllType {
  String? type;
  String? title;
  List<Accessibility>? access;
  bool? check;
  AllType(this.type, this.access, this.title, this.check);
}
