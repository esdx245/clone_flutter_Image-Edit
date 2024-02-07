import 'package:clone_image_edit/screens/edit_image_screen.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: IconButton(
        icon: const Icon(Icons.upload_file),
        onPressed: () async {
          XFile? file = await ImagePicker().pickImage(
            source: ImageSource.gallery,
          );
          if (file != null) {
            Navigator.of(context).push(MaterialPageRoute(
                builder: (context) =>
                    EditImageScreen(slectedImage: file.path)));
          }
        },
      )),
    );
  }
}
