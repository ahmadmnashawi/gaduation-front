import 'package:graduationproject/app/model/user.dart';

import 'booklibrary.dart';

class Buybook {
  int? id;
  double? price;
  String? address;
  int? idUser;
  int? Count;
  User? user;
  int? IdBookLibrary;
  BookLibrary? bookLibrary;
  Buybook(
      {this.id,
      this.price,
      this.address,
      this.idUser,
      this.user,
      this.Count = 1,
      this.IdBookLibrary,
      this.bookLibrary});

  Buybook.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    price = json['Price'];
    address = json['address'];
    idUser = json[' idUser'];
    user = json[' user'];
    Count = json[' Count'];
    IdBookLibrary = json['IdBookLibrary'];
    bookLibrary = json['bookLibrary'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = <String, dynamic>{};
    json['price'] = price;
    json['address'] = address;
    json['count'] = Count;
    json['idUser'] = idUser;
    json['idBookLibrary'] = IdBookLibrary;
    return json;
  }
}
