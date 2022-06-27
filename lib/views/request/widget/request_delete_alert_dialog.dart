import 'package:flutter/material.dart';
import 'package:intranet_movil/services/post_request_delete.dart';
import 'package:intranet_movil/views/request/request_main_page.dart';

class RequestDelete {
   showRequestDelete(
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
        Navigator.pop(contex);
        Navigator.pushAndRemoveUntil(
            contex,
            MaterialPageRoute(builder: (context) => const RequestMainPage()),
            ModalRoute.withName("/RequestPage"));
        
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
