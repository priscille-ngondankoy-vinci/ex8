import 'dart:typed_data';
import 'dart:convert';
import 'package:flutter/foundation.dart'; // pour kIsWeb
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';

// import conditionnel pour File (mobile/desktop uniquement)
import 'dart:io' as io;

// import pour Web uniquement (Blob, AnchorElement)
import 'dart:html' as html;




class EditorScreen extends StatefulWidget {
  final String fileName;
  final String content;

  const EditorScreen({
    super.key,
    required this.fileName,
    required this.content,
  });

  @override
  State<EditorScreen> createState() => _EditorScreenState();
}

class _EditorScreenState extends State<EditorScreen> {
  late TextEditingController _controller;

  get html => null;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController(text: widget.content);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _saveFile() async {
    final content = _controller.text;
    final fileName = widget.fileName.isNotEmpty ? widget.fileName : 'Nouveau fichier.txt';
    final bytes = Uint8List.fromList(utf8.encode(content));

    if (kIsWeb) {
      // --- WEB ONLY ---
      final blob = html.Blob([bytes]);
      final url = html.Url.createObjectUrlFromBlob(blob);
      final anchor = html.AnchorElement(href: url)
        ..setAttribute('download', fileName)
        ..click();
      html.Url.revokeObjectUrl(url);

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Fichier téléchargé')),
      );
    } else {
      // --- MOBILE / DESKTOP ---
      final path = await FilePicker.platform.saveFile(
        dialogTitle: 'Enregistrer le fichier',
        fileName: fileName,
      );

      if (path != null) {
        final file = io.File(path);
        await file.writeAsBytes(bytes);

        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Fichier sauvegardé avec succès')),
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Sauvegarde annulée')),
        );
      }
    }

    Navigator.pop(context);
  }



  Future<void> saveTextFile(String fileName, String content) async {
    // 1. Transformer le contenu en bytes
    final bytes = Uint8List.fromList(utf8.encode(content));

    // 2. Ouvrir un dialogue de sauvegarde pour choisir le chemin
    final path = await FilePicker.platform.saveFile(
      dialogTitle: 'Enregistrer sous',
      fileName: fileName,
    );
    final blob = html.Blob([bytes]);
    final url = html.Url.createObjectUrlFromBlob(blob);
    final anchor = html.AnchorElement(href: url)
      ..setAttribute('download', fileName)
      ..click();
    html.Url.revokeObjectUrl(url);


    // 3. Si l’utilisateur a choisi un chemin, on écrit les données
    if (path != null) {
      final file = io.File(path);
      await file.writeAsBytes(bytes);
      print('Fichier sauvegardé à : $path');
    } else {
      print('Sauvegarde annulée');
    }
  }







  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.fileName),
        actions: [
          IconButton(
            icon: const Icon(Icons.save),
            onPressed: _saveFile,
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: TextField(
          controller: _controller,
          maxLines: null,
          expands: true,
          decoration: const InputDecoration(
            border: OutlineInputBorder(),
            hintText: 'Écrivez ici...',
          ),
        ),
      ),
    );
  }
}
