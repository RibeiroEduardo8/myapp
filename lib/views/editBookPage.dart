import 'package:flutter/material.dart';

class EditBookPage extends StatelessWidget {
  const EditBookPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Editar livro"),
      ),
      body: Container(
        padding: EdgeInsets.all(15),
        alignment: Alignment.center,
      ),
    );
  }
}