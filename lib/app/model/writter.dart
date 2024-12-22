class Writer {
  int? id;
  String? writerName;
  Writer({
    this.id,
    this.writerName,
  });

  Writer.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    writerName = json['writerName '];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = <String, dynamic>{};
    json['writerName'] = writerName;
    return json;
  }
}
