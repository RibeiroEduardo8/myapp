import 'package:flutter/material.dart';
import 'package:myapp/respositories/books.dart';
import 'package:myapp/themes/themes.dart';
import 'package:myapp/views/homePage.dart';
import 'package:myapp/views/loginPage.dart';
import 'package:provider/provider.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
  options: DefaultFirebaseOptions.currentPlatform,
);
  runApp(
    ChangeNotifierProvider(
      create: (context) => Books(),
      child: MaterialApp(
        theme: Themes.light,
        title: "Books",
        debugShowCheckedModeBanner: false,
        home: LoginPage(),
      ),
    ),
  );
}
