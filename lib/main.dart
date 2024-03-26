import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';

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
    final valorController = TextEditingController();
    final jurosController = TextEditingController();
    final pagtoController = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Empréstimo'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: Padding(
        padding: const EdgeInsets.all(100),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            TextField(
              controller: valorController,
              decoration: const InputDecoration(
                labelText: ('Valor'),
              ),
              keyboardType: TextInputType.number,
              inputFormatters: decimalNumber(),
            ),
            TextField(
              controller: jurosController,
              decoration: const InputDecoration(
                labelText: ('Taxa de Juros'),
              ),
              keyboardType: TextInputType.number,
              inputFormatters: decimalNumber(),
            ),
            TextField(
              controller: pagtoController,
              decoration: const InputDecoration(
                labelText: ('Quantidade Pagamento'),
              ),
              keyboardType: TextInputType.number,
              inputFormatters: [
                FilteringTextInputFormatter.digitsOnly,
              ],
            ),
            ElevatedButton(
              onPressed: () => emprestimo(
                context,
                valorController.text,
                jurosController.text,
                pagtoController.text,
              ),
              child: const Text('Calcular'),
            ),
          ],
        ),
      ),
    );
  }

  void emprestimo(BuildContext context, String valor1, valor2, valor3,) {
    final valor = double.parse(valor1);
    final juros = double.parse(valor2);
    final pagto = int.parse(valor3);
    final mensagem = 'Total à ser pago: ${valor * (juros / 100) * pagto}';

    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text(mensagem)));
  }

  List<TextInputFormatter> decimalNumber() => [
        FilteringTextInputFormatter.allow(RegExp(r'[0-9.]')),
        TextInputFormatter.withFunction((oldValue, newValue) {
          final text = newValue.text;

          if (text.isEmpty) {
            return newValue;
          } else if (double.tryParse(text) == null) {
            return oldValue;
          } else {
            return newValue;
          }
        }),
      ];
}

void main() => runApp(const Aplicacao());

final formatter = NumberFormat.currency(
  locale: "pt-BR",
  symbol: "R\$",
);
