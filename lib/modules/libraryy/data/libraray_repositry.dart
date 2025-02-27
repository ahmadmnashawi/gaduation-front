import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:graduationproject/app/model/BookDetalites.dart';
import 'package:graduationproject/app/model/book.dart';
import 'package:graduationproject/app/model/book_type.dart';
import 'package:graduationproject/app/model/bookwritter.dart';
import 'package:graduationproject/app/model/buy_book.dart';
import 'package:graduationproject/app/model/buybookDetailsDto.dart';
import 'package:graduationproject/app/model/buybookDto.dart';
import 'package:graduationproject/app/model/library.dart';
import 'package:graduationproject/app/model/writter.dart';

import '../../../app/model/booklibrary.dart';
import '../../../app/model/buybookUser.dart';
import 'adapter/librrary_adapter.dart';

class LibraryRepository implements ILibraryRepository {
  final _dio = Get.find<Dio>();
//
  @override
  Future<List<Book>> getbookLibrary(int idlibrary) async {
    var result = await _dio.get(
      'https://localhost:7252/api/Library/GetLibraryBook?IdLibrary=$idlibrary',
    );
    var list = <Book>[];
    for (var item in result.data) {
      list.add(Book.fromJson(item));
    }
    return list;
  }

//
  @override
  Future<bool> AddBook(BookLibrary library) async {
    var result = await _dio.post(
        'https://localhost:7252/api/BookLibrary/AddBookLibrary',
        data: library.toJson());
    if (result.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  }

  @override
  Future<bool> DeleteBook(int idlibrary, int idbook) async {
    var result = await _dio.delete(
      "https://localhost:7252/api/BookLibrary/Delete?IdLibrary=$idlibrary&IdBook=$idbook",
    );
    if (result.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  }

  @override
  Future<bool> BascketBook(Buybook buybook) async {
    var result = await _dio.put("", data: buybook.toJson());
    if (result.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  }

  @override
  Future<bool> AddLibrary(Library library) async {
    var result = await _dio.post(
        'https://localhost:7252/api/Library/AddLibrary',
        data: library.toJson());
    if (result.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  }

  @override
  Future<bool> DeleteLibrary(int idlibrary) async {
    var result = await _dio.delete(
      "https://localhost:7252/api/Library/Delete/IdLibrary?IdLibrary=$idlibrary",
    );
    if (result.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  }

  @override
  Future<bool> UpdateBook(BookLibrary bookLibrary) async {
    var result = await _dio.put("", data: bookLibrary.toJson());
    if (result.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  }

  @override
  Future<bool> UpdateLibrary(int idlibrsry, Library library) async {
    var result = await _dio.put(
        'https://localhost:7252/api/Library/Put/$idlibrsry',
        data: library.toJson());
    if (result.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  }

  @override
  Future<List<Library>> getAllLibrary() async {
    var result =
        await _dio.get('https://localhost:7252/api/Library/GetLibraries');
    print(result);
    var list = <Library>[];
    for (var item in result.data) {
      list.add(Library.fromJson(item));
    }
    return list;
  }

  @override
  Future<List<Writer>> GetAllAuthourlibrary(int idlibrary) async {
    var result = await _dio.get('https://localhost:7252/api/Writer');

    print(result);
    var list = <Writer>[];
    for (var item in result.data) {
      list.add(Writer.fromJson(item));
    }
    return list;
  }

  @override
  Future<List<BookType>> GetAllTypeBooklibrary(int library) async {
    var result = await _dio.get(
        'https://localhost:7252/api/Library/GetLibraryBookType?IdLibrary=$library');
    print(result);
    var list = <BookType>[];
    if (result.statusCode == 200) {
      for (var item in result.data) {
        list.add(BookType.fromJson(item));
      }
    }

    return list;
  }

//
  @override
  Future<List<Book>> GetAllBookByType(int idlibrary, int idBooktype) async {
    var result = await _dio.get(
      'https://localhost:7252/api/Library/GetBookType?IdLibrary=$idlibrary&IdType=$idBooktype',
    );
    print(result);
    var list = <Book>[];
    for (var item in result.data) {
      list.add(Book.fromJson(item));
    }
    return list;
  }

//
  @override
  Future<List<Book>> GetAllBookByWitter(int library, int idwriter) async {
    var result = await _dio.get(
      'https://localhost:7252/api/Library/GetBookWriters?IdLibrary=$library&IdWriter=$idwriter',
    );
    print(result);
    var list = <Book>[];
    for (var item in result.data) {
      list.add(Book.fromJson(item));
    }
    return list;
  }

  @override
  Future<int> AddBookone(Book book) async {
    var result = await _dio.post('https://localhost:7252/api/Book/AddBook',
        data: book.toJson());
    print(result.data);
    if (result.statusCode == 200) {
      return int.parse(result.data.toString());
    } else {
      return 0;
    }
  }

  Future<BookDetailsDto> getBookInfo(int idBook) async {
    var result = await _dio.get(
      'https://localhost:7252/api/Book/GetBookDetails?IdBook=$idBook',
    );
    print(result.data['writers']);

    return BookDetailsDto.fromJson(result.data as Map<String, dynamic>);
  }

  @override
  Future<int> BackIdBook(String namebook) async {
    var result = await _dio.get('https://localhost:7252/api/Book/GetBookId',
        queryParameters: {'bookName': namebook});
    return int.parse(result as String).toInt();
  }

  @override
  Future<bool> Bookwritter(BookWriter book) async {
    var result = await _dio.post(
        'https://localhost:7252/api/BookWriter/AddBookWriter',
        data: book.toJson());
    if (result.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  }

  @override
  Future<bool> UpdateBookjust(int id, Book book) async {
    var result = await _dio.put('https://localhost:7252/api/Book/Put/$id',
        data: book.toJson());
    if (result.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  }

  @override
  Future<bool> UpdateBookwritter(
      int Idbook, int Idwriter, bool toDelete) async {
    var result = await _dio.put(
      'https://localhost:7252/api/BookWriter/Put?idBook=$Idbook&IdWriter=$Idwriter&toDelete=$toDelete',
    );
    if (result.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  }

  @override
  Future<List<BookWriter>> BackIdBookWritter(int idbook) async {
    print('*******************************************$idbook');
    var result = await _dio.get(
      'https://localhost:7252/api/BookWriter/GetBookAllWriter/$idbook',
    );
    if (result.statusCode == 200) {
      var data = <BookWriter>[];
      for (var element in result.data) {
        data.add(BookWriter.fromJson(element as Map<String, dynamic>));
      }

      return data;
    } else {
      return [];
    }
  }

  ////link should change
  @override
  Future<int?> BackIdBookLibrary(idbook, idlibrary) async {
    var result = await _dio.get(
      'https://localhost:7252/api/BookLibrary/GetIdLibraryBook?IdBook=$idbook&IdLibrary=$idlibrary',
    );
    if (result.statusCode == 200) {
      return result.data;
    }
    return null;
  }

  @override
  Future<BookLibrary?> GetBooklibrary(int idBooklibrary) async {
    var result =
        await _dio.get('https://localhost:7252/api/BookLibrary/$idBooklibrary');
    if (result.statusCode == 200) {
      var data = BookLibrary.fromJson(result.data as Map<String, dynamic>);
      return data;
    } else {
      return null;
    }
  }

  @override
  Future<bool> AddToBuyBook(Buybook n) async {
    var result = await _dio.post(
        'https://localhost:7252/api/Buybook/AddBuybook',
        data: n.toJson());
    if (result.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  }

  @override
  Future<bool> UpdateBuyBook(Buybook b) async {
    var result = await _dio.put('https://localhost:7252/api/BuyBook/Put',
        data: b.toJson());
    if (result.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  }

  @override
  Future<List<BuyBookUserDto>> GetUserBuyBook(int iduser) async {
    var result = await _dio.get(
        'https://localhost:7252/api/Buybook/GetBuyBookUser?IdUser=$iduser');
    print(result);
    var list = <BuyBookUserDto>[];
    for (var item in result.data) {
      list.add(BuyBookUserDto.fromJson(item));
    }
    return list;
  }

  @override
  Future<Buybook?> BackBuyBook(int idbooklibrary) async {
    var result = await _dio.get('');
    if (result.statusCode == 200) {
      var data = Buybook.fromJson(result.data as Map<String, dynamic>);
      return data;
    } else {
      return null;
    }
  }

  @override
  Future<List<BuyBookDto>> GetBuysfromLibrary(int idLibrary) async {
    var result = await _dio.get(
        'https://localhost:7192/api/BuyBook/GetBuyBookUser',
        queryParameters: {"idLibrary": idLibrary});
    print(result);
    var list = <BuyBookDto>[];
    for (var item in result.data) {
      list.add(BuyBookDto.fromJson(item));
    }
    return list;
  }

  @override
  Future<Library?> getLibrary(int idlibrary) async {
    var result =
        await _dio.get('https://localhost:7192/api/Library/Get/$idlibrary');
    if (result.statusCode == 200) {
      var data = Library.fromJson(result.data as Map<String, dynamic>);
      return data;
    } else {
      return null;
    }
  }

  @override
  Future<List<BuyBookDetailsDto>> GetDetailsBuyBook(
      int idlibrary, int iduser) async {
    var result = await _dio.get(
        'https://localhost:7252/api/Buybook/GetBuyBookDetails?IdLibrary=$idlibrary&IdUser=$iduser');
    var list = <BuyBookDetailsDto>[];
    for (var item in result.data) {
      list.add(BuyBookDetailsDto.fromJson(item));
    }
    return list;
  }
}
