import 'package:flutter/material.dart';
import 'package:myapp/models/book.dart';
import 'package:url_launcher/url_launcher.dart';

class AccessBookPage extends StatelessWidget {
  const AccessBookPage(this._book, {Key? key}) : super(key: key);
  final Book _book;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Sobre o livro"),
      ),
      body: Container(
        padding: EdgeInsets.all(15),
        alignment: Alignment.center,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Text(
                _book.name,
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 25.0), // textAlign: TextAlign.center,
              ),
              SizedBox(height: 30),
              Image.network(
                  _book.image,),
              SizedBox(height: 20),
              ElevatedButton(
                child: Text("Comprar na amazon"),
                onPressed: () async {
                  final url = Uri.parse(_book.link);
                  if (await canLaunchUrl(url)) {
                    await launchUrl(url);
                  } else {
                    throw 'Could not launch $url';
                  }
                },

              // InkWell(
              //     child: Text(
              //       'Abrir no navegador',
              //       style: TextStyle(fontSize: 18.0),
              //     ),
              //     onTap: () => launchUrl(Uri(
              //         host:
              //             'https://www.amazon.com.br/Homem-Aranha-Eternamente-jovem-Stefan-Petrucha-ebook/dp/B09JVFRX7D'))),
          )],
          ),
        ),
      ),
    );
  }
}
