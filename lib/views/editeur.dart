import 'package:flutter/material.dart';

class Editeur extends StatefulWidget {
  const Editeur({super.key});

  @override
  State<Editeur> createState() => _EditeurState();
}

class _EditeurState extends State<Editeur> {
  var nbClicks = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Editeur de texte"),
        backgroundColor: Theme.of(context).colorScheme.primaryContainer,
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,

        ),
      ),
    );
  }
}