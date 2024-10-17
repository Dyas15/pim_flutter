import 'package:flutter/material.dart';
import 'package:flutter_masked_text2/flutter_masked_text2.dart';
import 'package:teste/functions/trocarPagina.dart';
import 'package:teste/functions/validarCPF.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  bool _mostrarOlinho = true;
  static const Color corPadrao = Color.fromRGBO(4, 56, 63, 1);
  static const Color corBranca = Colors.white;
  final _usuarioController = MaskedTextController(mask: '000.000.000-00');

  final _formKey = GlobalKey<FormState>();
  final TextEditingController _senhaController = TextEditingController();

  void _olinho() {
    setState(() {
      _mostrarOlinho = !_mostrarOlinho;
    });
  }

  void _validarFormulario() {
    if (_formKey.currentState!.validate()) {
      trocarPagina(context, 'menu');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        iconTheme: const IconThemeData(color: Colors.white),
        elevation: 0,
      ),
      backgroundColor: corPadrao,
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(13.0),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset('images/logo_pequena.png', fit: BoxFit.fill),
                TextFormField(
                  controller: _usuarioController,
                  decoration: InputDecoration(
                    prefixIcon: const Icon(Icons.person),
                    prefixIconColor: corBranca,
                    labelText: 'CPF',
                    labelStyle: const TextStyle(color: corBranca),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(50),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(50),
                      borderSide: const BorderSide(
                        color: corBranca,
                        width: 2.0,
                      ),
                    ),
                  ),
                  style: const TextStyle(color: corBranca),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Digite o CPF!';
                    }

                    String cpf = value.replaceAll(RegExp(r'[^\d]'), '');
                    if (validarCPF(cpf) == false) {
                      return 'Digite um CPF válido!';
                    }
                    return null;
                  },
                ),
                const Padding(padding: EdgeInsets.all(10)),
                TextFormField(
                  controller: _senhaController,
                  maxLength: 100,
                  obscureText: _mostrarOlinho,
                  decoration: InputDecoration(
                    counterText: '',
                    prefixIcon: const Icon(Icons.lock, color: corBranca),
                    labelText: 'Senha',
                    labelStyle: const TextStyle(color: corBranca),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(50),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(50),
                      borderSide: const BorderSide(
                        color: corBranca,
                        width: 2.0,
                      ),
                    ),
                    suffixIcon: IconButton(
                      icon: Icon(
                        _mostrarOlinho
                            ? Icons.visibility
                            : Icons.visibility_off,
                        color: corBranca,
                      ),
                      onPressed: _olinho,
                    ),
                  ),
                  style: const TextStyle(color: corBranca),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Digite a senha';
                    }
                    return null;
                  },
                ),
                const Padding(padding: EdgeInsets.all(4)),
                GestureDetector(
                  onTap: () {
                    trocarPagina(context, 'esqueci');
                  },
                  child: const Text(
                    'Esqueceu a senha?',
                    style: TextStyle(color: corBranca),
                  ),
                ),
                const SizedBox(height: 40),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: corBranca,
                    foregroundColor: corPadrao,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(32.0),
                    ),
                    fixedSize: const Size(200, 60),
                  ),
                  onPressed: _validarFormulario,
                  child: const Text(
                    'Entrar',
                    style: TextStyle(fontSize: 19),
                  ),
                ),
                const Padding(padding: EdgeInsets.all(4)),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
