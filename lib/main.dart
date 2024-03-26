import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

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
    //Criando váriaveis
    final num1Controller = TextEditingController();
    final num2Controller = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Soma'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: Padding(
        padding: const EdgeInsets.all(150),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            TextField(
              controller: num1Controller,
              decoration: const InputDecoration(
                labelText: ('Número 1'),
              ),
              //Para que o usuario não consiga digitar letras
              keyboardType: TextInputType.number,
              inputFormatters: [
                FilteringTextInputFormatter.digitsOnly,
              ],
            ),
            TextField(
              controller: num2Controller,
              decoration: const InputDecoration(labelText: ('Número 2')),
              //Para que o usuario não consiga digitar letras
              keyboardType: TextInputType.number,
              inputFormatters: [
                FilteringTextInputFormatter.digitsOnly,
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  //Posso criar minha lógica aqui dentro mas é recomendado q não
                  onPressed: () => soma(
                    context,
                    num1Controller.text,
                    num2Controller.text,
                  ),
                  child: const Text('+'),
                ),
                ElevatedButton(
                  onPressed: () => subtrair(
                    context,
                    num1Controller.text,
                    num2Controller.text,
                  ),
                  child: const Text('-'),
                ),
                ElevatedButton(
                  onPressed: () => multiplicao(
                    context,
                    num1Controller.text,
                    num2Controller.text,
                  ),
                  child: const Text('*'),
                ),
                ElevatedButton(
                  onPressed: () => divisao(
                    context,
                    num1Controller.text,
                    num2Controller.text,
                  ),
                  child: const Text('/'),
                ),
                ElevatedButton(
                  onPressed: () => (
                    context,
                    num1Controller.text = '',
                    num2Controller.text = '',
                  ),
                  child: const Text('Limpar'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

void soma(BuildContext context, String valor1, valor2) {
  final num1 = int.parse(valor1);
  final num2 = int.parse(valor2);
  final mensagem = '$num1 + $num2 = ${num1 + num2}';

  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(mensagem)));
}

void subtrair(BuildContext context, String valor1, valor2) {
  final num1 = int.parse(valor1);
  final num2 = int.parse(valor2);
  final mensagem = '$num1 - $num2 = ${num1 - num2}';

  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(mensagem)));
}

void multiplicao(BuildContext context, String valor1, valor2) {
  final num1 = int.parse(valor1);
  final num2 = int.parse(valor2);
  final mensagem = '$num1 * $num2 = ${num1 * num2}';

  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(mensagem)));
}

void divisao(BuildContext context, String valor1, valor2) {
  final num1 = int.parse(valor1);
  final num2 = int.parse(valor2);
  final mensagem = '$num1 / $num2 = ${num1 / num2}';

  if (num2 == 0) {
    ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Não é possível fazer divisão por 0')));
  } else {
    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text(mensagem)));
  }
}

void main() => runApp(const Aplicacao());
