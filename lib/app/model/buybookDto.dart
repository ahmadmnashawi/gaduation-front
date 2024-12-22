import 'package:graduationproject/app/model/library.dart';
import 'package:graduationproject/app/model/user.dart';

import 'buy_book.dart';

class BuyBookDto {
  User? user;
  List<Buybook> ?userBooks;
  BuyBookDto(
      {
      this.user,
      this.userBooks,});

  BuyBookDto.fromJson(Map<String, dynamic> json) {
    user = json[' user'];
   userBooks = json[' userBooks'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = <String, dynamic>{};
    json[' user'] = user;
    json['userBooks'] = userBooks;
    return json;
  }
}
