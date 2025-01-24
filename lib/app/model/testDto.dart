import 'package:graduationproject/app/model/test.dart';

import 'Answer.dart';

class TestDto {
  Test? test;
  List<Answer>? answers = [];
  TestDto({this.test, this.answers});

  TestDto.fromJson(Map<String, dynamic> json) {
    test = Test.fromJson(json['test'] as Map<String, dynamic>);

    for (var item in (json['answers'] as List)) {
      var value = Answer.fromJson(item as Map<String, dynamic>);
      answers!.add(value);
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = new Map<String, dynamic>();
    json['test'] = test;
    json['answers'] = answers;

    return json;
  }
}
