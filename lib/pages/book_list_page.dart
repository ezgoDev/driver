import 'package:flutter/material.dart';

import '../main.dart';

class BooksListPage extends StatelessWidget {
  final List<Book> books;
  final ValueChanged<Book> onTapped;

  BooksListPage({
    required this.books,
    required this.onTapped,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: ListView(
        children: [
          for (var book in books)
            ListTile(
              title: Text(book.title),
              subtitle: Text(book.author),
              onTap: () => onTapped(book),
            )
        ],
      ),
    );
  }
}

