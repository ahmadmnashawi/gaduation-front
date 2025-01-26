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
    price = json['price'];
    address = json['address'];
    idUser = json['idUser'];
    user = json['user'] == null ? null : User.fromJson(json['user']);
    Count = json['count'];
    IdBookLibrary = json['idBookLibrary'];
    bookLibrary = json['bookLibrary'] == null
        ? null
        : BookLibrary.fromJson(json['bookLibrary']);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = <String, dynamic>{};
    json['id'] = 0;
    json['price'] = price;
    json['address'] = address;
    json['count'] = Count;
    json['idUser'] = idUser;
    json['idBookLibrary'] = IdBookLibrary;
    return json;
  }
}
