import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:graduationproject/app/model/complaints.dart';
import 'package:graduationproject/modules/sheard/auth_service.dart';

import 'adapter/complaints_adapter.dart';

class ComplaintsRepository implements IComplaintsRepository {
  final _dio = Get.find<Dio>();

  @override
  Future<List<Complaint>> GetAllComplaint() async {
    var result =
        await _dio.get('https://localhost:7252/api/Complaint/GetComplaints');
    var list = <Complaint>[];
    for (var item in result.data) {
      list.add(Complaint.fromJson(item));
    }
    return list;
  }

  @override
  Future<List<Complaint>> GetcomplaintUser(int iduser) async {
    final id = Get.find<AuthService>().getDataFromStorage()!.Id;
    var result = await _dio.get(
        'https://localhost:7252/api/Complaint/GetUserComplaints?IdUser=$id');
    var list = <Complaint>[];
    for (var item in result.data) {
      list.add(Complaint.fromJson(item));
    }
    return list;
  }

  @override
  Future<bool> Putcomplaints(Complaint c) async {
    var result = await _dio.post(
        'https://localhost:7252/api/Complaint/AddComplaint',
        data: c.toJson());
    if (result.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  }

  @override
  Future<bool> Updatecomplaint(Complaint c) async {
    var result = await _dio.put('https://localhost:7252/api/Complaint/Put',
        data: c.toJson());
    if (result.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  }
}
