import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:graduationproject/app/model/booklibrary.dart';
import 'package:graduationproject/app/model/buy_book.dart';
import 'package:graduationproject/app/model/user.dart';

import '../../../api/storage/storge_service.dart';
import '../../sheard/auth_service.dart';
import '../data/setting-repository.dart';

class SettingController extends GetxController {
  final userSingn = User().obs;
  static const String KeyData = "AuthData";
  final stroge = Get.find<StorageService>();
  final text = 'settingHelp'.tr;
  final setRepo = SettingRepository();
  final allBuyBook = <Buybook>[].obs;
  final auth = Get.find<AuthService>();
  final _dio = Get.find<Dio>();
  final user = User().obs;
  final test = false.obs;
  @override
  void onInit() {
    super.onInit();
    GetUser();
    // getUser();
  }

  Future<void> getAllInvoice() async {
    var result = await _dio.get(
      'https://localhost:7252/api/Buybook/GetBuybooks',
    );
    var list = <Buybook>[];
    for (var element in result.data) {
      list.add(Buybook.fromJson(element));
    }
    allBuyBook.assignAll(list);
  }

  Future<List<BookLibrary>> getAllILib() async {
    var result = await _dio.get(
      'https://localhost:7252/api/BookLibrary/GetBookLibraries',
    );
    var list = <BookLibrary>[];
    for (var element in result.data) {
      list.add(BookLibrary.fromJson(element));
    }
    return list;
  }

  Future<void> GetUser() async {
    user.value = auth.getDataFromStorage() as User;
//  print(user.value.Email);
  }

  Future<void> getUser() async {
    var s = stroge.getData(KeyData);
    print(s);
  }

  Future<void> DelUser() async {
    await setRepo.Deluser(user.value);
  }
}
