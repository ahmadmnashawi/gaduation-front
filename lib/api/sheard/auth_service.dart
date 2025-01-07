import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:get/get_core/get_core.dart';
import 'package:graduationproject/app/model/user.dart';

import '../../../api/storage/storge_service.dart';

// class AuthService {
//   final _dio = Get.find<Dio>();
//   final stroge = Get.find<StorageService>();

// Future<Object?> logIn(String email, String password) async {
//     var result = await _dio.get('https://localhost:7192/api/Auth/GetAuth',
//         queryParameters: {"email": email, "password": password});
//     print(result.data);
//     if (result.statusCode == 200) {
//           var data =
//               User.fromJson(result.data['data'] as Map<String, dynamic>);
//           stroge.saveData('AuthData', jsonEncode(data.toJson()));
//           return data;
//           }
// }}