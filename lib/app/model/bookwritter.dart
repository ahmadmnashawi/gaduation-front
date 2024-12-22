
import 'dart:typed_data';

import 'package:graduationproject/app/model/writter.dart';

import 'book.dart';

class   BookWriter{
  int? Id;
 int? IdBook ;
  Book? book;
  int ?IdWriter;
Writer? writer;
 BookWriter( {
    this.Id,
   this.IdBook,
   this.book,
   this.IdWriter,
   this.writer,
  });

  BookWriter.fromJson(Map<String, dynamic> json) {
   Id = json['id'];
  IdBook =json['IdBook '];
  book =json['book '];   
 IdWriter =json['IdWriter ']; 
   writer =json['writer']; 
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> json = new Map<String, dynamic>();
    json['IdBook']=IdBook;
  json[' book']= book;
  json['IdWriter']= IdWriter;
  json[' writer']= writer;
    return json;
  }
}
