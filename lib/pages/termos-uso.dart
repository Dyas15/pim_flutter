import 'package:flutter/material.dart';

class TermosUso extends StatefulWidget {
  const TermosUso({super.key});

  @override
  State<TermosUso> createState() => _TermosUsoState();
}

class _TermosUsoState extends State<TermosUso> {
  static const Color corPadrao = Color.fromRGBO(4, 56, 63, 1);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: corPadrao,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        iconTheme: const IconThemeData(color: Colors.white),
        elevation: 3,
        title: const Text(
          'Termo de uso',
          style: TextStyle(
            color: Colors.white,
            fontSize: 28,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(13.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Divider(
              color: Colors.white,
              thickness: 1,
            ),
            const SizedBox(height: 16),
            const Text(
              'Termos de Uso do Aplicativo Diogo Farm’s',
              style: TextStyle(
                fontSize: 19,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 24),
            _titulo('1. Aceitação dos Termos'),
            _conteudo(
              'Ao acessar e utilizar o aplicativo Diogo Farm’s, você concorda em cumprir com estes Termos de Uso. Recomendamos que leia atentamente cada seção, pois o uso continuado do app implica na aceitação integral das condições aqui descritas.',
            ),
            const SizedBox(height: 24),
            _titulo('2. Descrição dos Serviços'),
            _conteudo(
              'O Diogo Farm’s é um aplicativo que oferece produtos orgânicos cultivados em ambiente urbano, proporcionando ao usuário uma forma prática de adquirir alimentos frescos e saudáveis. Todos os produtos são cultivados sob supervisão rigorosa para garantir qualidade e segurança.',
            ),
            const SizedBox(height: 24),
            _titulo('3. Cadastro e Conta'),
            _conteudo(
              'Para utilizar determinados serviços, você poderá ser solicitado a criar uma conta, fornecendo dados como nome, endereço e informações de pagamento. É de responsabilidade do usuário manter esses dados atualizados e corretos. Não nos responsabilizamos por informações desatualizadas ou incorretas fornecidas pelo usuário.',
            ),
            const SizedBox(height: 24),
            _titulo('4. Compras e Pagamentos'),
            _conteudo(
              'O usuário poderá realizar compras através do app, conforme a disponibilidade de produtos. Pagamentos serão processados por meio das plataformas integradas ao aplicativo, e será fornecido um comprovante digital. Em caso de cancelamentos e reembolsos, consulte nossa política específica para cada tipo de compra.',
            ),
            const SizedBox(height: 24),
            _titulo('5. Coleta e Tratamento de Dados Pessoais - Conformidade com a LGPD'),
            _conteudo(
              'Estamos comprometidos com a proteção dos dados pessoais dos nossos usuários em conformidade com a Lei Geral de Proteção de Dados Pessoais (LGPD). Adotamos medidas de segurança apropriadas para proteger seus dados pessoais contra acessos não autorizados, perda, alteração ou destruição.',
            ),
            const SizedBox(height: 24),
            _titulo('6. Responsabilidades e Obrigações dos Usuários'),
            _conteudo(
              'Os usuários devem usar o aplicativo de forma ética e responsável, comprometendo-se a não realizar atividades ilícitas, fraudes ou outros usos que possam prejudicar o funcionamento e a segurança do app.',
            ),
            const SizedBox(height: 24),
            _titulo('7. Limitação de Responsabilidade'),
            _conteudo(
              'Diogo Farm’s não se responsabiliza por atrasos, falhas de entrega causadas por terceiros ou qualquer situação fora de nosso controle direto. Nossa responsabilidade é limitada ao valor da transação em questão.',
            ),
            const SizedBox(height: 24),
            _titulo('8. Alterações dos Termos'),
            _conteudo(
              'Reservamo-nos o direito de atualizar estes Termos de Uso periodicamente. Notificaremos os usuários sobre quaisquer alterações significativas. O uso contínuo do app após tais alterações implicará na aceitação dos novos termos.',
            ),
          ],
        ),
      ),
    );
  }

  Widget _titulo(String title) {
    return Text(
      title,
      style: const TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.bold,
        color: Colors.white,
      ),
    );
  }

  Widget _conteudo(String content) {
    return Text(
      content,
      textAlign: TextAlign.justify,
      style: const TextStyle(
        fontSize: 16,
        color: Colors.white,
      ),
    );
  }
}
