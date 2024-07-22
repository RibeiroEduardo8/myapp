import 'dart:collection';

import 'package:flutter/material.dart';
import '../models/book.dart';

class Books extends ChangeNotifier {
  final _books = <Book>[
    Book(
        "Eternamente Você",
        "Sophie Jackson",
        "Quando conheceu o arrogante presidiário Wesley Carter em Desejo proibido, a professora Kat Lane sentiu um misto de atração e ódio. Mas, à medida que o relacionamento entre eles se intensificou, ela descobriu um novo lado de seu aluno e se apaixonou por ele.\nAgora os dois resolvem se casar, mas a mãe de Kat não fica nem um pouco satisfeita com a notícia do noivado. Além disso, Carter acaba de assumir a presidência da empresa da família, uma grande responsabilidade em sua nova vida fora da prisão, e precisa apoiar seu melhor amigo, que não consegue se livrar das drogas.\nEquilibrar problemas pessoais, da família e de um negócio de bilhões de dólares não deixa muito tempo para o casal aproveitar a vida a dois.\nEm meio a esse turbilhão, será que Carter e Kat vão conseguir manter a chama da paixão acesa?",
        "https://www.editoraarqueiro.com.br/media/upload/conteudos/9788580414820.jpg",
        "assets/Eternamente_voce_final_EBOOK.pdf"),
    Book(
        "A Arte da Guerra",
        "Sun tzu",
        " é um clássico da literatura mundial por ser o primeiro tratado militar de que se tem noticia. Atribuída ao general chinês Sun Tzu, a obra é uma coletânea de disposições a respeito de táticas de combate e aniquilação dos inimigos.",
        "https://www.lpm.com.br/livros/imagens/arte_guerra_classicos_9788525429896_hd.jpg",
        "assets/A_ARTE_DA_GUERRA.pdf")
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
