import 'package:flutter/material.dart';

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
                       typeRequest == "Salir durante la jornada" 
                          ? Column(
                              children: [
                                const Padding(
                                    padding: EdgeInsets.only(top: 16)),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: const [
                                    Text("Horario de salida",
                                        style: TextStyle(fontSize: 16.00)),
                                    Text("Horario de reingreso",
                                        style: TextStyle(fontSize: 16.00)),
                                    Padding(padding: EdgeInsets.only(top: 8)),
                                  ],
                                ),
                                const Padding(padding: EdgeInsets.only(top: 8)),
                                Row(
                                  children: [
                                    Flexible(
                                      child: TextFormField(
                                        enabled: false,
                                        initialValue: start,
                                        decoration: const InputDecoration(
                                            border: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                color: Colors.blue,
                                              ),
                                            ),
                                            contentPadding:
                                                EdgeInsets.symmetric(
                                                    vertical: 8,
                                                    horizontal: 16)),
                                      ),
                                    ),
                                    Flexible(
                                      child: TextFormField(
                                        enabled: false,
                                        initialValue: end,
                                        decoration: const InputDecoration(
                                            border: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                color: Colors.blue,
                                              ),
                                            ),
                                            contentPadding:
                                                EdgeInsets.symmetric(
                                                    vertical: 8,
                                                    horizontal: 16)),
                                      ),
                                    )
                                  ],
                                ),
                                const Padding(
                                    padding: EdgeInsets.only(top: 16)),
                              ],
                            )
                          : const Padding(padding: EdgeInsets.only(top: 16)),
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
                              initialValue: directManagerStatus,
                              decoration: const InputDecoration(
                                  border: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Colors.blue,
                                    ),
                                  ),
                                  contentPadding: EdgeInsets.symmetric(
                                      vertical: 8, horizontal: 16)),
                            ),
                          ),
                          Flexible(
                            child: TextFormField(
                              enabled: false,
                              initialValue: humanResourcesStatus,
                              decoration: const InputDecoration(
                                  border: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Colors.blue,
                                    ),
                                  ),
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
                            border: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.blue,
                              ),
                            ),
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
                            border: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.blue,
                              ),
                            ),
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