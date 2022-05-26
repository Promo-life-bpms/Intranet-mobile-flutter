import 'package:flutter/material.dart';
import 'package:intranet_movil/utils/constants.dart';
import 'package:lottie/lottie.dart';

class WrongAlertDialog {
  static showAlertDialog(
    BuildContext context,
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
                const EdgeInsets.symmetric(vertical: 48.0, horizontal: 16.0),
            child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Padding(
                  padding: const EdgeInsets.all(24),
                  child: Column(
                    children: [
                      const Padding(
                        padding: EdgeInsets.all(16),
                        child: Center(
                          child: Text(
                            "Algo salio mal",
                            style: TextStyle(
                                fontSize: 28, fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 16, right: 16),
                        child: Center(
                          child: SizedBox(
                            width: double.infinity,
                            child: Lottie.asset(
                              "lib/assets/500.json",
                            ),
                          ),
                        ),
                      ),
                      const Padding(padding: EdgeInsets.only(top: 16)),
                      const Padding(
                        padding: EdgeInsets.all(16),
                        child: Center(
                          child: Text(
                            "Revisa los datos de tu solicitud e intenta nuevamente",
                            style: TextStyle(fontSize: 16),
                          ),
                        ),
                      ),
                      Padding(
                          padding: const EdgeInsets.all(16),
                          child: SizedBox(
                            width: double.infinity,
                            height: 60,
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                primary: ColorIntranetConstants
                                    .primaryColorNormal, // background
                                onPrimary: Colors.white, // foreground
                              ),
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              child: const Text('ACEPTAR'),
                            ),
                          )),
                    ],
                  ),
                ),
              ),
            ),
          );
        });
  }
}
