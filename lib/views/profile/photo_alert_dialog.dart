import 'package:flutter/material.dart';
import 'package:intranet_movil/views/profile/makeover.dart';

class ChangeImage {
  openBottomSheet(
    BuildContext context,
    String token,
  ) {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext context) {
          return Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              ListTile(
                leading: const Icon(Icons.image),
                title: const Text("Subir imagen"),
                onTap: () {
                  Navigator.pop(context);
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => Makeover()));
                },
              ),
              /*  ListTile(
                leading: const Icon(Icons.camera_alt),
                title: const Text("Tomar foto"),
                onTap: () {
                  Navigator.pop(context);
                },
              ),*/
            ],
          );
        });
  }
}
