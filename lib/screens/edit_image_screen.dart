import 'dart:io';

import 'package:clone_image_edit/widgets/edit_image_viewmodel.dart';
import 'package:clone_image_edit/widgets/image_text.dart';
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
      appBar: _appBar,
      body: SafeArea(
          child: SizedBox(
        height: MediaQuery.of(context).size.height * 0.3,
        child: Stack(
          children: [
            _selectedImage,
            for (int i = 0; i < texts.length; i++)
              Positioned(
                left: texts[i].left,
                top: texts[i].top,
                child: GestureDetector(
                    onLongPress: () {
                      print('long press detected');
                    },
                    onTap: () => setCurrentIndex(context, i),
                    child: Draggable(
                      feedback: ImageText(textInfo: texts[i]),
                      child: ImageText(textInfo: texts[i]),
                      onDragEnd: (drag) {
                        final renderBox =
                            context.findRenderObject() as RenderBox;
                        Offset off = renderBox.globalToLocal(drag.offset);
                        setState(() {
                          texts[i].top = off.dy - 59;
                          texts[i].left = off.dx;
                        });
                      },
                    )),
              ),
            creatorText.text.isNotEmpty
                ? Positioned(
                    bottom: 0,
                    right: 0,
                    child: Text(
                      creatorText.text,
                      style: TextStyle(
                        color: Colors.black.withOpacity(0.3),
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ))
                : const SizedBox.shrink(),
          ],
        ),
      )),
      floatingActionButton: _addNewTextFab,
    );
  }

  Widget get _selectedImage => Center(
        child: Image.file(
          File(widget.slectedImage),
          fit: BoxFit.fill,
          width: MediaQuery.of(context).size.width,
        ),
      );

  Widget get _addNewTextFab => FloatingActionButton(
        onPressed: () => addNewDialog(context),
        backgroundColor: Colors.white,
        tooltip: 'Add New Text',
        child: const Icon(
          Icons.edit,
          color: Colors.black,
        ),
      );
  AppBar get _appBar => AppBar(
      backgroundColor: Colors.white,
      automaticallyImplyLeading: false,
      title: SizedBox(
        height: 50,
        child: ListView(
          scrollDirection: Axis.horizontal,
          children: [
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.save, color: Colors.black),
              tooltip: 'Save Image',
            ),
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.add, color: Colors.black),
              tooltip: 'Increase Font Size',
            ),
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.remove, color: Colors.black),
              tooltip: 'Decrease Font Size',
            ),
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.format_align_left, color: Colors.black),
              tooltip: 'Align Left',
            ),
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.format_align_center, color: Colors.black),
              tooltip: 'Align Center',
            ),
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.format_align_right, color: Colors.black),
              tooltip: 'Align Right',
            ),
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.format_bold, color: Colors.black),
              tooltip: 'Bold',
            ),
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.format_italic, color: Colors.black),
              tooltip: 'Italic',
            ),
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.space_bar, color: Colors.black),
              tooltip: 'Add New Line',
            ),
            Tooltip(
                message: 'Black',
                child: GestureDetector(
                  onTap: () => changeTextColor(Colors.black),
                  child: const CircleAvatar(
                    backgroundColor: Colors.black,
                  ),
                )),
            const SizedBox(
              width: 5,
            ),
            Tooltip(
                message: 'red',
                child: GestureDetector(
                  onTap: () => changeTextColor(Colors.red),
                  child: const CircleAvatar(
                    backgroundColor: Colors.red,
                  ),
                )),
            const SizedBox(
              width: 5,
            ),
            Tooltip(
                message: 'Yellow',
                child: GestureDetector(
                  onTap: () => changeTextColor(Colors.yellow),
                  child: const CircleAvatar(
                    backgroundColor: Colors.yellow,
                  ),
                )),
            const SizedBox(
              width: 5,
            ),
          ],
        ),
      ));
}
