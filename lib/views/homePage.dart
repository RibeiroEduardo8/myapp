import 'package:flutter/material.dart';
import 'package:myapp/respositories/books.dart';
import 'package:myapp/views/accessBookPage.dart';
import 'package:myapp/views/addBookPage.dart';
import 'package:myapp/views/editBookPage.dart';
import 'package:provider/provider.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Gerenciamento de Livros"),
      ),
      body: Consumer<Books>(
        builder: (context, books, child) {
          return ListView.builder(
            itemCount: books.all.length,
            itemBuilder: (context, index) {
              final book = books.all[index];
              return ListTile(
                title: Text(book.name),
                subtitle: Text(book.sinopse),
                leading: Image.network(book.image),
                trailing: Row(mainAxisSize: MainAxisSize.min, children: [
                  IconButton(
                    icon: Icon(Icons.edit, color: Colors.yellow),
                    onPressed: () {
                      Navigator.of(context)
                          .push(MaterialPageRoute(builder: (_) {
                        return EditBookPage();
                      }));
                    },
                  ),
                  IconButton(
                    icon: Icon(Icons.delete, color: Colors.red),
                    onPressed: () async {
                      bool removed = await _dialogBuilder(context) ?? false;
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
        child: Icon(Icons.add),
        onPressed: () {
          Navigator.of(context).push(MaterialPageRoute(builder: (_) {
            return AddBookPage();
          }));
        },
      ),
    );
  }
}

Future<bool?> _dialogBuilder(BuildContext context) {
  return showDialog<bool>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
            title: const Text('Deseja realmente excluir?'),
            content: const Text(
              'Essa ação não pode ser defeita!\n',
            ),
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
