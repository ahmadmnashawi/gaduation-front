import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:graduationproject/app/model/booklibrary.dart';
import 'package:graduationproject/app/model/buy_book.dart';
import 'package:graduationproject/app/model/buybookUser.dart';
import 'package:graduationproject/app/model/user.dart';
import 'package:graduationproject/modules/libraryy/data/libraray_repositry.dart';

import '../../../api/storage/storge_service.dart';
import '../../sheard/auth_service.dart';
import '../data/setting-repository.dart';

class SettingController extends GetxController {
  final userSingn = User().obs;
  static const String KeyData = "AuthData";
  final stroge = Get.find<StorageService>();

  final setRepo = SettingRepository();
  final listBasket = <BuyBookUserDto>[].obs;
  final allBuyBook = <Buybook>[].obs;
  final auth = Get.find<AuthService>();
  final _dio = Get.find<Dio>();
  final user = User().obs;
  final test = false.obs;
  final textDescription = <String>[].obs;
  final listImage = <String>[].obs;
  @override
  void onInit() {
    super.onInit();
    GetUser();
    // getUser();
  }

  Future<void> getImage() async {
    var data = await fetchUnsplashImages('cat');
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

  Future<void> getBasket() async {
    var data = await LibraryRepository().GetUserBuyBook(user.value.Id!);
    listBasket.assignAll(data);
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
    await setRepo.Deluser(user.value.Id!);
  }
}
