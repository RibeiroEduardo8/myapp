import 'package:flutter/material.dart';
import 'package:myapp/respositories/books.dart';
import 'package:myapp/service/autenticarUsuario.dart';
import 'package:myapp/views/accessBookPage.dart';
import 'package:myapp/views/addBookPage.dart';
import 'package:myapp/views/editBookPage.dart';
import 'package:provider/provider.dart';

class MyHomePage extends StatelessWidget {
  MyHomePage({super.key});
  final AutenticarUsuario _autenticarUsuario = AutenticarUsuario();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Biblioteca Virtual"),
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () async {
              bool logout = await _dialogBuilder(context,'Deseja realmente sair?','Voce esta prestes a sair do aplicativo!\n') ?? false;
              if (logout) {
                await _autenticarUsuario.deslogarUsuario();
              }
            },
          )
        ],
      ),
      body: Consumer<Books>(
        builder: (context, books, child) {
          return ListView.builder(
            itemCount: books.all.length,
            itemBuilder: (context, index) {
              final book = books.all[index];
              return ListTile(
                title: Text(book.name),
                leading: Image.network(book.capa),
                trailing: Row(mainAxisSize: MainAxisSize.min, children: [
                  IconButton(
                    icon: const Icon(Icons.edit, color: Colors.yellow),
                    onPressed: () {
                      Navigator.of(context)
                          .push(MaterialPageRoute(builder: (_) {
                        return const EditBookPage();
                      }));
                    },
                  ),
                  IconButton(
                    icon: const Icon(Icons.delete, color: Colors.red),
                    onPressed: () async {
                      bool removed = await _dialogBuilder(context,'Deseja realmente excluir?','Essa ação não pode ser defeita!\n') ?? false;
                      if (removed) {
                        books.remove(index);
                      }
                      // books.remove(index);
                    },
                  ),
                ]),
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(builder: (_) {
                    return AccessBookPage(book);
                  }));
                },
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          Navigator.of(context).push(MaterialPageRoute(builder: (_) {
            return AddBookPage();
          }));
        },
      ),
    );
  }
}

Future<bool?> _dialogBuilder(BuildContext context, String titulo, String conteudo) {
  return showDialog<bool>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
            title:  Text(titulo),
            content: Text(conteudo),
            actions: <Widget>[
              TextButton(
                style: TextButton.styleFrom(
                  textStyle: Theme.of(context).textTheme.labelLarge,
                ),
                child: const Text('Cancelar'),
                onPressed: () {
                  Navigator.of(context).pop(false);
                },
              ),
              ElevatedButton(
                style: TextButton.styleFrom(
                  textStyle: Theme.of(context).textTheme.labelLarge,
                  backgroundColor: Colors.cyan,
                  foregroundColor: Colors.white,
                ),
                child: const Text('Confirmar'),
                onPressed: () {
                  Navigator.of(context).pop(true);
                },
              ),
            ]);
      });
}
