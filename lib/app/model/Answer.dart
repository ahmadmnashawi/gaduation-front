import 'package:graduationproject/app/model/test.dart';

class Answer {
  int? id;
  String? answer;
  bool? CorrectAnswer;
  int? IdTest;
  Test? test;
  Answer({this.id, this.answer, this.IdTest, this.test, this.CorrectAnswer});

  Answer.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    CorrectAnswer = json['CorrectAnswer'];
    answer = json['answer '];
    IdTest = json[' IdTest '];
    test = json['test '];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = <String, dynamic>{};
    json['id'] = id ?? 0;
    json['correctAnswer'] = CorrectAnswer;
    json['answer'] = answer;
    json['idTest'] = IdTest;
    return json;
  }
}
