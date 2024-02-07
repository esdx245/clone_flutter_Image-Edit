import 'dart:io';

import 'package:flutter/material.dart';

class EditImageScreen extends StatefulWidget {
  const EditImageScreen({super.key, required this.slectedImage});
  final String slectedImage;

  @override
  State<EditImageScreen> createState() => _EditImageScreenState();
}

class _EditImageScreenState extends State<EditImageScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Image.file(File(widget.slectedImage)),
    );
  }
}
