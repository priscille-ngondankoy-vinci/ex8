import 'package:flutter/material.dart';

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

  void _saveFile() {
    // À faire plus tard : sauvegarde réelle
    Navigator.pop(context);
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
