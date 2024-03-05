import 'dart:math';

import 'package:flutter/material.dart';

class Aplicacao extends StatelessWidget {
  const Aplicacao({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: HomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Luana"),
        actions: [
          IconButton(
            onPressed: () => setState(() {}),
            icon: const Icon(Icons.refresh),
          ),
        ],
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: SizedBox(
        width: double.maxFinite,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            umacaixa(),
            duasCaixas(),
            tresCaixas(),
            duasCaixas(),
            umacaixa(),
          ],
        ),
      ),
    );
  }
}

Widget linha(List<Widget> items) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    children: items,
  );
}

Widget umacaixa() {
  return SizedBox(
    width: 75,
    height: 75,
    child: Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            geraCorAaleatoria(),
            geraCorAaleatoria(),
          ],
        ),
      ),
    ),
  );
}

Widget duasCaixas() {
  return linha([
    umacaixa(),
    umacaixa(),
  ]);
}

Widget tresCaixas() {
  return linha([
    umacaixa(),
    umacaixa(),
    umacaixa(),
  ]);
}

Color geraCorAaleatoria() {
  final random = Random();

  return Color.fromARGB(
      255, random.nextInt(256), random.nextInt(256), random.nextInt(256));
}

void main() => runApp(const Aplicacao());
