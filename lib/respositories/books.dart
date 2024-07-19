import 'dart:collection';

import 'package:flutter/material.dart';
import '../models/book.dart';

class Books extends ChangeNotifier {
  final _books = <Book>[
    Book(
        "Homem Aranha",
        "É um livro em quadrinhos da marvel",
        "https://m.media-amazon.com/images/I/51jUu9VLO6L.jpg",
        "https://www.amazon.com.br/Homem-Aranha-Eternamente-jovem-Stefan-Petrucha-ebook/dp/B09JVFRX7D")
  ];

  add(Book book) {
    _books.add(book);
    notifyListeners();
  }

  List<Book> get all {
    return UnmodifiableListView(_books);
  }

  void remove(int index) {
    _books.removeAt(index);
    notifyListeners();
  }

}
