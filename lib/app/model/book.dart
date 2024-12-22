import 'dart:typed_data';

import 'book_type.dart';

class Book {
  int? id;
  String? bookName;
  bool? IsDeleted;
  Uint8List? bookImage;
  int? bookPrice;
  int? idBookType;
  BookType? bookType;
  Book(
      {this.id,
      this.bookName,
      this.bookImage,
      this.bookPrice,
      this.idBookType,
      this.bookType,
      this.IsDeleted});

  Book.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    IsDeleted = json['IsDeleted'];
    bookName = json['bookName'];
    bookImage = json['bookImage'] == null
        ? null
        : Uint8List.fromList(List<int>.from(json['bookImage']!));
    bookPrice = json['bookPrice'];
    idBookType = json['idBookType'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = <String, dynamic>{};
    json['IsDeleted'] = IsDeleted;
    json['bookName'] = bookName;
    json['image'] = bookImage == null ? null : Uint8List.fromList(bookImage!);
    json[' bookPrice'] = bookPrice;
    json['idBookType'] = idBookType;
    json[' bookType'] = bookType;
    return json;
  }
}
