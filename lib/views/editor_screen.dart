import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';

import 'first_screen.dart';

class EditorScreen extends StatefulWidget {
  final PlatformFile? file;

  const EditorScreen({super.key, this.file});

  @override
  State<EditorScreen> createState() => _EditorScreenState();
}

class _EditorScreenState extends State<EditorScreen> {
  late TextEditingController controller;

  @override
  void initState() {
    super.initState();
    controller = TextEditingController(
      text: widget.file?.bytes != null
          ? String.fromCharCodes(widget.file!.bytes!)
          : "",
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.file?.name ?? "nouvelle_recette.txt"),
        actions: [
          IconButton(
            icon: Icon(Icons.save),
            onPressed: () {
              saveCurrentFile(
                widget.file?.name,
                controller.text,
              );
            },
          ),
        ],
      ),
      body: TextField(
        controller: controller,
        maxLines: null,
        expands: true,
      ),
    );
  }
}

