import 'dart:convert';

import 'book.dart';

class BookDetailsDto {
  Book? book;
  String? Type;
  List<String>? writer;
  BookDetailsDto({
    this.book,
    this.Type,
    this.writer,
  });

  BookDetailsDto.fromJson(Map<String, dynamic> json) {
    book = json['book'] != null
        ? Book.fromJson(json['book'] as Map<String, dynamic>)
        : null;
    Type = json['type'];
    if (json['writers'] is String) {
      writer = List<String>.from(jsonDecode(json['writers']));
    } else if (json['writers'] is List) {
      writer = List<String>.from(json['writers']);
    } else {
      writer = []; // Handle unexpected data
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = new Map<String, dynamic>();
    json[' Type'] = Type;
    json[' book '] = book;
    json[' writer'] = writer;
    return json;
  }
}
