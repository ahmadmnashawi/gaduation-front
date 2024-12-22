import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:graduationproject/app/model/Answer.dart';

import '../../../app/model/content.dart';
import '../../../app/model/test.dart';
import '../../../app/model/testDto.dart';
import 'adapter/test_adapter.dart';

class TestRepository implements ITestRepository {
  final _dio = Get.find<Dio>();
  @override
  Future<List<Content>> GetTestsContent() async {
    var result =
        await _dio.get('https://localhost:7252/api/Test/GetTestContent');
    var list = <Content>[];
    for (var item in result.data) {
      list.add(Content.fromJson(item));
    }
    return list;
  }

  @override
  Future<List<TestDto>> GetTestsForContent(int idcontent) async {
    var result = await _dio.get(
        'https://localhost:7252/api/Test/GetTestByContent?IdContent=$idcontent');
    var list = <TestDto>[];
    for (var item in result.data) {
      list.add(TestDto.fromJson(item));
    }
    return list;
  }

  @override
  Future<bool> AddAnswer(Answer a) async {
    var result =
        await _dio.post('https://localhost:7252/api/Answer', data: a.toJson());
    return result.statusCode == 200;
  }

  @override
  Future<bool> AddQution(Test test) async {
    var result = await _dio.post('https://localhost:7252/api/Test/AddTest',
        data: test.toJson());
    return result.statusCode == 200;
  }

  @override
  Future<int?> GetIdTest(String test) async {
    var result = await _dio.get(
      'https://localhost:7252/api/Test/GetTestId?test=$test',
    );
    return int.parse(result.data.toString());
  }

  // @override
  // Future<Test?> GetTest(int id) async{
  //     var result = await _dio.get('https://localhost:7252/api/Test/$id',);
  //   if (result.statusCode == 200) {
  //     var data = Test.fromJson(result.data as Map<String, dynamic>);
  //     return data;
  //   } else {
  //     return null;
  //   }
  // }

  // @override
  // Future<bool> DelRefrence(Reference reference) async{
  //   var result = await _dio.delete(
  //    'https://localhost:7192/api/Reference',
  //   data: reference.toJson());
  //   return result.statusCode == 200;
  // }

  // @override
  // Future<bool> AddRefrence(Reference reference)async {
  //  var result = await _dio.post('https://localhost:7252/api/Reference/AddReference',
  //       data:  reference.toJson());
  //   return result.statusCode == 200;
  // }
}
