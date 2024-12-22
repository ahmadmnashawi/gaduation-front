import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:graduationproject/app/model/book_type.dart';

import 'adapter/booktype_adapter.dart';

class BookTypeRepository implements IBookTypeRepository {
  final _dio = Get.find<Dio>();

  @override
  Future<List<BookType>> GetAllBookType() async {
    var result = await _dio.get('https://localhost:7252/api/BookType');
    var list = <BookType>[];
    for (var item in result.data) {
      list.add(BookType.fromJson(item));
    }
    return list;
  }

  @override
  Future<bool> AddBookType(BookType book) async {
    var result = await _dio.post('https://localhost:7252/api/BookType',
        data: book.toJson());
    return result.statusCode == 200;
  }

  @override
  Future<bool> DelBookType(BookType book) async {
    var result = await _dio.delete(
      'https://localhost:7252/api/BookType?id=${book.id}',
    );
    return result.statusCode == 200;
  }
}
