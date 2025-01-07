import 'dart:typed_data';

import 'content.dart';

class Group {
  int? Id;
  String? groupName;
  String? Description;
  int? IdContent;
  Content? content;
  Uint8List? Image;
  String? imageOnline;
  bool? isDeleted;
  Group(
      {this.Id,
      this.Description,
      this.groupName,
      this.IdContent,
      this.imageOnline,
      this.content,
      this.isDeleted,
      this.Image});

  Group.fromJson(Map<String, dynamic> json) {
    Id = json['id'];
    imageOnline = json['imageOnline'];
    isDeleted = json['isDeleted'];
    groupName = json['groupName'];
    Description = json['description'];
    IdContent = json['idContent'];
    content = json['content'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = <String, dynamic>{};
    json['id'] = Id ?? 0;
    json['description'] = Description;
    json['groupName'] = groupName;
    json['idContent'] = IdContent;
    return json;
  }
}
