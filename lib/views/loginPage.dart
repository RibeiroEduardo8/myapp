import 'package:flutter/material.dart';
import 'package:myapp/service/autenticarUsuario.dart';

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
  AutenticarUsuario autenticarUsuario = AutenticarUsuario();
  bool _logar = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
            padding: const EdgeInsets.all(20),
            child: Form(
              key: _formKey,
              child: Column(children: [
                const Text(
                  "Bem Vindo!",
                  style: TextStyle(
                      color: Colors.cyan,
                      fontSize: 25,
                      fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 20),
                if (!_logar)
                  TextFormField(
                    controller: nameController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Por favor, insira um nome válido';
                      }
                      return null;
                    },
                    decoration: const InputDecoration(
                      hintText: "Seu nome",
                      labelText: "Nome",
                    ),
                  ),
                TextFormField(
                  controller: emailController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Por favor, insira um email válido';
                    }
                    return null;
                  },
                  decoration: const InputDecoration(
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
                  decoration: const InputDecoration(
                      hintText: "Sua senha", labelText: "Senha"),
                  obscureText: true,
                ),
                const SizedBox(height: 15),
                ElevatedButton(
                  onPressed: () {
                    validarCampos();
                  },
                  child: Text((_logar ? "Logar" : "Cadastrar")),
                ),
                const SizedBox(height: 25),
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
      if (!_logar) {
        autenticarUsuario
            .cadastrarUsuario(nameController.text, emailController.text,
                passwordController.text)
            .then((String? error) {
          if (error == null) {
            SnackBar snackBar = const SnackBar(
              content: Text('Usuário cadastrado com sucesso!'),
              backgroundColor: Colors.green,
              showCloseIcon: true,
            );
            ScaffoldMessenger.of(context).showSnackBar(snackBar);
          } else {
            SnackBar snackBar = const SnackBar(
              content: Text('Usuario já cadastrado!'),
              backgroundColor: Colors.red,
              showCloseIcon: true,
            );
            ScaffoldMessenger.of(context).showSnackBar(snackBar);
            print("Não funcionou");
          }
        });
      } else {
        autenticarUsuario
            .logarUsuario(emailController.text, passwordController.text)
            .then(
          (String? error) {
            if (error == null) {
              SnackBar snackBar = const SnackBar(
                content: Text('Usuário logado com sucesso!'),
                backgroundColor: Colors.green,
                showCloseIcon: true,
              );
              ScaffoldMessenger.of(context).showSnackBar(snackBar);
            } else {
              SnackBar snackBar = const SnackBar(
                content: Text('Usuário não encontrado!'),
                backgroundColor: Colors.red,
                showCloseIcon: true,
              );
              ScaffoldMessenger.of(context).showSnackBar(snackBar);
            }
          },
        );
      }
    }
  }
}
