import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:graduationproject/app/model/refrence.dart';

import '../../../app/model/content.dart';
import '../../../app/model/refrenceDto.dart';
import 'adapter/refrence_adapter.dart';

class RefrenceRepository implements IRefrenceRepository {
  final _dio = Get.find<Dio>();

  @override
  Future<List<Reference>> GetAllRefrence() async {
    var result =
        await _dio.get('https://localhost:7252/api/Reference/GetReferences');
    var list = <Reference>[];
    for (var item in result.data) {
      ////////question
      list.add(Reference.fromJson(item));
    }
    return list;
  }

  @override
  Future<List<Reference>> GetRefrencelink(int id) async {
    var result = await _dio.get(
        'https://localhost:7252/api/Reference/GetReferenceLink',
        queryParameters: {'id': id});
    var list = <Reference>[];
    for (var item in result.data) {
      list.add(Reference.fromJson(item));
    }
    return list;
  }

  @override
  Future<bool> DelRefrence(Reference reference) async {
    var result = await _dio.delete('https://localhost:7192/api/Reference',
        data: reference.toJson());
    return result.statusCode == 200;
  }

  @override
  Future<bool> AddRefrence(Reference reference) async {
    var result = await _dio.post(
        'https://localhost:7252/api/Reference/AddReference',
        data: reference.toJson());
    return result.statusCode == 200;
  }

  @override
  Future<List<RefrenceDto>> GeAllrefrenceAdmain() async {
    var result = await _dio.get(
      'https://localhost:7252/api/Reference/GetReferenceLink/',
    );
    var list = <RefrenceDto>[];
    for (var item in result.data) {
      list.add(RefrenceDto.fromJson(item));
    }
    return list;
  }

  @override
  Future<List<Content>> GetARefrenceConternt() async {
    var result = await _dio.get(
      'https://localhost:7252/api/Reference/GetReferenceContent',
    );
    var list = <Content>[];
    for (var item in result.data) {
      list.add(Content.fromJson(item));
    }
    return list;
  }
}
