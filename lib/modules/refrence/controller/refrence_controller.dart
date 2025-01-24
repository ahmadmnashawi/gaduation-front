import 'package:get/get.dart';
import 'package:graduationproject/modules/sheard/auth_service.dart';

import '../../../app/model/content.dart';
import '../../../app/model/refrence.dart';
import '../../../app/model/refrenceDto.dart';
import '../../groups/data/group_repository.dart';
import '../data/refrence_repositry.dart';

class RerenceController extends GetxController {
  final refrenceRepo = RefrenceRepository();
  final ListRefrence = <Reference>[].obs;
  final ListRefrenceLink = <Reference>[].obs;
  final DelRefrence = Reference().obs;
  final Addrefrence = Reference().obs;
  final listAdmainrefrence = <RefrenceDto>[].obs;
  final textuser = '';
  final valuetext = ''.obs;
  final textallrefrence = 'refrencehelp'.tr;
  final contenst = <Content>[].obs;
  final selectContent = Content().obs;
  final auth = Get.find<AuthService>();
  final refrences = [
    'it'.tr, 'ara'.tr,
    // 'Math Reference',
    // 'Medical Reference','Chamistry  Reference','Phaysis  Reference'
  ];
  final ItRefrence = [
    'https://www.dataunitconverter.com/blog/bit-nibble-byte',
    'https://www.techtarget.com/searchmobilecomputing/definition/wireless',
    'https://www.baeldung.com/java-stack-heap',
    'https://www.baeldung.com/linux/buffer-vs-cache-memory',
  ];
  @override
  Future<void> onInit() async {
    super.onInit();
    getAllRefrence();
    getAllrefreneAdmi();
  }

  Future<void> getcontent() async {
    var data = await refrenceRepo.GetARefrenceConternt();
    contenst.assignAll(data);
  }

  Future<void> getAllRefrence() async {
    var data = await refrenceRepo.GetAllRefrence();
    var dataContent = await GroupRepository().GetContent();
    contenst.assignAll(dataContent);
    selectContent.value = contenst.first;
    for (var element in data) {
      element.content = dataContent
          .where((element1) => element1.Id == element.IdContent)
          .first;
    }
    ListRefrence.assignAll(data);
  }

  Future<void> getRefrence(int id) async {
    var data = await refrenceRepo.GetRefrencelink(id);
    ListRefrenceLink.assignAll(data);
  }

  Future<void> DeleRefrence(int id) async {
    await refrenceRepo.DelRefrence(id);
    Get.back();
    await getAllRefrence();
  }

  Future<void> AddRefrence() async {
    await refrenceRepo.AddRefrence(Addrefrence.value);
  }

  Future<void> getAllrefreneAdmi() async {
    var data = await refrenceRepo.GeAllrefrenceAdmain();
    listAdmainrefrence.assignAll(data);
  }
}
