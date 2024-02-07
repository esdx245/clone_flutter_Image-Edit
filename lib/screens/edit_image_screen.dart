import 'dart:io';

import 'package:clone_image_edit/widgets/edit_image_viewmodel.dart';
import 'package:flutter/material.dart';

class EditImageScreen extends StatefulWidget {
  const EditImageScreen({super.key, required this.slectedImage});
  final String slectedImage;

  @override
  State<EditImageScreen> createState() => _EditImageScreenState();
}

class _EditImageScreenState extends EditImageViewModel {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Image.file(File(widget.slectedImage)),
      floatingActionButton: _addNewTextFab,
    );
  }

  Widget get _addNewTextFab => FloatingActionButton(
        onPressed: () => addNewDialog(context),
        backgroundColor: Colors.white,
        tooltip: 'Add New Text',
        child: const Icon(
          Icons.edit,
          color: Colors.black,
        ),
      );
}
