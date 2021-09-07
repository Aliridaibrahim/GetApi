
import 'package:books/View/Home.dart';
import 'package:books/ViewModel/BooksList.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';



void main() => runApp(MaterialApp(
  home: App(),
  debugShowCheckedModeBanner: false,
));

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => BooksList(),
      child: Home(),);
  }
}


