import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intranet_movil/services/api_auth.dart';

class LogoutAlertDialog {
  showAlertDialog(BuildContext context) {
    Widget cancelButton = TextButton(
      child: const Text("Cancelar"),
      onPressed: () {
        Navigator.pop(context);
      },
    );
    Widget continueButton = TextButton(
      child: const Text("Aceptar"),
      onPressed: () {
        AuthProvider().logout();
        Navigator.of(context, rootNavigator: true).pop('dialog');
        SystemNavigator.pop();
      },
    );

    AlertDialog alert = AlertDialog(
      title: const Text("¿Cerrar sesión?"),
      content: const Text(
        "Deberá ingresar sus datos nuevamente para acceder al contenido",
      ),
      actions: [
        cancelButton,
        continueButton,
      ],
    );

    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }
}
