import 'package:library_app/auth/checagem.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class CadastroPage extends StatefulWidget {
  const CadastroPage({super.key});

  @override
  State<CadastroPage> createState() => _CadastroPageState();
}

class _CadastroPageState extends State<CadastroPage> {

  // Controllers
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _firebaseAuth = FirebaseAuth. instance;

  // Página
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cadastro Page'),
      ),

      body: ListView(
        padding: const EdgeInsets.all(12),
        children: [
          TextFormField(
            controller: _nameController,
            decoration: const InputDecoration(
              label: Text('Nome Completo')
            ),
          ),

          TextFormField(
            controller: _emailController,
            decoration: const InputDecoration(
              label: Text('E-mail')
            ),
          ),

          TextFormField(
            controller: _passwordController,
            decoration: const InputDecoration(
              label: Text('Senha')
            ),
          ),
        
          ElevatedButton(onPressed: () {
            cadastrar();
          }, child: const Text('Cadastrar'))

          
        ],
      )
    );
  }

  cadastrar() async {

    try {
      UserCredential userCredential = await _firebaseAuth.createUserWithEmailAndPassword(
        email: _emailController.text, password: _passwordController.text);

      if(userCredential != null) {
        userCredential.user!.updateDisplayName(_nameController.text);
        Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(
            builder: (context) => const Checagem(),
          ),
          (route) => false);
      }

    } on FirebaseAuthException catch (e) { // Erros
      // Senha Fraca
      if (e.code == 'weak-password') {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Senha Fraca'),
            backgroundColor: Colors.redAccent,
          
          )
        );
      } else

      // E-mail já usado
      if (e.code == 'email-already-in-use') {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Este e-mail já foi cadastrado'),
            backgroundColor: Colors.redAccent,
          
          )
        );
      }
    }

  }
}