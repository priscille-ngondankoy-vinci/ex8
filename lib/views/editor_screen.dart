import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';

class EditorScreen extends StatelessWidget {
  final PlatformFile file;

  const EditorScreen({super.key, required this.file});

  @override
  Widget build(BuildContext context) {
    final content = String.fromCharCodes(file.bytes!);
    if (file.bytes != null) {
      final content = String.fromCharCodes(file.bytes!);
    }


    return Scaffold(
      appBar: AppBar(title: Text(file.name)),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: TextField(
          controller: TextEditingController(text: content),
          maxLines: null,
          expands: true,
          decoration: const InputDecoration(border: OutlineInputBorder()),
        ),
      ),
    );
  }
}
