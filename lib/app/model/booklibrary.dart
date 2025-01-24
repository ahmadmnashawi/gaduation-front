import 'book.dart';
import 'library.dart';

class BookLibrary {
  int? Id;
  int? IdBook;
  Book? book;
  bool? IsDeleted;
  int? IdLibrary;
  Library? library;
  String? libraryAddress;
  BookLibrary({
    this.Id,
    this.IdBook,
    this.book,
    this.IdLibrary,
    this.library,
    this.libraryAddress,
  });

  BookLibrary.fromJson(Map<String, dynamic> json) {
    Id = json['id'];
    IdBook = json['idBook'];
    book = json['book'];
    IdLibrary = json['idLibrary'];
    library = json['library'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = <String, dynamic>{};
    json['id'] = Id ?? 0;
    json['idBook'] = IdBook ?? 0;
    json['idLibrary'] = IdLibrary;
    return json;
  }
}
