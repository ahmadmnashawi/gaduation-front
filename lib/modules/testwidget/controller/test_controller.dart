import 'package:get/get.dart';
import 'package:graduationproject/app/model/Answer.dart';
import 'package:graduationproject/modules/groups/data/group_repository.dart';

import '../../../app/model/content.dart';
import '../../../app/model/test.dart';
import '../../../app/model/testDto.dart';
import '../data/test_repositry.dart';
import '../view/question.dart';

class TestController extends GetxController {
  var selectedvalue = "".obs;
  var object = Question('', '', '', '', '');
  var AllQustion = <Question>[].obs;
  var correctvalue = ''.obs;
  final selectContent = Content().obs;
  var result = 0.obs;
  final idtest = 0.obs;

  final testRepo = TestRepository();
  final Addtest = Test().obs;
  final ListTestContent = <Content>[];
  final contents = <Content>[].obs;
  final ListTestByContent = <TestDto>[].obs;
  final ListCorrectvalue = <String>[];
  final nowTest = Test().obs;
  final numberQustion = 4.obs;
  final type = ''.obs;
  final answer1 = Answer().obs;
  final answer2 = Answer().obs;
  final answer3 = Answer().obs;
  final answer4 = Answer().obs;
  final idTest = 0.obs;

  var AllArabic = <Question>[].obs;
  var SportList = <Question>[].obs;
  var EnglishList = <Question>[].obs;
  var scienceList = <Question>[].obs;
  final newTest = Test().obs;
  final Listtsst = [
    TestDto(test: Test(test: 'It Test ')),
    TestDto(test: Test(test: 'Scenice Test')),
    TestDto(test: Test(test: 'English Test')),
    TestDto(test: Test(test: 'Sport Test')),
  ].obs;
  @override
  void onInit() {
    super.onInit();
    getContent();
    getAllTestKind();
    fullInfo();
    // getUser();
  }

  void test() {
    AllQustion.clear();
    switch (type.value) {
      case 'It Test ':
        fullInfo();
        Get.to(QuestionPageView());
        break;
      case 'Scenice Test':
        science();
        Get.to(QuestionPageView());
        break;
      case 'English Test':
        Englisg();
        Get.to(QuestionPageView());
        break;
      case 'Sport Test':
        Sport();
        Get.to(QuestionPageView());
        break;
      default:
        Get.to(QuestionPageView());
        break;
    }
  }

  void fullInfo() {
    AllQustion.add(
      Question('which Memory is the basic in java ?', "Heap", "Immortal", "LTM",
          "Heap"),
    );
    AllQustion.add(
      Question('What Is A Nibble ?', "Is A 4bits", "Is A 4bits", "Is A 16bits",
          "Is A 12bits"),
    );
    AllQustion.add(
      Question('What Is Temporary Memory ?', "Buffer", "RAM", "Buffer", "DROM"),
    );
    AllQustion.add(
      Question('Wireless Communication Technologies ?', "ZigBee", "IEEE", "LAN",
          "ZigBee"),
    );
  }

  void Sport() {
    AllQustion.add(
      Question('When Was The Sport Invented ?', "70000bc ", "80000bc",
          "70000bc ", "50000bc"),
    );
    AllQustion.add(
      Question('What Is The First Sport ?', "wrestling ", "wrestling",
          "football", "bascketboll"),
    );
    AllQustion.add(
      Question('Which Country Invented Sports?', "Graeece ", "Aleppo",
          "Graeece ", "China"),
    );
    AllQustion.add(
      Question('What Is The Sport That Is Considered King Of Sports ?',
          "football ", "football", "volley ball ", "Swmming"),
    );
  }

  void Englisg() {
    AllQustion.add(
      Question('i do not like her new film at all .', "do not you? ",
          "does not you?", " did not you ? ", "do not you?"),
    );
    AllQustion.add(
      Question('he can not drive  .', "can not he? ", "can he?",
          " can not he? ", "could not he?"),
    );
    AllQustion.add(
      Question(' i went to that new restaurant last night .', "did you ",
          "do you", " did you ", "dose you"),
    );
    AllQustion.add(
      Question(' i think i am going to stay at home this weekend.', "are you ",
          "are you", " do you ", "going you"),
    );
  }

  void science() {
    AllQustion.add(
      Question(' How Many Bones Are In The Human Boday?', "206", "204", " 206 ",
          "205"),
    );
    AllQustion.add(
      Question(' Humans and chimpanzees share roughly how much DNA?',
          "98 per cent", "98 per cent", " 99 per cent", "100 per cent"),
    );
    AllQustion.add(
      Question(' Which is the main gas that makes up the Earths atmosphere?',
          "N2", "H2", " O2", "N2"),
    );
    AllQustion.add(
      Question(' What is the biggest planet in our solar system?', "Jupiter",
          "Uranus", " Jupiter", "Earth"),
    );
  }

  Future<void> getContent() async {
    var data = await GroupRepository().GetAllContent();
    contents.assignAll(data);
    selectContent.value = contents.first;
  }

  Future<void> getAllTestKind() async {
    var data = await testRepo.GetTestsContent();
    ListTestContent.assignAll(data);
  }

  Future<void> getTestForContent(int idcontent) async {
    var data = await testRepo.GetTestsForContent(idcontent);
    ListTestByContent.assignAll(data);
    numberQustion.value = ListTestByContent.length;
    //nowTest.value=data!;
  }

  Future<void> addQution(Test t) async {
    if (t.IdContent == null || t.IdContent == 0) t.IdContent = 1;
    var res = await testRepo.AddQution(t);
    if (res) {
      Get.back();
    }
  }

  Future<void> addAllQution() async {
    // await addQution(nowTest.value);

    // var idTest = await GetId(nowTest.value.test!);

    // answer1.value.IdTest = idTest;
    // await addAnswer(answer1.value);
    // answer2.value.IdTest = idTest;
    // await addAnswer(answer2.value);
    // answer3.value.IdTest = idTest;
    // await addAnswer(answer3.value);
    // answer4.value.IdTest = idTest;
    // await addAnswer(answer4.value);

    print("DataAdded".tr);
    //  await getData();
    Get.back();
    AllQustion.add(Question(nowTest.value.test!, answer1.value.answer!,
        answer2.value.answer!, answer3.value.answer!, answer4.value.answer!));
  }

  Future<void> addAnswer(Answer a) async {
    await testRepo.AddAnswer(a);
  }

  Future<int> GetId(String test) async {
    var res = await testRepo.GetIdTest(test);
    return res ?? 0;
  }
}
