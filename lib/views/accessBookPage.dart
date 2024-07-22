import 'package:flutter/material.dart';
import 'package:myapp/models/book.dart';
import 'package:url_launcher/url_launcher.dart';

class AccessBookPage extends StatelessWidget {
  const AccessBookPage(this._book, {super.key});
  final Book _book;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Sobre o livro"),
      ),
      body: Container(
        padding: const EdgeInsets.all(15),
        alignment: Alignment.center,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Text(
                _book.name,
                style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 25.0), // textAlign: TextAlign.center,
              ),
              const SizedBox(height: 30),
              Image.network(
                  _book.capa,),
              const SizedBox(height: 20),
              Text(
                _book.sinopse,
                style: const TextStyle(fontSize: 18.0),
              ),
              ],
          ),
        ),
      ),
    );
  }
}
