import 'package:flutter/animation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:graduationproject/app/model/book.dart';
import 'package:graduationproject/app/model/book_type.dart';
import 'package:graduationproject/app/model/bookwritter.dart';
import 'package:graduationproject/app/model/buy_book.dart';
import 'package:graduationproject/app/model/library.dart';
import 'package:image_picker/image_picker.dart';

import '../../../api/storage/storge_service.dart';
import '../../../api/ui/util.dart';
import '../../../app/model/BookDetalites.dart';
import '../../../app/model/accessiblity_logIn.dart';
import '../../../app/model/booklibrary.dart';
import '../../../app/model/buybookDetailsDto.dart';
import '../../../app/model/buybookDto.dart';
import '../../../app/model/buybookUser.dart';
import '../../../app/model/user.dart';
import '../../../app/model/writter.dart';
import '../../sheard/auth_service.dart';
import '../data/libraray_repositry.dart';

class LibraryContrller extends GetxController {
  var valuepice = 1.obs;
  final booklibraryAdd = BookLibrary().obs;
  final addOneBook = Book().obs;
  late AnimationController controller;
  late Animation<double> animation;
  final stroge = Get.find<StorageService>();
  final Booklist = <Book>[].obs;
  final libraryRepo = LibraryRepository();
  final selectBookType = BookType().obs;
  final selectWriter = Writer().obs;
  final ImagePicker imagepicker = ImagePicker();
  final stringPickImage = ''.obs;
  PickedFile? imagefile;
  final listLibrary = <Library>[].obs;
  final currentBook = Book().obs;
  final Addlibrary = Library().obs;
  final updatelibrary = Library().obs;
  final IdLibrary = 0.obs;
  final Newlibrary = Library().obs;
  final Booktype = <BookType>[].obs;
  final AllAutour = <Writer>[].obs;
  final listWriterToAdd = <BookWriter>[].obs;
  final addBook = Book().obs;
  final formField = GlobalKey<FormState>();
  final idbook = 0.obs;
  final buybook = Buybook().obs;
  final writerBook = BookWriter().obs;
  final updateListWriter = <BookWriter>[].obs;
  final updateBooklibrary = BookLibrary().obs;
  final user = User().obs;
  final auth = Get.find<AuthService>();
  final wishListBuyBook = <Buybook>[].obs;
  final staute = ''.obs;
  final idBookLibrary = 0.obs;
  final ListBookLibrary = <BookLibrary>[].obs;
  final AddBooklibrary = BookLibrary().obs;
  final sum = 0.0.obs;
  final ListuserBuyBook = <BuyBookUserDto>[].obs;
  final backBuyBook = Buybook().obs;
  final listBuyBookDto = <BuyBookDto>[].obs;
  final currentLibrary = Library().obs;

  final listDetailsBuyBook = <BuyBookDetailsDto>[].obs;
  final bookInfo = BookDetailsDto().obs;
  final access = <AccessiblityLogIn>[].obs;
  @override
  Future<void> onInit() async {
    super.onInit();
    getAllLibrary();
    GetUser();
    access.value = auth
        .getUserLogInAccess()
        .where((element) => element.type == 'Library')
        .toList();
  }

  Future pickImageFun() async {
    try {
      final image = await ImagePicker().pickImage(source: ImageSource.gallery);
      if (image == null) return;
      stringPickImage.value = Utility.base64String(await image.readAsBytes());
    } catch (e) {
      print('Failed to pick image: $e');
    }
  }

  Future<void> getInfoBook(int idBook) async {
    var data = await libraryRepo.getBookInfo(idBook);
    bookInfo.value = data;
  }

  Future<void> GetUser() async {
    user.value = auth.getDataFromStorage()!;
  }

  Future<void> getAllLibrary() async {
    var data = await libraryRepo.getAllLibrary();
    listLibrary.assignAll(data);
  }

  Future<void> dellibrary(int idlibrary) async {
    var res = await libraryRepo.DeleteLibrary(idlibrary);
    if (res) {
      await getAllLibrary();
    }
  }

  Future<void> dellBookLibrary(int idlibrary, int idbook) async {
    var res = await libraryRepo.DeleteBook(idlibrary, idbook);
    if (res) {
      Get.back();
      await getAllBook();
    }
  }

  Future<void> addLibrary(Library newlibrart) async {
    var res = await libraryRepo.AddLibrary(newlibrart);
    if (res) {
      //for refresh
      await getAllLibrary();
      Get.back();
    }
  }

  Future<void> UpdateBook() async {
    if (stringPickImage.value.isNotEmpty) {
      addOneBook.value.bookImage =
          Utility.dataFromBase64String(stringPickImage.value);
    }

    var res = await libraryRepo.UpdateBookjust(
        addOneBook.value.id!, addOneBook.value);

    if (res) {
      for (var element in listWriterToAdd) {
        if (!updateListWriter.any((e) =>
            e.IdBook == element.IdBook && e.IdWriter == element.IdWriter)) {
          print(
              'true*******************${element.IdBook}*******************${element.IdWriter}');
          await libraryRepo.UpdateBookwritter(
              element.IdBook!, element.IdWriter!, true);
        }
      }
      for (var element in updateListWriter) {
        if (!listWriterToAdd.any((e) =>
            e.IdBook == element.IdBook && e.IdWriter == element.IdWriter)) {
          print(
              'false*******************${element.IdBook}*******************${element.IdWriter}');
          await libraryRepo.UpdateBookwritter(
              addOneBook.value.id!, element.IdWriter!, false);
        }
      }
      await getAllBook();
    }
  }

