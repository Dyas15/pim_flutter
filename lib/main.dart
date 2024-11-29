import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:teste/Provider/salvar.dart';
import 'package:teste/pages/splash.dart';

void main() {
  runApp(const DiogoFarms());
}

class DiogoFarms extends StatelessWidget {
  const DiogoFarms({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => LoginProvider(),
      child: MaterialApp(
        title: 'Diogo Farms',
        debugShowCheckedModeBanner: false,
        initialRoute: '/',
        routes: {
          '/': (context) => const TelaSplash(),
        },
      ),
    );
  }
}
