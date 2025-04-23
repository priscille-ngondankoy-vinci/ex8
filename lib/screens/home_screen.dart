import 'package:flutter/material.dart';
import 'editor_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Accueil')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                // Navigation avec un faux fichier pour l'instant
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const EditorScreen(
                      fileName: 'fichier.txt',
                      content: '',
                    ),
                  ),
                );
              },
              child: const Text('Ouvrir un fichier existant'),
            ),
            ElevatedButton(
              onPressed: () {
                // Nouvelle navigation, aucun fichier fourni
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const EditorScreen(
                      fileName: 'fichier.txt',
                      content: '',
                    ),
                  ),
                );
              },
              child: const Text('Créer un nouveau fichier texte'),
            ),
          ],
        ),
      ),
    );
  }
}
