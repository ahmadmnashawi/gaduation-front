
import 'dart:typed_data';

import 'package:graduationproject/app/model/post.dart';
import 'package:graduationproject/app/model/user.dart';

import 'book.dart';

class BookDetailsDto{
  Book ?book;
  String? Type ;
  List<String> ?writer;
BookDetailsDto( {
    this.book,
    this.Type,
    this.writer,
  });

BookDetailsDto.fromJson(Map<String, dynamic> json) {
  book = json['book'];
  Type=json['Type '];
  writer=json[' writer '];


  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = new Map<String, dynamic>();
    json[' Type']= Type;
    json[' book ']=book;
    json[' writer']=writer;
    return json;
  }
}
