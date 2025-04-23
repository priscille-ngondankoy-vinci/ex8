import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import 'dart:convert'; // pour utf8.decode

import 'editor_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  Future<void> _openFile(BuildContext context) async {
    final result = await FilePicker.platform.pickFiles(withData: true);

    if (result != null && result.files.isNotEmpty) {
      final file = result.files.first;
      final fileName = file.name;
      final fileContent = utf8.decode(file.bytes!);

      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => EditorScreen(
            fileName: fileName,
            content: fileContent,
          ),
        ),
      );
    }
  }

  void _createNewFile(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const EditorScreen(
          fileName: 'fichier.txt',
          content: '',
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Accueil')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () => _openFile(context),
              child: const Text('Ouvrir un fichier existant'),
            ),
            ElevatedButton(
              onPressed: () => _createNewFile(context),
              child: const Text('Créer un nouveau fichier texte'),
            ),
            ElevatedButton(onPressed: () => const EditorScreen(fileName: 'fichier.txt', content: 'Mon fichier sauvegardé',), child: const Text('mon fichier sauvégardé',
        ),
      ),
    ]
    )
    ));
  }
}
