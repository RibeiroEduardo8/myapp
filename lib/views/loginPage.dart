import 'package:flutter/material.dart';
import 'package:provider/single_child_widget.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final nameController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  bool _logar = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
            padding: EdgeInsets.all(20),
            child: Form(
              key: _formKey,
              child: Column(children: [
                Text(
                  "Bem Vindo!",
                  style: TextStyle(
                      color: Colors.cyan,
                      fontSize: 25,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 20),
                if (!_logar)
                  TextFormField(
                    controller: nameController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Por favor, insira um nome válido';
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                        hintText: "Seu nome", labelText: "Nome"),
                  ),
                TextFormField(
                  controller: emailController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Por favor, insira um email válido';
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                      hintText: "Seu email", labelText: "Email"),
                ),
                TextFormField(
                  controller: passwordController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Por favor, insira uma senha válida';
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                      hintText: "Sua senha", labelText: "Senha"),
                  obscureText: true,
                ),
                SizedBox(height: 15),
                ElevatedButton(
                  onPressed: () {
                    validarCampos();
                  },
                  child: Text((_logar ? "Logar" : "Cadastrar")),
                ),
                SizedBox(height: 25),
                TextButton(
                  onPressed: () {
                    setState(() {
                      _logar = !_logar;
                    });
                  },
                  child: Text((_logar
                      ? "Não tem uma conta? Cadastre-se"
                      : "Já tem uma conta? Faça login")),
                )
              ]),
            )),
      ),
    );
  }

  void validarCampos() {
    if (_formKey.currentState!.validate()) {
      print("Funcionou");
    }
  }
}
