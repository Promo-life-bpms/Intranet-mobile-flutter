import 'package:flutter/material.dart';
import 'package:intranet_movil/services/post_request_delete.dart';

class RequestDelete {
  static showRequestDelete(
    BuildContext contex,
    String token,
    String requestID,
  ) {
    Widget cancelButton = TextButton(
      child: const Text("Cancel"),
      onPressed: () {
        Navigator.pop(contex);
      },
    );
    Widget continueButton = TextButton(
      child: const Text("Aceptar"),
      onPressed: () {
        postRequestDelete(token, requestID);
      },
    );
    AlertDialog alert = AlertDialog(
      title: const Text("Eliminar"),
      content: const Text("Desea eliminar esta solicitud"),
      actions: [
        cancelButton,
        continueButton,
      ],
    );
    showDialog(
      context: contex,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }
}