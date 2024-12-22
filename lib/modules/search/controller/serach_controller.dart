import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:graduationproject/app/model/follow.dart';
import 'package:graduationproject/app/model/group.dart';
import 'package:graduationproject/app/model/user_Group.dart';
import 'package:graduationproject/modules/sheard/auth_service.dart';

import '../../../app/model/user.dart';

class SearchPageContrller extends GetxController {
  final _dio = Get.find<Dio>();
  final listSearch = <GetSearch>[].obs;
  final isFolllow = false.obs;
  final isFolllowGroup = false.obs;
  final typeSearch = [
    'All',
    'User',
    'Groups',
    'Content',
    'Library',
    'Complaint',
    'Referance',
    'Book',
    'Writer'
  ].obs;
  final selectType = 'All'.obs;
  Future<void> searchBy(String text) async {
    if (text.isEmpty) return;
    listSearch.clear();

    switch (selectType.value) {
      case 'All':
        await searchAll(text);
        break;
      case 'User':
        await searchUser(text);
        break;
      case 'Groups':
        await searchgroup(text);
        break;
      case 'Content':
        await searchcontent(text);
        break;

      case 'Library':
        await searchLib(text);
        break;
      case 'Complaint':
        await searchComp(text);
        break;
      case 'Referance':
        await searchRef(text);
        break;
      case 'Book':
        await searchBook(text);
        break;
      case 'Writer':
        await searchwriter(text);
        break;
      default:
    }
  }

  Future<void> getData(int id, String elemant) async {
    if (elemant == 'user') {
      isFolllow.value = await getUserFollow(id);
    } else if (elemant == 'group') {
      isFolllowGroup.value = await getUserGroup(id);
    }
  }

  Future<void> searchAll(String text) async {
    final id = Get.find<AuthService>().getDataFromStorage()!.Id;
    var result = await _dio.get(
      'https://localhost:7252/api/Search/Search?search=$text&IdUser=$id',
    );
    var list = <GetSearch>[];
    for (var element in result.data) {
      for (var element1 in element['search']) {
        list.add(GetSearch(element1['id'], element1[getName(element['type'])],
            element1[gettitle(element['type'])], element['type']));
      }
    }
    listSearch.assignAll(list);
  }

  Future<void> searchUser(String text) async {
    var result = await _dio.get(
      'https://localhost:7252/api/Search/SearchUsers?search=$text',
    );
    var list = <GetSearch>[];

    for (var element1 in result.data['search']) {
      list.add(GetSearch(element1['id'], element1[getName(result.data['type'])],
          element1[gettitle(result.data['type'])], result.data['type'],
          user: User.fromJson(element1)));
    }

    listSearch.assignAll(list);
  }

  Future<void> searchgroup(String text) async {
    var result = await _dio.get(
      'https://localhost:7252/api/Search/SearchGroups?search=$text',
    );
    var list = <GetSearch>[];

    for (var element1 in result.data['search']) {
      list.add(GetSearch(element1['id'], element1[getName(result.data['type'])],
          element1[gettitle(result.data['type'])], result.data['type'],
          group: Group.fromJson(element1)));
    }
    listSearch.assignAll(list);
  }

  Future<void> searchcontent(String text) async {
    var result = await _dio.get(
      'https://localhost:7252/api/Search/SearchContent?search=$text',
    );
    var list = <GetSearch>[];

    for (var element1 in result.data['search']) {
      list.add(GetSearch(element1['id'], element1[getName(result.data['type'])],
          element1[gettitle(result.data['type'])], result.data['type']));
    }
    listSearch.assignAll(list);
  }

  Future<void> searchLib(String text) async {
    var result = await _dio.get(
      'https://localhost:7252/api/Search/SearchLibrary?search=$text',
    );
    var list = <GetSearch>[];

    for (var element1 in result.data['search']) {
      list.add(GetSearch(element1['id'], element1[getName(result.data['type'])],
          element1[gettitle(result.data['type'])], result.data['type']));
    }
    listSearch.assignAll(list);
  }

  Future<void> searchComp(String text) async {
    final id = Get.find<AuthService>().getDataFromStorage()!.Id!;
    var result = await _dio.get(
      'https://localhost:7252/api/Search/SearchComplaint?search=$text&IdUser=$id',
    );
    var list = <GetSearch>[];

    for (var element1 in result.data['search']) {
      list.add(GetSearch(element1['id'], element1[getName(result.data['type'])],
          element1[gettitle(result.data['type'])], result.data['type']));
    }
    listSearch.assignAll(list);
  }

