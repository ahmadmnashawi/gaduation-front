
import 'dart:typed_data';

import 'package:graduationproject/app/model/writter.dart';

import 'book.dart';
import 'library.dart';

class   BuyBookUserDto{
  int? Id;
 Library? library;
  Book? book;
 BuyBookUserDto( {
    this.Id,
   this.library,
   this.book,
  });

   BuyBookUserDto.fromJson(Map<String, dynamic> json) {
   Id = json['id'];
 library =json['library '];
  book =json['book '];   
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = new Map<String, dynamic>();
    json['library']=library;
  json[' book']= book;

    return json;
  }
}
