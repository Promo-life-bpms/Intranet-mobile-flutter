import 'package:flutter/material.dart';
import 'package:intranet_movil/services/post_publication_edit.dart';

class PostEdit {
  showPostEdit(
      BuildContext cont, String token, String publciationID, String contPubli) {
    Widget cancelButton = TextButton(
      child: const Text("Cancelar"),
      onPressed: () {
        Navigator.pop(cont);
      },
    );
    Widget continueButton = TextButton(
      child: const Text("Actualizar"),
      onPressed: () {
        postPublicationEdit(token, publciationID, contPubli);
        (value) => value!.isEmpty ? 'Este campo no puede estar vacio' : null;

        Navigator.pop(cont);
        /*  Navigator.pushAndRemoveUntil(
            cont,
            MaterialPageRoute(builder: (context) => const HomePage()),
            ModalRoute.withName("/PostPage")); */
      },
    );
    AlertDialog alert = AlertDialog(
      content: TextField(
        controller: TextEditingController(text: contPubli),
        autofocus: true,
      ),
      actions: [
        cancelButton,
        continueButton,
      ],
    );
    showDialog(
      context: cont,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }
}
