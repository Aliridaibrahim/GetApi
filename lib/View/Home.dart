
import 'package:books/ViewModel/BooksList.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  void initState() {
    super.initState();
    Provider.of<BooksList>(context,listen: false).fetchTopBooks();
  }

  @override
  Widget build(BuildContext context) {
    final u = Provider.of<BooksList>(context);
    return Scaffold(
      appBar: AppBar(title: Text('BOOkS')),
      body: _buildUI(u),
    );
  }

  Widget _buildUI(BooksList u){
    if(u.books == null) {
      return Align(child: CircularProgressIndicator());
    } else if(u.books.isEmpty) {
      return Align(child: Text("Cannot fetch Books."));
    } else {
      return _bookslist(context);
    }
  }

  Widget _bookslist(BuildContext context){

    final u = Provider.of<BooksList>(context);
    return ListView.builder(
        itemCount: u.books.length,
        itemBuilder: (BuildContext context, int index){
          return ListTile(
            leading: Image.network(u.books[index].image),
            title: Text(u.books[index].title),
           // subtitle: Text(u.books[index].price),
            subtitle: Text(u.books[index].subtitle),
          );
        });

  }
}
