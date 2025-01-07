import 'dart:async';

import 'package:get/get.dart';

import '../../../../../sheard/auth_service.dart';
import '../../../../controller/menu_game_controller.dart';

class MathController extends GetxController {
  Timer? _timer;
  var answer = 0.obs;
  var answer2 = 0.obs;
  var answer3 = 0.obs;
  int remanningsecond = 1;
  final time = '00.00'.obs;
  var result = 0.obs;
  var result2 = 100.obs;
  var score = 0.obs;
  var score2 = 0.obs;
  var score3 = 0.obs;
  var result3 = 200.obs;
  final auth = Get.find<AuthService>();
  final indexLevel = 1.obs;
  final word1Level = [
    '  ما هو  العدد التالي للارقام التاليه ؟\n 1-5-9-13-19 ',
    'ما هي الأعداد الثلاثة المتتالية التي سوف \nيكون مجموعهم 36؟ ',
    'ما هما العددان الذين حاصل ضربهما  \nيكون 20 ومجموعهم 15 '
  ].obs;
  final answer1Level = [
    ['21', '20', '22'],
    ['11/11/12', '11/12/12', '11/12/13'],
    ['2,1', '2,10', '2,5']
  ].obs;
  final rightAnswer = ['21', '11/12/13', '2,10'];
  final word2Level = [
    'ما هو العدد الذي ضربه وقسمته وجمعه \n مع نفسه 36 ؟',
    'تجمع 8 اشخاص وقام كل واحد منهم بمافحه\nالاخر كم عدد المصافحات ؟',
    'اذا كان عمر الفتاه 25 وعمر الام 45 متى يكون\nعمر الام ضعف عمر الفتاه؟'
  ].obs;
  final answer2Level = [
    ['5', '6', '4'],
    ['24', '26', '28'],
    ['بعد 5 سنوات', 'بعد 7 سنوات', 'بعد  10 سنوات']
  ].obs;
  final right2Answer = [
    '5',
    '28',
    'بعد 5 سنوات',
  ];
  final word3Level = [
    'اذكر العمليه الحسابيه التي نحصل فيها على \n الرقم 10 من تكرار 9 ثلاث مرات؟',
    'توفي رجل وترك لأولاده الثلاثة 17 جمل نصفهم الأول \n وثلثهم الثاني وتسعهم للثالث ، فكيف\nيتم تقسيم الجمال بين الأولاد ؟',
    'شجره تحوي عدد من الطيور فوقها وتحتها,فاذا\nفاذا طير من فوق لتحت اصبح عدد الطيور\nالموجودة فوق نصف عددالموجودة تحت ,\nفكم طير يوجد فوق وتحت الشجرة ؟'
  ].obs;
  final answer3Level = [
    ['(9+9)%9', '(9/9)+9', '(9*9)/9'],
    [
      'الاول 6,الثاني 2,الثالث 9',
      'الاول 2, الثاني 9, الثالث 6',
      'الاول 9,الثاني 6,الثالث 2'
    ],
    ['تحت 5,فوق 6', 'تحت 7, فوق 5', 'تحت 8,فوق 4']
  ].obs;
  final right3Answer = [
    '(9/9)+9',
    'الاول 9,الثاني 6,الثالث 2',
    'تحت 7, فوق 5',
  ];
  @override
  void onClose() {
    if (_timer != null) {
      _timer!.cancel();
    }
    super.onClose();
    // var guser =
    //     auth.getGameUser()!.where((element) => element.IdGame == 3).first;
    // guser.Score = score.value;
    // auth.updateUserGame(guser);
  }

  void initTime() {
    _startimer(70);
  }

  Future<void> saveScore(int score, int level) async {
    var guser =
        auth.getGameUser()!.where((element) => element.IdGame == 3).first;

    guser.Score = score;
    guser.userLevel = level.toString();
    var result = await auth.updateUserGame(guser);
    if (result) {
      await Get.find<MenuGameController>().getAllGame();
    }
  }

  void _startimer(int seconds) {
    const duration = Duration(seconds: 1);
    remanningsecond = seconds;
    _timer = Timer.periodic(duration, (Timer timer) {
      if (remanningsecond == 0) {
        timer.cancel();
      } else {
        int minutes = (remanningsecond ~/ 60);
        int seconds = (remanningsecond % 60);
        time.value =
            '${minutes.toString().padLeft(2, '0')}:${seconds.toString().padLeft(2, '0')}';
        remanningsecond--;
      }
    });
  }
}
