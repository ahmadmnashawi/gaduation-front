import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:graduationproject/app/model/content.dart';
import 'package:graduationproject/app/model/refrence.dart';
import 'package:graduationproject/app/model/user.dart';

import '../../../app/model/Accsessbuility.dart';
import '../../../app/model/group.dart';
import '../../../app/model/library.dart';
import '../../../app/model/test.dart';
import '../../../app/model/userAccsesbuility.dart';
import 'adapter/permisissin_adapter.dart';

class PremissionRepository implements IPremissionRepository {
  final _dio = Get.find<Dio>();

  @override
  Future<List<Accessibility>> GetPermission() async {
    var result = await _dio
        .get('https://localhost:7252/api/Accessibility/GetAccessibilities');

    print(result);
    var list = <Accessibility>[];
    for (var item in result.data) {
      list.add(Accessibility.fromJson(item));
    }
    return list;
  }

  Future<List<User>> getAllUser() async {
    var result = await _dio.get('https://localhost:7252/api/User/GetUsers');

    var list = <User>[];
    for (var item in result.data) {
      list.add(User.fromJson(item));
    }
    return list;
  }

  @override
  Future<List<Library>> getAllLibrary() async {
    var result =
        await _dio.get('https://localhost:7252/api/Library/GetLibraries');
    print(result);
    var list = <Library>[];
    for (var item in result.data) {
      list.add(Library.fromJson(item));
    }
    return list;
  }

  Future<List<Test>> getAllTest() async {
    var result = await _dio.get('https://localhost:7252/api/Test/GetTests');
    print(result);
    var list = <Test>[];
    for (var item in result.data) {
      list.add(Test.fromJson(item));
    }
    return list;
  }

  Future<List<Reference>> getAllRefr() async {
    var result =
        await _dio.get('https://localhost:7252/api/Reference/GetReferences');
    print(result);
    var list = <Reference>[];
    for (var item in result.data) {
      list.add(Reference.fromJson(item));
    }
    return list;
  }

  @override
  Future<List<Group>> GetAllGroup() async {
    var result = await _dio.get('https://localhost:7252/api/Group/GetGroups');
    print(result);
    var list = <Group>[];
    for (var item in result.data) {
      list.add(Group.fromJson(item));
    }
    return list;
  }

  @override
  Future<bool> AddContent(Content content) {
    // TODO: implement AddContent
    throw UnimplementedError();
  }

  @override
  Future<bool> DelContent(int id) {
    // TODO: implement DelContent
    throw UnimplementedError();
  }

  @override
  Future<List<UserAccessibility>> GetUserPermission() async {
    var result = await _dio.get(
      'https://localhost:7252/api/UserAccessibility/GetUserAccessibilities',
    );
    print(result);
    var list = <UserAccessibility>[];
    for (var item in result.data) {
      list.add(UserAccessibility.fromJson(item));
    }
    return list;
  }

  Future<List<UserAccessibility>> GetUserAllWithAllPermission(
      int iduser) async {
    var result = await _dio.get(
        'https://localhost:7252/api/UserAccessibility/GetUserAccessibilities',
        queryParameters: {'iduser': iduser});
    print(result);
    var list = <UserAccessibility>[];
    for (var item in result.data) {
      list.add(UserAccessibility.fromJson(item));
    }
    return list;
  }

  @override
  Future<List<User>> GetAllUser() async {
    var result = await _dio.get('https://localhost:7252/api/User/GetUsers');
    print(result);
    var list = <User>[];
    for (var item in result.data) {
      list.add(User.fromJson(item));
    }
    return list;
  }

  @override
  Future<bool> AddUserAccessibility(UserAccessibility user) async {
    var result = await _dio.post(
        'https://localhost:7252/api/UserAccessibility/AddUserAccessibility',
        data: user.toJson());
    return result.statusCode == 200;
  }

  Future<bool> UpdateUserAccessibility(UserAccessibility user) async {
    var result = await _dio.post(
        'https://localhost:7252/api/UserAccessibility/Put/${user.Id}',
        data: user.toJson());
    return result.statusCode == 200;
  }

  @override
  Future<bool> DelUserAccessibility(UserAccessibility user) async {
    var result = await _dio.post(
        'https://localhost:7252/api/UserAccessibility/Delete',
        data: user.toJson());
    return result.statusCode == 200;
  }
}
