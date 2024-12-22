
import 'dart:typed_data';

import 'package:graduationproject/app/model/writter.dart';

import 'book.dart';
import 'buy_book.dart';
import 'library.dart';

class   BuyBookDetailsDto{
 List<Buybook>? buybooks ;
  Book? book;
 BuyBookDetailsDto( {
   this.buybooks,
   this.book,
  });

BuyBookDetailsDto.fromJson(Map<String, dynamic> json) {
 buybooks =json['buybooks '];
  book =json['book '];   
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = new Map<String, dynamic>();
    json['buybooks']=buybooks;
  json[' book']= book;

    return json;
  }
}
