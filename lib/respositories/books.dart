import 'dart:collection';

import 'package:flutter/material.dart';
import '../models/book.dart';

class Books extends ChangeNotifier {
  final _books = <Book>[
    Book(
        "Homem Aranha",
        "BALANCE NAS TEIAS DO PASSADO DO HOMEM-ARANHA! Na esperança de obter algumas fotos de seu alter ego aracnídeo em ação, Peter Parker sai em busca de problemas – e os encontra na forma de uma placa de pedra misteriosa e mítica cobiçada pelo Rei do Crime e pelos facínoras da Maggia, o maior sindicato criminal da cidade.\n Na mira dos vilões mais nefastos de Nova York, Peter também entra em conflito com seus amigos – e com a polícia! Sua namorada, Gwen Stacy, também não está muito feliz com ele. E o passado volta para assombrá-lo quando o líder supostamente morto da Maggia ressurge, ainda em busca do objeto problemático.\n E mais: com tia May às portas da morte, a sorte do velho Parker desapareceu para sempre?",
        "https://m.media-amazon.com/images/I/51jUu9VLO6L.jpg",
    ),
    Book(
        "O Hobbit",
        "Os hobbits são seres muito pequenos, menores do que os anões. São de boa paz, sua única ambição é uma boa terra lavrada e só gostam de lidar com ferramentas manuais. Este livro tem como personagem central o hobbit Bilbo Bolseiro. Ele vive muito tranquilo até que o mago Gandalf e uma companhia de anões o levam numa expedição para resgatar um tesouro guardado por Smaug, um dragão enorme e perigoso.",
        "https://m.media-amazon.com/images/I/81Rr0awAmwL._AC_UF1000,1000_QL80_.jpg"    ),
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
