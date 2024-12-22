import 'content.dart';

class Test {
  int? Id;
  String? test;
  int? IdContent;
  Content? content;
  Test({
    this.Id,
    this.test,
    this.IdContent,
    this.content,
  });

  Test.fromJson(Map<String, dynamic> json) {
    Id = json['id'];
    test = json['test'];
    IdContent = json['IdContent'];
    content = json['content'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = <String, dynamic>{};
    json['id'] = Id ?? 0;
    json['test'] = test;
    json['idContent'] = IdContent;

    return json;
  }
}
