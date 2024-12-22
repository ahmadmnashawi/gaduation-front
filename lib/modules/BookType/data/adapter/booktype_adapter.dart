import 'package:graduationproject/app/model/book_type.dart';

abstract class IBookTypeRepository {
  Future<List<BookType>> GetAllBookType();
  Future<bool> AddBookType(BookType book);
  Future<bool> DelBookType(BookType book);
}
