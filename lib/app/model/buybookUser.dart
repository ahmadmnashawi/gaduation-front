import 'book.dart';
import 'buy_book.dart';
import 'library.dart';

class BuyBookUserDto {
  int? Id;
  Library? library;
  Book? book;
  List<Buybook>? buybooks;
  BuyBookUserDto({
    this.Id,
    this.library,
    this.book,
  });

  BuyBookUserDto.fromJson(Map<String, dynamic> json) {
    Id = json['id'];
    buybooks = <Buybook>[];
    if (json['userBuyBook'] != null) {
      for (var item in json['userBuyBook']) {
        buybooks!.add(Buybook.fromJson(item));
      }
    }
    book = Book.fromJson(json['book'] as Map<String, dynamic>);
    library = Library.fromJson(json['library'] as Map<String, dynamic>);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = new Map<String, dynamic>();
    json['library'] = library;
    json[' book'] = book;

    return json;
  }
}
