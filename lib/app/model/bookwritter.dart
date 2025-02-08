import 'package:graduationproject/app/model/writter.dart';

import 'book.dart';

class BookWriter {
  int? Id;
  int? IdBook;
  Book? book;
  int? IdWriter;
  Writer? writer;
  BookWriter({
    this.Id,
    this.IdBook,
    this.book,
    this.IdWriter,
    this.writer,
  });

  BookWriter.fromJson(Map<String, dynamic> json) {
    Id = json['id'];
    IdBook = json['idBook'];
    book = json['book'] == null
        ? null
        : Book.fromJson(json['book'] as Map<String, dynamic>);
    IdWriter = json['idWriter'];
    writer = Writer.fromJson(json['writer'] as Map<String, dynamic>);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = new Map<String, dynamic>();
    json['id'] = Id ?? 0;
    json['idBook'] = IdBook;
    json['idWriter'] = IdWriter;
    json['isDeleted'] = false;

    return json;
  }
}
