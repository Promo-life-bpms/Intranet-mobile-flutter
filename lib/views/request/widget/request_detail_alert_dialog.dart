import 'package:flutter/material.dart';
import 'package:intranet_movil/utils/constants.dart';

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
          return Column(
             mainAxisAlignment: MainAxisAlignment.center,
             crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(
                     horizontal: 16.0),
                child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(24.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(
                          width: double.infinity,
                          height: 40,
                          child: Text(
                            "Detalles",
                            style:  TextStyle(
                              fontSize: 24.00,
                              fontWeight: FontWeight.bold,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                        Row(
                          children: [
                            const Text(
                              "Tipo de solicitud: ",
                              style: TextStyle(
                                  fontSize: 16.00,
                                  fontWeight: FontWeight.bold, color: ColorIntranetConstants.primaryColorDark),
                            ),
                            Expanded(
                              child: Text(
                              typeRequest,
                              overflow: TextOverflow.ellipsis,
                              style: const TextStyle(fontSize: 16.00),
                              ),
                            )
                            
                          ],
                        ),
                        const Padding(padding: EdgeInsets.only(top: 12)),
                        Row(
                          children: [
                            const Text(
                              "Forma de pago: ",
                              style: TextStyle(
                                  fontSize: 16.00,
                                  fontWeight: FontWeight.bold, color: ColorIntranetConstants.primaryColorDark),
                            ),
                            Expanded(
                              child: Text(
                              payment,
                              overflow: TextOverflow.ellipsis,
                              style: const TextStyle(fontSize: 16.00),
                              ),
                            ) 
                          ],
                        ),
                        const Padding(padding: EdgeInsets.only(top: 12)),
                        typeRequest == "Salir durante la jornada"
                            ? Row(
                                children: [
                                  const Text(
                                    "Horario de salida: ",
                                    style: TextStyle(
                                        fontSize: 16.00,
                                        fontWeight: FontWeight.bold, color: ColorIntranetConstants.primaryColorDark),
                                  ),
                                  Expanded(
                                    child: Text(
                                    start,
                                    overflow: TextOverflow.ellipsis,
                                    style: const TextStyle(fontSize: 16.00),
                                    ),
                                  ),
                                ],
                              )
                            : const Padding(padding: EdgeInsets.zero),
                        const Padding(padding: EdgeInsets.only(top: 12)),
                        Row(
                          children: [
                            const Text(
                              "Aprobación jefe directo: ",
                              style: TextStyle(
                                  fontSize: 16.00,
                                  fontWeight: FontWeight.bold, color: ColorIntranetConstants.primaryColorDark),
                            ),
                            Expanded(
                              child: Text(
                              directManagerStatus,
                              overflow: TextOverflow.ellipsis,
                              style: const TextStyle(fontSize: 16.00),
                              ),
                            ), 
                          ],
                        ),
                        const Padding(padding: EdgeInsets.only(top: 12)),
                        Row(
                          children: [
                            const Text(
                              "Aprobación RH: ",
                              style: TextStyle(
                                  fontSize: 16.00,
                                  fontWeight: FontWeight.bold, color: ColorIntranetConstants.primaryColorDark),
                            ),
                            Expanded(
                              child: Text(
                              humanResourcesStatus,
                              overflow: TextOverflow.ellipsis,
                              style: const TextStyle(fontSize: 16.00),
                              ),
                            ),
                            
                          ],
                        ),
                        const Padding(padding: EdgeInsets.only(top: 12)),
                        Row(
                          children: [
                            const Text(
                              "Días tomados: ",
                              style: TextStyle(
                                  fontSize: 16.00,
                                  fontWeight: FontWeight.bold, color: ColorIntranetConstants.primaryColorDark),
                            ),
                            Expanded(
                              child: Text(
                              days,
                              overflow: TextOverflow.ellipsis,
                              style: const TextStyle(fontSize: 16.00),
                              ),
                            ),
                          ],
                        ),
                        const Padding(padding: EdgeInsets.only(top: 12)),

                        const Text(
                          "Motivo: ",
                          style: TextStyle(fontSize: 16.00,fontWeight: FontWeight.bold, color: ColorIntranetConstants.primaryColorDark),
                        ),
                        const Padding(padding: EdgeInsets.only(top: 12)),
                        Text(
                          reason,
                          style: const TextStyle(fontSize: 16.00),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          );
        });
  }
}
