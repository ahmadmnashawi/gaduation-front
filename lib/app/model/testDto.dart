
import 'dart:typed_data';

import 'package:graduationproject/app/model/post.dart';
import 'package:graduationproject/app/model/test.dart';

import 'Answer.dart';
import 'comment.dart';
import 'content.dart';

class  TestDto {
 
   Test? test;
   List<Answer>? answers;
TestDto(
      {
      this.test,
   
      });

TestDto.fromJson(Map<String, dynamic> json) {
   test = json['test'];
    answers = json['answers'];
 
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = new Map<String, dynamic>();
    json['test'] = test;
    json['answers'] =answers;
   
    return json;
  }
}