  Future<void> searchRef(String text) async {
    var result = await _dio.get(
      'https://localhost:7252/api/Search/SearchReferance?search=$text',
    );
    var list = <GetSearch>[];

    for (var element1 in result.data['search']) {
      list.add(GetSearch(element1['id'], element1[getName(result.data['type'])],
          element1[gettitle(result.data['type'])], result.data['type']));
    }
    listSearch.assignAll(list);
  }

  Future<void> searchBook(String text) async {
    var result = await _dio.get(
      'https://localhost:7252/api/Search/SearchBook?search=$text',
    );
    var list = <GetSearch>[];

    for (var element1 in result.data['search']) {
      list.add(GetSearch(element1['id'], element1[getName(result.data['type'])],
          element1[gettitle(result.data['type'])], result.data['type']));
    }
    listSearch.assignAll(list);
  }

  Future<void> searchwriter(String text) async {
    var result = await _dio.get(
      'https://localhost:7252/api/Search/SearchWriter?search=$text',
    );
    var list = <GetSearch>[];

    for (var element1 in result.data['search']) {
      list.add(GetSearch(element1['id'], element1[getName(result.data['type'])],
          element1[gettitle(result.data['type'])], result.data['type']));
    }
    listSearch.assignAll(list);
  }

  String getName(String type) {
    switch (type) {
      case 'user':
        return 'name';
      case 'group':
        return 'groupName';
      case 'referance':
        return 'referenceName';
      case 'library':
        return 'libraryName';
      case 'content':
        return 'typeName';
      case 'complaint':
        return 'complaint';
    }
    return '';
  }

  String gettitle(String type) {
    switch (type) {
      case 'user':
        return 'email';
      case 'group':
        return 'description';
      case 'refreance':
        return 'link';
      case 'library':
        return 'libraryAddress';
    }
    return '';
  }

  Future<bool> getUserGroup(int iduser) async {
    var myId = Get.find<AuthService>().getDataFromStorage()!.Id;
    var result = await _dio.get(
      'https://localhost:7252/api/UserGroup',
    );
    if (result.statusCode == 200) {
      var list = <UserGroup>[];
      if (result.statusCode == 200) {
        for (var item in result.data) {
          list.add(UserGroup.fromJson(item));
        }
      }
      return list.any(
          (element) => element.IdUser == myId && element.IdGroup == iduser);
    } else {
      return false;
    }
  }

  Future<bool> addUserGroup(int iduser) async {
    var myId = Get.find<AuthService>().getDataFromStorage()!.Id;
    var group = UserGroup(IdUser: myId, IdGroup: iduser);
    var result = await _dio.post(
      'https://localhost:7252/api/Follow',
      data: group.toJson(),
    );
    if (result.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  }

  Future<bool> deleteUserGroup(int iduser) async {
    var myId = Get.find<AuthService>().getDataFromStorage()!.Id;
    var group = UserGroup(IdUser: myId, IdGroup: iduser);
    var result = await _dio.post(
      'https://localhost:7252/api/Follow',
      data: group.toJson(),
    );
    if (result.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  }

  Future<bool> getUserFollow(int iduser) async {
    var myId = Get.find<AuthService>().getDataFromStorage()!.Id;
    var result = await _dio.get(
      'https://localhost:7252/api/Follow',
    );
    if (result.statusCode == 200) {
      var list = <Follow>[];
      if (result.statusCode == 200) {
        for (var item in result.data) {
          list.add(Follow.fromJson(item));
        }
      }
      return list.any((element) =>
          element.followedId == myId && element.followId == iduser);
    } else {
      return false;
    }
  }

  Future<bool> addUserFollow(int iduser) async {
    var myId = Get.find<AuthService>().getDataFromStorage()!.Id;
    var follow = Follow(followedId: myId, followId: iduser);
    var result = await _dio.post(
      'https://localhost:7252/api/Follow',
      data: follow.toJson(),
    );
    if (result.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  }

  Future<bool> deleteUserFollow(int iduser) async {
    var myId = Get.find<AuthService>().getDataFromStorage()!.Id;
    var follow = Follow(followedId: myId, followId: iduser);
    var result = await _dio.delete(
      'https://localhost:7252/api/Follow',
      data: follow.toJson(),
    );
    if (result.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  }
}

class GetSearch {
  int? id;
  String? name;
  String? title;
  String? type;
  User? user;
  Group? group;
  GetSearch(this.id, this.name, this.title, this.type, {this.group, this.user});
}
