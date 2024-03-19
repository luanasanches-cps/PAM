import 'dart:html';

import 'package:flutter/material.dart';

void main() => runApp(const Aplicacao());

//A classe principal vai chamar a classe que está embaixo
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
    //Colocamos um controlador aqui, esses controladores irão
    //controlar o que o usuario informar
    final usuarioController = TextEditingController(text: '');
    // ignore: non_constant_identifier_names
    final PasswordController = TextEditingController(text: '');

    //Página
    return Scaffold(
      appBar: AppBar(
        //Essa parte seria tipo um "Cabeçalho"
        title: const Text('Home'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      //Criamos uma coluna em volta da tela
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          const Text('Login'),
          //Nessa coluna criamos outra coluna para agrupar nossos outros
          //componentes e deixamos apenas o Login de fora.
          Center(
            //Colocamos o SizedBox dentro de um Center, para centralizar
            child: SizedBox(
              //Colocamos a coluna dentro de um SizedBox para estabelecer tamanho
              width: 400,
              child: Column(
                children: [
                  //O TextField seria um texto onde o usuário conseguirá escrever
                  TextField(
                    //aqui colocamos os controladores
                    controller: usuarioController,
                    decoration: const InputDecoration(
                      labelText: 'Usuário',
                    ),
                  ),
                  TextField(
                    //aqui colocamos os controladores
                    controller: PasswordController,
                    decoration: const InputDecoration(
                      labelText: 'Senha',
                    ),
                    obscureText: true,
                  ),
                  //Botão que aparecerá na página
                  Container(
                    width: double.maxFinite,
                    margin: const EdgeInsets.only(top: 10, bottom: 5),
                    child: ElevatedButton(
                      onPressed: () {
                        //Aqui agora colocamos as variaveis e de onde elas vem
                        final usuario = usuarioController.text;
                        final senha = PasswordController.text;
                        var message = 'Credenciais inválidas!';

                        //usamos o if para validar o que o usuario colocou
                        if (usuario == 'admin' && senha == '102030') {
                          message = 'Seja bem-vindo, Administrador!';
                        }
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text(message)),
                        );
                      },
                      child: const Text('Entrar'),
                    ),
                  ),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Esqueci a senha'),
                      Text('Cadastrar'),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
