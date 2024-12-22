import 'dart:convert';
import 'dart:core';

import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:graduationproject/app/model/user.dart';

import '../../api/storage/storge_service.dart';
import '../../app/model/accessiblity_logIn.dart';
import '../../app/model/game_user.dart';

const String KeyData = "AuthData";

class AuthService {
  final _dio = Get.find<Dio>();
  final stroge = Get.find<StorageService>();
  bool isAuth() => stroge.containsKey(KeyData);
  User? getDataFromStorage() {
    if (stroge.containsKey(KeyData)) {
      var data = jsonDecode(stroge.getData(KeyData)!) as dynamic;
      return User.fromJson(data as Map<String, dynamic>);
    }
    return null;
  }

  void SaveGameUser(List<GameUser> gameUser) {
    stroge.saveData('game', encodeGame(gameUser));
  }

  List<GameUser>? getGameUser() {
    if (stroge.containsKey('game')) {
      return decodeDataGame(stroge.getData('game')!);
    }
    return [];
  }

  bool isAdmin() => stroge.containsKey('isAdmin');

  Future<User?> logIn(String email, String password) async {
    var result = await _dio.get('https://localhost:7252/api/User/SignIn',
        queryParameters: {"email": email, "password": password});
    print(result.data);
    if (result.statusCode == 200 && result.data is! List<dynamic>) {
      var data = User.fromJson(result.data as Map<String, dynamic>);
      stroge.saveData(KeyData, jsonEncode(data.toJson()));
      var access = await userAccessibilites(data.Id!);
      if (access!.isEmpty && data.Name == 'Admin') {
        stroge.saveData('isAdmin', 'true');
      }

      return data;
    }
    return null;
  }

  String encode(List<AccessiblityLogIn> object) => json.encode(
        object.map<Map<String, dynamic>>((e) => e.toJson()).toList(),
      );

  static List<AccessiblityLogIn> decodeData(String e) =>
      (json.decode(e) as List<dynamic>)
          .map<AccessiblityLogIn>((item) => AccessiblityLogIn.fromJson(item))
          .toList();
  String encodeGame(List<GameUser> object) => json.encode(
        object.map<Map<String, dynamic>>((e) => e.toJson()).toList(),
      );

  static List<GameUser> decodeDataGame(String e) =>
      (json.decode(e) as List<dynamic>)
          .map<GameUser>((item) => GameUser.fromJson(item))
          .toList();
  Future<List<AccessiblityLogIn>?> userAccessibilites(int userId) async {
    var list = <AccessiblityLogIn>[];
    var result = await _dio.get(
      'https://localhost:7252/api/UserAccessibility/GetUserAccessibilites?IdUser=$userId',
    );
    print(result.data);
    if (result.statusCode == 200) {
      for (var item in result.data) {
        list.add(AccessiblityLogIn.fromJson(item));
      }
      stroge.saveData('userAccess', encode(list));
      return list;
    }
    return null;
  }

  List<AccessiblityLogIn> getUserLogInAccess() {
    var data = decodeData(stroge.getData('userAccess')!);
    return data;
  }

  Future<bool> signUp(User object) async {
    var result = await _dio.post('https://localhost:7252/api/User/AddUser',
        data: object.toJson());
    if (result.statusCode == 200) {
      var data = await logIn(object.Email!, object.Password!);
      stroge.saveData(KeyData, jsonEncode(data!.toJson()));
      return true;
    }
    return false;
  }

  Future<bool> updateUserGame(GameUser userGame) async {
    var result = await _dio.put(
        'https://localhost:7252/api/GameUser/${userGame.Id}',
        data: userGame.toJson());
    if (result.statusCode == 200) {
      var data = getGameUser();
      stroge.deleteDataByKey('game');
      SaveGameUser(data!);
      return true;
    }
    return false;
  }
}
