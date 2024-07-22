import 'package:flutter/material.dart';
import 'package:myapp/models/book.dart';
import 'package:myapp/respositories/books.dart';
import 'package:provider/provider.dart';

class AddBookPage extends StatelessWidget {
  AddBookPage({super.key});
  final nameController = TextEditingController();
  final sinopseController = TextEditingController();
  final imageController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Adicionar livro"),
      ),
      body: Column(
        children: [
          const SizedBox(height: 15),

          TextField(
            decoration: const InputDecoration(
              label: Text("Nome"),
            ),
            controller: nameController,
          ),
          const SizedBox(height: 15),

          TextField(
            decoration: const InputDecoration(
              label: Text("Sinopse"),
            ),
            controller: sinopseController,
          ),          const SizedBox(height: 15),

          TextField(
            decoration: const InputDecoration(
              label: Text("Imagem"),
            ),
            controller: imageController,
          ),
          const SizedBox(height: 15),
          const SizedBox(height: 15),
          Consumer<Books>(
            builder: (context, books, child) {
              return ElevatedButton(
                child: const Text("Adicionar"),
                onPressed: () {
                  Navigator.of(context).pop();
                  final book = Book(
                    nameController.text,
                    sinopseController.text,
                    imageController.text,
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