  Future<void> UpdateLibrary(int idlibrary) async {
    var res = await libraryRepo.UpdateLibrary(idlibrary, updatelibrary.value);
    if (res) {
      getAllLibrary();
      Get.back();
    }
  }

  Future<void> UpdateBookinfo(int id, Book book) async {
    var res = await libraryRepo.UpdateBookjust(id, book);
    if (res) {
      Get.back();
    }
  }

//
  Future<void> getAllBook() async {
    var data = await libraryRepo.getbookLibrary(IdLibrary.value);
    Booklist.assignAll(data);
    await getAllBookType();
    selectBookType.value = Booktype.first;
  }

  Future<void> addBooktolibrary(int idBook) async {
    booklibraryAdd.value.IdBook = idBook;
    booklibraryAdd.value.IdLibrary = IdLibrary.value;
    await libraryRepo.AddBook(booklibraryAdd.value);
  }

  Future<bool> addBookwritter(int idBook) async {
    for (var element in listWriterToAdd) {
      element.IdBook = idBook;
      await libraryRepo.Bookwritter(element);
    }
    return true;
  }

  Future<void> addBookone() async {
    addOneBook.value.bookImage =
        Utility.dataFromBase64String(stringPickImage.value);
    if (addOneBook.value.id == null) {
      var res = await libraryRepo.AddBookone(addOneBook.value);
      print('*******************$res');
      if (res != 0) {
        await addBookwritter(res);
        await addBooktolibrary(res);
        await getAllBook();
        addOneBook.value = Book();
        stringPickImage.value = '';
        listWriterToAdd.clear();
      }
    }
  }

  Future<void> getAllWriter() async {
    var data = await libraryRepo.GetAllAuthourlibrary(IdLibrary.value);
    AllAutour.assignAll(data);
    selectWriter.value = AllAutour.first;
  }

  Future<void> getAllBookType() async {
    var data = await libraryRepo.GetAllTypeBooklibrary(IdLibrary.value);
    if (data.isNotEmpty) {
      Booktype.assignAll(data);
    }
  }

  Future<void> getAllBookByType(int idBooktype) async {
    var data = await libraryRepo.GetAllBookByType(IdLibrary.value, idBooktype);
    Booklist.assignAll(data);
  }

  Future<void> getAllBookByWritter(int idwriter) async {
    var data = await libraryRepo.GetAllBookByWitter(IdLibrary.value, idwriter);
    Booklist.assignAll(data);
  }

  Future<void> getIdBook(String name) async {
    var data = await libraryRepo.BackIdBook(name);
    idbook.value = data;
  }

  Future<void> getIdBookWritter(int idbbook) async {
    var data = await libraryRepo.BackIdBookWritter(idbbook);
    updateListWriter.assignAll(data);
    listWriterToAdd.assignAll(data);
  }

  Future<void> AddToBuyBooktempority(Book book) async {
    if (wishListBuyBook.any((t) => t.bookLibrary!.IdBook == book.id)) return;
    buybook.value.bookLibrary = BookLibrary(
      IdBook: book.id,
      book: book,
      IdLibrary: IdLibrary.value,
    );
    buybook.value.IdBookLibrary =
        await libraryRepo.BackIdBookLibrary(book.id!, IdLibrary.value);

    buybook.value.Count = valuepice.value;
    buybook.value.price =
        double.parse((book.bookPrice! * valuepice.value).toString());

    wishListBuyBook.add(buybook.value);
    valuepice.value = 1;
    buybook.value = Buybook();
  }

  Future<void> AddToBuyBookback(Buybook data) async {
    data.IdBookLibrary = await libraryRepo.BackIdBookLibrary(
        data.bookLibrary!.book!.id!, IdLibrary.value);
    await libraryRepo.AddToBuyBook(data);

    Get.back();
    buybook.value = Buybook();
  }

  Future<void> getIdBookLibrary(int idbbook, int idlibraryas) async {
    var data = await libraryRepo.BackIdBookLibrary(idbbook, idlibraryas);
    idBookLibrary.value = data!;
    var result = await libraryRepo.GetBooklibrary(idBookLibrary.value);
    ListBookLibrary.add(result!);
  }

  Future<void> UpdateBuyBook(Buybook b) async {
    var res = await libraryRepo.UpdateBuyBook(b);
    if (res) {
      Get.back();
    }
  }

  Future<void> GetUserBuyBook() async {
    var data = await libraryRepo.GetUserBuyBook(user.value.Id!);
    ListuserBuyBook.assignAll(data);
  }

  Future<int?> GetCount(int idbook, int idlibrary) async {
    var datas = await libraryRepo.BackIdBookLibrary(idbook, idlibrary);
    var data = await libraryRepo.BackBuyBook(datas!);
    backBuyBook.value = data!;
    return backBuyBook.value.Count;
  }

  Future<void> getBuyBookDto() async {
    var data = await libraryRepo.GetBuysfromLibrary(IdLibrary.value);
    listBuyBookDto.assignAll(data);
  }

  Future<void> getlibrary() async {
    var res = await libraryRepo.getLibrary(IdLibrary.value);
    currentLibrary.value = res!;
  }

  Future<void> getDetailsBuyBook(int idl, int idu) async {
    var data = await libraryRepo.GetDetailsBuyBook(idl, idu);
    listDetailsBuyBook.assignAll(data);
  }

  Future<int?> GetCountdete(int idbook, int idlibrary) async {
    var datas = await libraryRepo.BackIdBookLibrary(idbook, idlibrary);
    var data = await libraryRepo.BackBuyBook(datas!);
    backBuyBook.value = data!;
    return backBuyBook.value.IdBookLibrary;
  }
}
