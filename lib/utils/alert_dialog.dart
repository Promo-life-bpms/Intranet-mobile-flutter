import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intranet_movil/services/auth.dart';

class UserCardAlertDialog {
  static showFullDialog(
    BuildContext context,
    String fullname,
    String email,
    String photo,
    String department,
    String position,
  ) {
    showGeneralDialog(
        context: context,
        barrierDismissible: true,
        barrierLabel:
            MaterialLocalizations.of(context).modalBarrierDismissLabel,
        transitionDuration: const Duration(milliseconds: 200),
        pageBuilder: (BuildContext buildContext, Animation animation,
            Animation secondaryAnimation) {
          return Padding(
            padding:
                const EdgeInsets.symmetric(vertical: 32.0, horizontal: 16.0),
            child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Column(
                  children: [
                    Container(
                      width: double.infinity,
                      height: 200.0,
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage("lib/assets/background.jpg"),
                          fit: BoxFit.cover,
                        ),
                      ),
                      child: Align(
                        alignment: const Alignment(0, 2.5),
                        child: SizedBox(
                          width: 120.0,
                          height: 120.0,
                          child: OverflowBox(
                            child: CircleAvatar(
                              backgroundImage: NetworkImage(photo),
                            ),
                          ),
                        ),
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(top: 80.0),
                    ),
                    Column(
                      children: [
                        Text(
                          fullname,
                          style: const TextStyle(
                            fontSize: 20.00,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const Padding(
                          padding: EdgeInsets.only(top: 14.0),
                        ),
                        Text(
                          position,
                          style: const TextStyle(fontSize: 16.00),
                        ),
                        const Padding(
                          padding: EdgeInsets.only(top: 36.0),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 24.0),
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  const Icon(Icons.house),
                                  const Padding(
                                      padding: EdgeInsets.only(right: 8.0)),
                                  Text(department)
                                ],
                              ),
                              const Padding(
                                  padding: EdgeInsets.only(top: 12.0)),
                              Row(
                                children: [
                                  const Icon(Icons.work),
                                  const Padding(
                                      padding: EdgeInsets.only(right: 8.0)),
                                  Text(position)
                                ],
                              ),
                              const Padding(
                                  padding: EdgeInsets.only(top: 12.0)),
                              Row(
                                children: [
                                  const Icon(Icons.mail),
                                  const Padding(
                                      padding: EdgeInsets.only(right: 8.0)),
                                  Text(email)
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          );
        });
  }
}

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

class RequestDetailAlertDialog {
  static showFullDialog(
      BuildContext context,
      String typeRequest,
      String payment,
      String start,
      String end,
      String reason,
      String directManagerStatus,
      String humanResourcesStatus,
      String days) {
    showGeneralDialog(
        context: context,
        barrierDismissible: true,
        barrierLabel:
            MaterialLocalizations.of(context).modalBarrierDismissLabel,
        transitionDuration: const Duration(milliseconds: 200),
        pageBuilder: (BuildContext buildContext, Animation animation,
            Animation secondaryAnimation) {
          return Padding(
            padding:
                const EdgeInsets.symmetric(vertical: 32.0, horizontal: 16.0),
            child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Padding(
                  padding: const EdgeInsets.all(24.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: double.infinity,
                        height: 60,
                        child: Text(
                          typeRequest,
                          style: const TextStyle(
                            fontSize: 24.00,
                            fontWeight: FontWeight.bold,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      const Text(
                        "Tipo de solicitud",
                        style: TextStyle(fontSize: 16.00),
                      ),
                      const Padding(padding: EdgeInsets.only(top: 8)),
                      TextFormField(
                        enabled: false,
                        initialValue: typeRequest,
                        decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            contentPadding: EdgeInsets.symmetric(
                                vertical: 8, horizontal: 16)),
                      ),
                      const Padding(padding: EdgeInsets.only(top: 16)),
                      const Text(
                        "Forma de pago",
                        style: TextStyle(fontSize: 16.00),
                      ),
                      const Padding(padding: EdgeInsets.only(top: 8)),
                      TextFormField(
                        enabled: false,
                        initialValue: payment,
                        decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            contentPadding: EdgeInsets.symmetric(
                                vertical: 8, horizontal: 16)),
                      ),
                      const Padding(padding: EdgeInsets.only(top: 24)),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: const [
                          Text("Horario de salida",
                              style: TextStyle(fontSize: 16.00)),
                          Text("Horario de reingreso",
                              style: TextStyle(fontSize: 16.00)),
                        ],
                      ),
                      const Padding(padding: EdgeInsets.only(top: 8)),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Flexible(
                            child: TextFormField(
                              enabled: false,
                              initialValue: start,
                              decoration: const InputDecoration(
                                  border: OutlineInputBorder(),
                                  contentPadding: EdgeInsets.symmetric(
                                      vertical: 8, horizontal: 16)),
                            ),
                          ),
                          Flexible(
                            child: TextFormField(
                              enabled: false,
                              initialValue: end,
                              decoration: const InputDecoration(
                                  border: OutlineInputBorder(),
                                  contentPadding: EdgeInsets.symmetric(
                                      vertical: 8, horizontal: 16)),
                            ),
                          )
                        ],
                      ),
                      const Padding(padding: EdgeInsets.only(top: 16)),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: const [
                          Text("Aprobación jefe directo",
                              style: TextStyle(fontSize: 16.00)),
                          Text("Aprobación RH",
                              style: TextStyle(fontSize: 16.00)),
                        ],
                      ),
                      const Padding(padding: EdgeInsets.only(top: 8)),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Flexible(
                            child: TextFormField(
                              enabled: false,
                              initialValue:directManagerStatus ,
                              decoration: const InputDecoration(
                                  border: OutlineInputBorder(),
                                  contentPadding: EdgeInsets.symmetric(
                                      vertical: 8, horizontal: 16)),
                            ),
                          ),
                          Flexible(
                            child: TextFormField(
                              enabled: false,
                              initialValue: humanResourcesStatus,
                              decoration: const InputDecoration(
                                  border: OutlineInputBorder(),
                                  contentPadding: EdgeInsets.symmetric(
                                      vertical: 8, horizontal: 16)),
                            ),
                          )
                        ],
                      ),
                      const Padding(padding: EdgeInsets.only(top: 16)),
                      const Text(
                        "Días tomados",
                        style: TextStyle(fontSize: 16.00),
                      ),
                      const Padding(padding: EdgeInsets.only(top: 8)),
                      TextFormField(
                        enabled: false,
                        initialValue: days,
                        decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            contentPadding: EdgeInsets.symmetric(
                                vertical: 8, horizontal: 16)),
                      ),

                      const Padding(padding: EdgeInsets.only(top: 16)),
                      const Text(
                        "Motivo",
                        style: TextStyle(fontSize: 16.00),
                      ),
                      const Padding(padding: EdgeInsets.only(top: 8)),
                      TextFormField(
                        enabled: false,
                        initialValue: reason,
                        maxLines: 4,
                        decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            contentPadding: EdgeInsets.symmetric(
                                vertical: 8, horizontal: 16)),
                      )
                    ],
                  ),
                ),
              ),
            ),
          );
        });
  }
}
