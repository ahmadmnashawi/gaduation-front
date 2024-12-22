class Library {
  int? Id;
  String? libraryName;
  String? libraryAddress;
  Library({
    this.Id,
    this.libraryName,
    this.libraryAddress,
  });

  Library.fromJson(Map<String, dynamic> json) {
    Id = json['id'];
    libraryName = json['libraryName'];
    libraryAddress = json['libraryAddress'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = <String, dynamic>{};
    json['id'] = Id ?? 0;
    json['libraryName'] = libraryName;
    json['libraryAddress'] = libraryAddress;
    return json;
  }
}
