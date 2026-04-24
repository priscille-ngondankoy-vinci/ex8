import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class FirstScreen extends StatefulWidget {
  const FirstScreen({super.key});

  @override
  State<FirstScreen> createState() => _FirstScreenState();
}

class _FirstScreenState extends State<FirstScreen> {
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
          children: [



            const SizedBox(height: 16),
          ElevatedButton(
            onPressed: () => context.go("/editeur"),
            child: const Text("Ouvrir un fichier de texte existant"),
          ),
          ElevatedButton(
          onPressed: () => context.go("/editeur"),
            child: const Text("Créer un nouveau fichier texte"),
    ),
          ],
        ),
      ),
    );
  }
}