
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:file_picker/file_picker.dart';

import 'editor_screen.dart';
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
              onPressed: () => openExistingFile(context),
              child: Text("Ouvrir un fichier existant"),
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
Future<void> openExistingFile(BuildContext context) async {
  final result = await FilePicker.pickFiles(withData: true);

  if (result != null) {
    final file = result.files.first;

    if (file.bytes == null) {
      print("Impossible de lire le contenu du fichier sur Web");
      return;
    }

    final content = String.fromCharCodes(file.bytes!);
    openEditorScreen(context, file);
  }

}
Future<void> saveCurrentFile(String? existingName, String content) async {
  final fileName = existingName ?? "nouvelle_recette.txt";
  final bytes = utf8.encode(content);

  await FilePicker.saveFile(
    fileName: fileName,
    bytes: bytes,
  );
}



void openEditorScreen(BuildContext context, PlatformFile file) {
  Navigator.push(
    context,
    MaterialPageRoute(
      builder: (_) => EditorScreen(file: file),
    ),
  );
}