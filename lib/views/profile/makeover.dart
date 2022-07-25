import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

class Makeover extends StatefulWidget {
  @override
  _makeover createState() => _makeover();
}

class _makeover extends State<Makeover> {
  late File image;
  late File filePath;
  late String filePathString = "";
  bool loadFuture = false;
  final picker = ImagePicker();
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Agregar imagen'),
        ),
        /*body: Column(
          children: [
            ElevatedButton(
              onPressed: () {},
              child: const Text("Subir imagen"),
            ),
            const SizedBox(
              height: 30,
            ),
          ],
        ),*/
      ),
    );
  }

  /* Future<File?> _getImage() async {
    if (loadFuture == true) {
      ImagePicker _picker = ImagePicker();

      XFile? image = await _picker.pickImage(source: ImageSource.gallery);

      File file = File(image!.path);
      filePath = file;

      filePathString = file.toString();
      loadFuture = false;

      return file;
    }
  }*/
}
