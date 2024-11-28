import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Perfil extends StatefulWidget {
  const Perfil({super.key});

  @override
  State<Perfil> createState() => _PerfilState();
}

class _PerfilState extends State<Perfil> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(4, 56, 63, 1),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Color.fromRGBO(4, 56, 63, 1),
        foregroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(12),
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                      image: const DecorationImage(
                        image: AssetImage('images/paisagem.png'), 
                        fit: BoxFit
                            .cover, 
                      ),
                    ),
                    height: 150,
                    width: MediaQuery.of(context).size.width,
                  ),
                  Container(
                    padding: EdgeInsets.only(top: 130),
                    child: CircleAvatar(
                      backgroundColor: Colors.white,
                      radius: 55,
                      child: CircleAvatar(
                        child: Stack(
                          children: [
                            Container(
                              padding: EdgeInsets.only(top: 50, left: 80),
                              child: CircleAvatar(
                                backgroundColor: Colors.white,
                                radius: 10,
                                child: Center(
                                  child: Icon(
                                    color: Colors.black,
                                    Icons.edit,
                                    size: 10,
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                        backgroundImage: AssetImage('images/logo_pequena.png'),
                        radius: 50,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                "Adm da Silva",
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w400,
                  fontSize: 18,
                ),
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              margin: const EdgeInsets.symmetric(horizontal: 15),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
              ),
              child: const Padding(
                padding: EdgeInsets.all(15.0),
                child: Column(
                  children: [
                    ListTile(
                      title: Text(
                        "Nome completo",
                        style: TextStyle(color: Colors.black, fontSize: 15),
                      ),
                      subtitle: Text(
                        "Adm da Silva",
                        style: TextStyle(color: Colors.black, fontSize: 18),
                      ),
                    ),
                    Divider(color: Colors.black),
                    ListTile(
                      title: Text(
                        "E-mail",
                        style: TextStyle(color: Colors.black, fontSize: 15),
                      ),
                      subtitle: Text(
                        "adm.silva@email.com",
                        style: TextStyle(color: Colors.black, fontSize: 18),
                      ),
                    ),
                    Divider(color: Colors.black),
                    ListTile(
                      title: Text(
                        "Senha",
                        style: TextStyle(color: Colors.black, fontSize: 15),
                      ),
                      subtitle: Text(
                        "********",
                        style: TextStyle(color: Colors.black, fontSize: 18),
                      ),
                    ),
                    Divider(color: Colors.black),
                    ListTile(
                      title: Text(
                        "Confirmar Senha",
                        style: TextStyle(color: Colors.black, fontSize: 15),
                      ),
                      subtitle: Text(
                        "********",
                        style: TextStyle(color: Colors.black, fontSize: 15),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20), // Espaço antes do botão
            ElevatedButton(
              onPressed: () {
                // Lógica de atualização
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('Informações atualizadas!'),
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white,
                foregroundColor: Color.fromRGBO(4, 56, 63, 1),
                padding:
                    const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
              child: const Text("Atualizar"),
            ),
            const SizedBox(height: 20), // Espaço após o botão
          ],
        ),
      ),
    );
  }
}
