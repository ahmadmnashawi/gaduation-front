import 'dart:async';

import 'package:get/get.dart';

import '../../../../../sheard/auth_service.dart';
import '../../../../controller/menu_game_controller.dart';

class SplashScreencontroller extends GetxController {
  var allWord = <String>[].obs;
  int remanningsecond = 1;
  final time = '00.00'.obs;
  Timer? _timer;

  var score = 0.obs;
  final auth = Get.find<AuthService>();
  final word1Level = [
    [
      "ابنية",
      "مدينة",
    ],
    [
      "شعلة",
      "ضوء",
      'فكرة',
    ],
    [
      'شخص',
      "كروب",
      "فكرة",
      "اعضاء",
    ]
  ].obs;
  final image1Level = [
    'assets/images/7.png',
    'assets/images/hidd.png',
    'assets/images/group1.png',
  ].obs;
  final word2Level = [
    [
      "فريق",
      "فن",
      "لوحة",
      "الوان",
    ],
    [
      'مشاكل',
      'اصلاحات',
      'ضبط',
      'مصلح',
    ],
    [
      'متحف',
      'ديناصور',
      'صحفي',
      'اثار',
    ]
  ].obs;
  final image2Level = [
    'assets/images/intro4.png',
    'assets/images/sett.png',
    'assets/images/history.gif',
  ].obs;
  final word3Level = [
    [
      'دماغ',
      'ناس',
      'معلوماتية',
      'طاقة',
    ],
    [
      'حسابات',
      'طاقة',
      'معادلات',
      'تفاعلات',
      'مخبر',
      'استاذ',
      'كيمياء',
      'علوم',
    ],
    [
      'علوم',
      'فيزياء',
      'رياضيات',
      'عربي',
      'معارف العلوم',
      'موسيقا',
      'كيمياء',
      'رسم',
      'تمثيل'
    ]
  ].obs;
  final image3Level = [
    'assets/images/9.png',
    'assets/images/chm.png',
    'assets/images/intro.png',
  ].obs;
  final emptyList = [].obs;
  final indexLevel = 1.obs;

  List<String> letters = [
    'ح',
    'ج',
    'ث',
    'ت',
    'ب',
    'ا',
    'س',
    'ز',
    'ر',
    'ذ',
    'د',
    'خ',
    'ع',
    'ظ',
    'ط',
    'ض',
    'ص',
    'ش',
    'م',
    'ل',
    'ك',
    'ق',
    'ف',
    'غ',
    'ة',
    'ء',
    'ي',
    'ه',
    'و',
    'ن',
  ];
  RxDouble width = 50.0.obs;
  RxDouble hight = 50.0.obs;

  RxDouble mwidth = 0.0.obs;
  RxDouble mFontsize = 0.0.obs;

  RxDouble footerwidth = 100.0.obs;
  RxDouble footermargin = 100.0.obs;
  RxDouble footerFontersize = 0.0.obs;
  final widget = MenuGameController();
  @override
  void onInit() {
    super.onInit();
    score.value = 0;
    Future.delayed(const Duration(seconds: 2), () {
      width.value = 150.0;
      hight.value = 150.0;
    });

    Future.delayed(const Duration(seconds: 1), () {
      mwidth.value = 90;
      mFontsize.value = 100.0;
    });

    Future.delayed(const Duration(seconds: 1), () {
      footerwidth.value = 100.0;
      footerFontersize.value = 20;
      footermargin.value = 0;
    });
  }

  void initLetter() {
    _startimer(50);
    allWord.clear();
    emptyList.clear();
  }

  @override
  void onClose() {
    if (_timer != null) {
      _timer!.cancel();
    }
    super.onClose();
    // var guser =
    //     auth.getGameUser()!.where((element) => element.IdGame == 2).first;

    // guser.Score = score.value;
    // auth.updateUserGame(guser);
  }

  Future<void> saveScore(int score, int level) async {
    var guser =
        auth.getGameUser()!.where((element) => element.IdGame == 2).first;

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
