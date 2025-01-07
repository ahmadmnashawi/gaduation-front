import 'dart:async';

import 'package:get/get.dart';

import '../../../../../sheard/auth_service.dart';
import '../../../../controller/menu_game_controller.dart';

class LetterController extends GetxController {
  Timer? _timer;
  int remainingSecond = 1;
  final widget = MenuGameController();
  final time = '00.00'.obs;
  var letters = <String>[''].obs;
  final game1Level = 1.obs;
  final empty = [].obs;
  final auth = Get.find<AuthService>();
  final wordLevel1 = [
    ["شبع", "بشع", "عشب", "شعب"],
    ['قالب', "قلاب", "اقبل", 'قابل'],
    ['ملح', "لحم", "حمل", "حلم", "محل"],
  ].obs;
  final wordLevel2 = [
    ["عاقب", "عقاب", "بقاع"],
    ["مودع", "موعد", "عمود", "دموع"],
    ["مرج", "رجم", "جمر", "جرم"],
  ].obs;
  final wordLevel3 = [
    ["مضغ", "غرض", "غمر", "مرض", "ضمر"],
    [
      "بحر",
      "حرم",
      "حرب",
      "حبر",
      "رحم",
      "رحب",
      "مربح",
      "رمح",
      "ربح",
    ],
    ["روح", "حور", "حرج", "جوارح", "جوار", "جرح", "حجر"],
  ].obs;
  final letterLevel1 = [
    ['ع', 'ب', 'ش'],
    ['ل', 'ب', 'ا', 'ق'],
    ['ل', 'ح', 'م']
  ].obs;
  final letterLevel2 = [
    ['ع', 'ق', 'ا', 'ب'],
    ['ع', 'و', 'د', 'م'],
    ['ج', 'م', 'ر']
  ].obs;
  final letterLevel3 = [
    ['ر', 'ض', 'غ', 'م'],
    ['ر', 'ح', 'ب', 'م'],
    ['ر', 'ح', 'و', 'ج', 'ا']
  ].obs;

  @override
  void onClose() {
    if (_timer != null) {
      _timer!.cancel();
    }
    super.onClose();
    // var guser =
    //     auth.getGameUser()!.where((element) => element.IdGame == 1).first;
    // guser.Score = score.value;
    // auth.updateUserGame(guser);
  }

  Future<void> saveScore(int score, int level) async {
    var guser =
        auth.getGameUser()!.where((element) => element.IdGame == 1).first;

    guser.Score = score;
    guser.userLevel = level.toString();
    var result = await auth.updateUserGame(guser);
    if (result) {
      await Get.find<MenuGameController>().getAllGame();
    }
  }

  void initTime() {
    _starTimer(50);
  }

  void initLetter() {
    initTime();
    letters.clear();
    empty.clear();
  }

  void _starTimer(int seconds) {
    const duration = Duration(seconds: 1);
    remainingSecond = seconds;
    _timer = Timer.periodic(duration, (Timer timer) {
      if (remainingSecond == 0) {
        timer.cancel();
      } else {
        int minutes = (remainingSecond ~/ 60);
        int seconds = (remainingSecond % 60);
        time.value =
            '${minutes.toString().padLeft(2, '0')}:${seconds.toString().padLeft(2, '0')}';
        remainingSecond--;
      }
    });
  }
}
