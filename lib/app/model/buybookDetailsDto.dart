import 'book.dart';
import 'buy_book.dart';

class BuyBookDetailsDto {
  List<Buybook>? buybooks;
  Book? book;
  BuyBookDetailsDto({
    this.buybooks,
    this.book,
  });

  BuyBookDetailsDto.fromJson(Map<String, dynamic> json) {
    buybooks = <Buybook>[];
    if (json['buybooks'] != null) {
      for (var item in json['buybooks']) {
        buybooks!.add(Buybook.fromJson(item));
      }
    }
    book = Book.fromJson(json['book'] as Map<String, dynamic>);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = new Map<String, dynamic>();
    json['buybooks'] = buybooks;
    json[' book'] = book;

    return json;
  }
}
