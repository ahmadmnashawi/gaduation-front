import 'package:flutter/animation.dart';
import 'package:get/get.dart';
import 'package:graduationproject/app/model/book.dart';
import 'package:graduationproject/app/model/book_type.dart';
import 'package:graduationproject/app/model/bookwritter.dart';
import 'package:graduationproject/app/model/buy_book.dart';
import 'package:graduationproject/app/model/library.dart';
import 'package:image_picker/image_picker.dart';

import '../../../api/storage/storge_service.dart';
import '../../../app/model/accessiblity_logIn.dart';
import '../../../app/model/booklibrary.dart';
import '../../../app/model/buybookDetailsDto.dart';
import '../../../app/model/buybookDto.dart';
import '../../../app/model/buybookUser.dart';
import '../../../app/model/user.dart';
import '../../../app/model/writter.dart';
import '../../genereted/sheard/util.dart';
import '../../sheard/auth_service.dart';
import '../data/libraray_repositry.dart';

class LibraryContrller extends GetxController {
  var valuepice = 0.obs;
  final booklibraryAdd = BookLibrary().obs;
  final addoneBook = Book().obs;
  late AnimationController controller;
  late Animation<double> animation;
  final stroge = Get.find<StorageService>();
  final Booklist = <Book>[].obs;
  final libraryRepo = LibraryRepository();
  final ImagePicker imagepicker = ImagePicker();
  final stringPickImage = ''.obs;
  PickedFile? imagefile;
  final listLibrary = <Library>[].obs;
  final currentBook = Book().obs;
  final Addlibrary = Library().obs;
  final updatelibrary = Library().obs;
  final IdLibrary = 0.obs;
  final Newlibrary = Library().obs;
  final Booktype = <BookType>[];
  final AllAutour = <Writer>[];
  final addBook = Book().obs;

  final idbook = 0.obs;
  final buybook = Buybook().obs;
  final writerBook = BookWriter().obs;
  final updatebookwritter = BookWriter().obs;
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
  final textshowlibrary = 'tsl'.tr;
  final textlibrary = 'tl'.tr;
  final textbook = 'tb'.tr;
  final addbooktext = 'abt'.tr;
  final addlibrary = 'alx'.tr;
  final fatorauesr = 'fa';
  final fatouralibrary = 'fl'.tr;
  final textupdatelibrary = 'tx'.tr;
  final textupdatebook = 'tbx'.tr;
  final listDetailsBuyBook = <BuyBookDetailsDto>[].obs;
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
      getAllLibrary();
    }
  }

  Future<void> dellBookLibrary(int idlibrary, int idbook) async {
    var res = await libraryRepo.DeleteBook(idlibrary, idbook);
    if (res) {
      getAllBook();
    }
  }

  Future<void> addLibrary(Library newlibrart) async {
    var res = await libraryRepo.AddLibrary(newlibrart);
    if (res) {
      //for refresh
      getAllLibrary();
      Get.back();
    }
  }

  Future<void> UpdateBook(BookLibrary n) async {
    var res = await libraryRepo.UpdateBook(n);
    if (res) {
      getAllLibrary();
      Get.back();
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

  Future<void> UpdateBookwriter(BookWriter book) async {
    var res = await libraryRepo.UpdateBookwritter(book);
    if (res) {
      Get.back();
    }
  }

//
  Future<void> getAllBook() async {
    var data = await libraryRepo.getbookLibrary(IdLibrary.value);
    Booklist.assignAll(data);
    getAllBookType();
  }

  Future<void> addBooktolibrary() async {
    var res = await libraryRepo.AddBook(booklibraryAdd.value);
  }

  Future<void> addBookwritter() async {
    var res = await libraryRepo.Bookwritter(writerBook.value);
  }

  Future<void> addBookone() async {
    addoneBook.value.bookImage =
        Utility.dataFromBase64String(stringPickImage.value);
    var res = await libraryRepo.AddBookone(addoneBook.value);
  }

  Future<void> getAllWriter() async {
    var data = await libraryRepo.GetAllAuthourlibrary(IdLibrary.value);
    AllAutour.assignAll(data);
  }

  Future<void> getAllBookType() async {
    var data = await libraryRepo.GetAllTypeBooklibrary(IdLibrary.value);
    Booktype.assignAll(data);
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
    updatebookwritter.value = data!;
  }

  Future<void> AddToBuyBooktempority(Buybook buyBook) async {
    wishListBuyBook.add(buyBook);
  }

  Future<void> AddToBuyBookback(Buybook buyBook) async {
    var data = await libraryRepo.AddToBuyBook(buyBook);
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
