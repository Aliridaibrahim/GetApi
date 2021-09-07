import 'package:books/Model/BooksModel.dart';
import 'package:books/Services/Webservices.dart';
import 'package:flutter/material.dart';



class BooksList with ChangeNotifier{
  List<BooksViewModel> books;

  Future<void>fetchTopBooks() async{

    final books = await Webservice().fetchBooks();
    this.books = books.map((book) => BooksViewModel(book)).toList();
    notifyListeners();
  }
}
class BooksViewModel{

  final Book book;

 BooksViewModel(this.book);
  String get title{
    return this.book.title;
  }
  String get subtitle{
    return this.book.subtitle;
  }
  String get isbn13{
    return this.book.isbn13;
  }
  String get price{
    return this.price;
  }
  String get image{
    return this.book.image;
  }
  String get url{
    return this.book.url;
  }
}