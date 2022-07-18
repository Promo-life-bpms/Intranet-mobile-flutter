import 'package:flutter/material.dart';
import 'package:intranet_movil/services/post_publication_delete.dart';
import 'package:intranet_movil/views/home/edit_post.dart';

class PostDelete {
  showPostDelete(
    BuildContext cont,
    String token,
    String publciationID,
  ) {
    Widget cancelButton = TextButton(
      child: const Text("Cancelar"),
      onPressed: () {
        Navigator.pop(cont);
      },
    );
    Widget continueButton = TextButton(
      child: const Text("Aceptar"),
      onPressed: () {
        postPublicationDelete(token, publciationID);
        Navigator.pop(cont);
      /*   Navigator.pushAndRemoveUntil(
            cont,
            MaterialPageRoute(builder: (context) => const HomePage()),
            ModalRoute.withName("/PostPage")); */
      },
    );
    AlertDialog alert = AlertDialog(
      title: const Text("¿Eliminar Publicación?"),
      content: const Text(
          "No podrá recuperar la publicación después de ser eliminada"),
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

class OpenBottonSheet {
  openBottomSheet(
      BuildContext cont, String token, String publciationID, String contPubli) {
    showModalBottomSheet(
        context: cont,
        builder: (BuildContext context) {
          return Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              ListTile(
                leading: const Icon(Icons.edit),
                title: const Text("Editar"),
                onTap: () {
                  Navigator.pop(context);

                  PostEdit()
                      .showPostEdit(cont, token, publciationID, contPubli);
                },
              ),
              /*ListTile(
                leading: const Icon(Icons.save),
                title: const Text("Guardar"),
                onTap: () {},
              ), */
              ListTile(
                leading: const Icon(Icons.delete),
                title: const Text("Eliminar"),
                onTap: () {
                  Navigator.pop(context);
                  PostDelete().showPostDelete(cont, token, publciationID);
                },
              ),
            ],
          );
        });
  }
}
