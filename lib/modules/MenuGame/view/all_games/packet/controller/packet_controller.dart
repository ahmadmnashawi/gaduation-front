import 'dart:math';

import 'package:get/get.dart';

import '../../../../../sheard/auth_service.dart';
import '../../../../controller/menu_game_controller.dart';

class PacketController extends GetxController {
  var reminning = 0.obs;
  var numberlevel = 1.obs;
  final isMessage = false.obs;
  final cardsSucc = <Packet>[].obs;
  final openCards = <Packet>[].obs;
  final listpacket = <Packet>[].obs;
  final auth = Get.find<AuthService>();
  @override
  void onInit() {
    super.onInit();
    firstLevel();
  }

  void justOpenOnce() {
    for (int i = 1; i < 4; i++) {
      for (var j = 0; j < 2; j++) {
        cardsSucc.add(Packet(
          photo: 'assets/images/$i.png',
          hidd: 'assets/images/hidd.png',
          index: i,
        ));
      }
    }
  }

  void firstLevel() {
    listpacket.clear();
    openCards.clear();
    cardsSucc.clear();
    for (int i = 1; i < 4; i++) {
      for (var j = 0; j < 2; j++) {
        listpacket.add(Packet(
          photo: 'assets/images/$i.png',
          hidd: 'assets/images/hidd.png',
          index: i,
        ));
      }
    }

    listpacket.shuffle(Random(10));
  }

  void secandLevel() {
    listpacket.clear();
    openCards.clear();
    cardsSucc.clear();
    for (int i = 1; i < 8; i++) {
      for (var j = 0; j < 2; j++) {
        listpacket.add(Packet(
          photo: 'assets/images/$i.png',
          hidd: 'assets/images/hidd.png',
          index: i,
        ));
      }
    }
    listpacket.shuffle(Random(10));
  }

  void therdLevel() {
    listpacket.clear();
    openCards.clear();
    cardsSucc.clear();
    for (int i = 1; i < 12; i++) {
      for (var j = 0; j < 2; j++) {
        listpacket.add(Packet(
          photo: 'assets/images/$i.png',
          hidd: 'assets/images/hidd.png',
          index: i,
        ));
      }
    }
    listpacket.shuffle(Random(10));
  }

  Future<void> saveScore(int score, int level) async {
    var guser =
        auth.getGameUser()!.where((element) => element.IdGame == 5).first;

    guser.Score = score;
    guser.userLevel = level.toString();
    var result = await auth.updateUserGame(guser);
    if (result) {
      await Get.find<MenuGameController>().getAllGame();
    }
  }
}

class Packet {
  String? photo;
  String? hidd;
  int? index;
  Packet({this.photo, this.hidd, this.index});
}
