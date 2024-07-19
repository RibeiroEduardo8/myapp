import 'package:firebase_auth/firebase_auth.dart';

class AutenticarUsuario {
  FirebaseAuth _auth = FirebaseAuth.instance;

  Future<String?> cadastrarUsuario(
      String nome, String email, String password) async {
    try {
      UserCredential userCredential = await _auth
          .createUserWithEmailAndPassword(email: email, password: password);
      await userCredential.user!.updateDisplayName(nome);
      return null;
    } on FirebaseAuthException catch (e) {
      print(e.code);
      return "Erro ao cadastrar usuário";
    }
  }

  Future<String?> logarUsuario(String email, String password) async {
    try {
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      return null;
    } on FirebaseAuthException catch (e) {
      return e.message;
    }
  }

  Future<void> deslogarUsuario() async {
    await _auth.signOut();
  }
}
