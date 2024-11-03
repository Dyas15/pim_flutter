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
      body: const SingleChildScrollView(
        padding: EdgeInsets.all(13.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Divider(
              color: Colors.white,
              thickness: 1,
              indent: 10,
              endIndent: 10,
            ),
            SizedBox(height: 16),
            Text(
              'Termos de Uso do Aplicativo Diogo Farm’s',
              style: TextStyle(
                fontSize: 19,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            SizedBox(height: 24),
            Text(
              '1. Aceitação dos Termos',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            SizedBox(height: 8),
            Text(
              'Ao acessar e utilizar o aplicativo Diogo Farm’s, você concorda em cumprir com estes Termos de Uso. Recomendamos que leia atentamente cada seção, pois o uso continuado do app implica na aceitação integral das condições aqui descritas.',
              style: TextStyle(
                fontSize: 16,
                color: Colors.white,
              ),
            ),
            SizedBox(height: 24),
            Text(
              '2. Descrição dos Serviços',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            SizedBox(height: 8),
            Text(
              'O Diogo Farm’s é um aplicativo que oferece produtos orgânicos cultivados em ambiente urbano, proporcionando ao usuário uma forma prática de adquirir alimentos frescos e saudáveis. Todos os produtos são cultivados sob supervisão rigorosa para garantir qualidade e segurança.',
              style: TextStyle(
                fontSize: 16,
                color: Colors.white,
              ),
            ),
            SizedBox(height: 24),
            Text(
              '3. Cadastro e Conta',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            SizedBox(height: 8),
            Text(
              'Para utilizar determinados serviços, você poderá ser solicitado a criar uma conta, fornecendo dados como nome, endereço e informações de pagamento. É de responsabilidade do usuário manter esses dados atualizados e corretos. Não nos responsabilizamos por informações desatualizadas ou incorretas fornecidas pelo usuário.',
              style: TextStyle(
                fontSize: 16,
                color: Colors.white,
              ),
            ),
            SizedBox(height: 24),
            Text(
              '4. Compras e Pagamentos',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            SizedBox(height: 8),
            Text(
              'O usuário poderá realizar compras através do app, conforme a disponibilidade de produtos. '
              'Pagamentos serão processados por meio das plataformas integradas ao aplicativo, e será fornecido um comprovante digital.' 
              'Em caso de cancelamentos e reembolsos, consulte nossa política específica para cada tipo de compra.',
              style: TextStyle(
                fontSize: 16,
                color: Colors.white,
              ),
            ),
            SizedBox(height: 24),
            Text(
              '5. Coleta e Tratamento de Dados Pessoais - Conformidade com a LGPD',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            SizedBox(height: 8),
            Text(
              'Estamos comprometidos com a proteção dos dados pessoais dos nossos usuários em conformidade com a Lei Geral de Proteção de Dados Pessoais (LGPD). '
              'Abaixo estão os principais pontos de nossa política de privacidade e proteção de dados:',
              style: TextStyle(
                fontSize: 16,
                color: Colors.white,
              ),
            ),
            SizedBox(height: 8),
            Text(
              '• Coleta de Dados: Coletamos informações pessoais necessárias para a prestação de serviços, como nome, endereço, e informações de pagamento. Essas informações são utilizadas para processar pedidos, melhorar a experiência do usuário e cumprir obrigações legais.\n\n'
              '• Consentimento: Ao utilizar o app, você nos concede consentimento para coletar, armazenar e tratar seus dados pessoais conforme descrito nestes Termos e em nossa Política de Privacidade. Este consentimento é livre, informado e pode ser revogado a qualquer momento mediante solicitação.\n\n'
              '• Direitos dos Titulares de Dados: De acordo com a LGPD, você possui o direito de acessar, corrigir, atualizar e excluir seus dados pessoais a qualquer momento. Para exercer esses direitos, entre em contato conosco por meio do suporte no app.\n\n'
              '• Compartilhamento de Dados: Não compartilhamos dados pessoais com terceiros sem o seu consentimento, exceto quando necessário para cumprir obrigações legais ou para o funcionamento dos serviços do app (como processadores de pagamento).\n\n'
              '• Segurança da Informação: Adotamos medidas de segurança apropriadas para proteger seus dados pessoais contra acessos não autorizados, perda, alteração ou destruição. Entretanto, ressaltamos que nenhuma plataforma digital é totalmente segura.',
              style: TextStyle(
                fontSize: 16,
                color: Colors.white,
              ),
            ),
            SizedBox(height: 24),
            Text(
              '6. Responsabilidades e Obrigações dos Usuários',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            SizedBox(height: 8),
            Text(
              'Os usuários devem usar o aplicativo de forma ética e responsável, comprometendo-se a não realizar atividades ilícitas, fraudes ou outros usos que possam prejudicar o funcionamento e a segurança do app. ',
              style: TextStyle(
                fontSize: 16,
                color: Colors.white,
              ),
            ),
            SizedBox(height: 24),
            Text(
              '7. Limitação de Responsabilidade',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            SizedBox(height: 8),
            Text(
            'Diogo Farm’s não se responsabiliza por atrasos, falhas de entrega causadas por terceiros ou qualquer situação fora de nosso controle direto. Nossa responsabilidade é limitada ao valor da transação em questão.',
            style: TextStyle(
              fontSize: 16,
              color: Colors.white,
            ),
            ),
            SizedBox(height: 24),
            Text(
              '8. Alterações dos Termos',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            SizedBox(height: 8),
            Text(
              'Reservamo-nos o direito de atualizar estes Termos de Uso periodicamente. Notificaremos os usuários sobre quaisquer alterações significativas. O uso contínuo do app após tais alterações implicará na aceitação dos novos termos.',
              style: TextStyle(
                fontSize: 16,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
