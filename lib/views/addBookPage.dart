import 'package:flutter/material.dart';
import 'package:myapp/models/book.dart';
import 'package:myapp/respositories/books.dart';
import 'package:provider/provider.dart';

class AddBookPage extends StatelessWidget {
  AddBookPage({super.key});
  final nameController = TextEditingController();
  final sinopseController = TextEditingController();
  final imageController = TextEditingController();
  final linkController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Adicionar livro"),
      ),
      body: Column(
        children: [
          SizedBox(height: 15),

          TextField(
            decoration: InputDecoration(
              label: Text("Nome"),
            ),
            controller: nameController,
          ),
          SizedBox(height: 15),

          TextField(
            decoration: InputDecoration(
              label: Text("Sinopse"),
            ),
            controller: sinopseController,
          ),          SizedBox(height: 15),

          TextField(
            decoration: InputDecoration(
              label: Text("Imagem"),
            ),
            controller: imageController,
          ),
          SizedBox(height: 15),
          TextField(
            decoration: InputDecoration(
              label: Text("Link"),
            ),
            controller: linkController,
          ),
          SizedBox(height: 15),
          Consumer<Books>(
            builder: (context, books, child) {
              return ElevatedButton(
                child: Text("Adicionar"),
                onPressed: () {
                  Navigator.of(context).pop();
                  final book = Book(
                    nameController.text,
                    sinopseController.text,
                    imageController.text,
                    linkController.text,
                  );
                  books.add(book);
                },
              );
            },
          )
        ],
      ),
    );
  }
}
