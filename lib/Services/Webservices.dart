import 'package:books/Model/BooksModel.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';


class Webservice{

  Future<List<Book>> fetchBooks() async{

    String url = "https://api.itbook.store/1.0/new";

    final response = await http.get(Uri.parse(url));

    if(response.statusCode == 200){
      final json = jsonDecode(response.body);
      final booksmodel =BooksModel.fromJson(json);
      return booksmodel.books;
    }
    else{
      throw Exception("Error fetching BOOKS...");
    }

  }
}