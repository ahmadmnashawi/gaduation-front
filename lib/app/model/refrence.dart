import 'content.dart';

class Reference {
  int? Id;
  String? referenceName;
  String? Link;
  int? IdContent;
  Content? content;
  Reference({
    this.Id,
    this.referenceName,
    this.Link,
    this.IdContent,
    this.content,
  });

  Reference.fromJson(Map<String, dynamic> json) {
    Id = json['id'];
    referenceName = json['referenceName'];
    Link = json['link'];
    IdContent = json['idContent'];
    content = json['content'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = <String, dynamic>{};
    json['id'] = Id ?? 0;
    json['referenceName'] = referenceName;
    json['link'] = Link;
    json['idContent'] = IdContent;

    return json;
  }
}
