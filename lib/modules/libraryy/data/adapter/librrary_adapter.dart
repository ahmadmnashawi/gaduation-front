import 'package:graduationproject/app/model/book_type.dart';
import 'package:graduationproject/app/model/bookwritter.dart';
import 'package:graduationproject/app/model/buy_book.dart';
import 'package:graduationproject/app/model/library.dart';

import '../../../../app/model/book.dart';
import '../../../../app/model/booklibrary.dart';
import '../../../../app/model/buybookDetailsDto.dart';
import '../../../../app/model/buybookDto.dart';
import '../../../../app/model/buybookUser.dart';
import '../../../../app/model/writter.dart';

abstract class ILibraryRepository {
  Future<List<Book>> getbookLibrary(int idlibrary);
  Future<List<Library>> getAllLibrary();
  Future<bool> AddBook(BookLibrary library);
  Future<bool> AddBookone(Book book);
  Future<bool> DeleteBook(int idlibrary, int idbook);
  Future<bool> BascketBook(Buybook buybook);
  Future<bool> AddLibrary(Library library);
  Future<bool> DeleteLibrary(int idlibrary);
  Future<bool> UpdateBook(BookLibrary library);
  Future<bool> UpdateBookjust(int id, Book book);
  Future<bool> UpdateLibrary(int idlibrsry, Library library);
  Future<List<Writer>> GetAllAuthourlibrary(int idlibrary);
  Future<List<BookType>> GetAllTypeBooklibrary(int library);
  Future<List<Book>> GetAllBookByType(int idlibrary, int idBooktype);
  Future<List<Book>> GetAllBookByWitter(int library, int idwriter);
  Future<int> BackIdBook(String name);
  Future<BookWriter?> BackIdBookWritter(int idbook);
  Future<bool> Bookwritter(BookWriter book);
  Future<bool> UpdateBookwritter(BookWriter book);
  Future<int?> BackIdBookLibrary(int idbook, int idlibrary);
  Future<Buybook?> BackBuyBook(int idbooklibrary);
  Future<BookLibrary?> GetBooklibrary(int idBooklibrary);
  Future<bool> AddToBuyBook(Buybook n);
  Future<bool> UpdateBuyBook(Buybook b);
  Future<List<BuyBookUserDto>> GetUserBuyBook(int iduser);
  Future<List<BuyBookDto>> GetBuysfromLibrary(int idLibrary);
  Future<Library?> getLibrary(int idlibrary);
  Future<List<BuyBookDetailsDto>> GetDetailsBuyBook(int idlibrary, int iduser);
}
