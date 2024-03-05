import 'dart:math';

import 'package:flutter/material.dart';

//Essa classe representa o widget responsável
//por gerir todo o app.
class Aplicacao extends StatelessWidget {
  const Aplicacao({super.key});

//Método onde devemos indicar o que nosso widget
//irá apresentar como: sua composição e o que ele
//mostra ao usuário.
  @override
  Widget build(BuildContext context) {
    //Classe MaterialAapp: Classe que segue regras
    //do material (material.io) e sabe gerenciar um app
    //como um todo.
    return const MaterialApp(
      //Estou dizendo que quando rodar a aplicação
      //vai rodar a HomePage
      home: HomePage(),
    );
  }
}

//Essa classe representa o widget onde vamos montar
//a nossa tela.
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    //Área básica para criar uma página
    return Scaffold(
      appBar: AppBar(
        title: const Text("Luana"),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: SizedBox(
        width: double.maxFinite,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            //Calcula automático caso eu coloque apenas largura
            //ou altura, mas é obrigatório conter um dos dois
            //e o child.
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  width: 150,
                  height: 150,
                  child: Container(
                    //Através do BoxDecoration, podemos customizar
                    //o aspecto visual de um Container.
                    decoration: BoxDecoration(
                      color: geraCorAaleatoria(),
                    ),
                  ),
                ),
                SizedBox(
                  width: 150,
                  height: 150,
                  child: Container(
                    decoration: BoxDecoration(
                      color: geraCorAaleatoria(),
                    ),
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  width: 150,
                  height: 150,
                  child: Container(
                    decoration: BoxDecoration(
                      color: geraCorAaleatoria(),
                    ),
                  ),
                ),
                SizedBox(
                  width: 150,
                  height: 150,
                  child: Container(
                    decoration: BoxDecoration(
                      color: geraCorAaleatoria(),
                    ),
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  width: 150,
                  height: 150,
                  child: Container(
                    decoration: BoxDecoration(
                      color: geraCorAaleatoria(),
                    ),
                  ),
                ),
                SizedBox(
                  width: 150,
                  height: 150,
                  child: Container(
                    decoration: BoxDecoration(
                      color: geraCorAaleatoria(),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

//Escolhe uma cor aleatoriamente
Color geraCorAaleatoria() {
  final random = Random();

  return Color.fromARGB(
      255, random.nextInt(256), random.nextInt(256), random.nextInt(256));
}

//todo projeto em dart começa a execução pelo
//método main
void main() => runApp(const Aplicacao());
