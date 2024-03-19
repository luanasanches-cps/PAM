import 'package:flutter/material.dart';

//inicializa meu "app" no navegador
void main() => runApp(const Aplicacao());

class Aplicacao extends StatelessWidget {
  const Aplicacao({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    //Criando variável para o tema
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;
    final linkStyle = textTheme.bodyMedium?.copyWith(
      decoration: TextDecoration.underline,
    );

    return Scaffold(
      appBar: AppBar(
        title: const Text('Autenticação'),
        backgroundColor: theme.colorScheme.inversePrimary,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          //Ocupa a tela toda, empurrando a ultima row para baixo
          Expanded(
            child: Column(
              //Layout do usuario fica no centro
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(
                  width: 350,
                  child: TextField(
                    decoration: InputDecoration(
                      labelText: 'Usuário',
                    ),
                  ),
                ),
                const SizedBox(
                  width: 350,
                  child: TextField(
                    decoration: InputDecoration(
                      labelText: 'Senha',
                    ),
                  ),
                ),
                Container(
                  //Adicionar um container para separar o
                  //botão do texto
                  width: 350,
                  margin: const EdgeInsets.only(top: 10, bottom: 5),
                  child: ElevatedButton(
                    onPressed: () {},
                    child: const Text('Entrar'),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      'Precisa de ajuda?',
                      style: linkStyle,
                    ),
                    Text(
                      'Cadastrar',
                      style: linkStyle,
                    ),
                  ],
                ),
              ],
            ),
          ),
          const Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text('2H3'),
                  Text('PAMI'),
                  Text('2024'),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
