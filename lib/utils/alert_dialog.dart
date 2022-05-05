import 'package:flutter/material.dart';
import 'package:intranet_movil/views/auth/login_page.dart';
import 'package:intranet_movil/views/home/home_page.dart';

class UserCardAlertDialog{
  
  static showFullDialog(BuildContext context,  String fullname, String email, String photo, String department, String position, ) {

  showGeneralDialog(
        context: context,
        barrierDismissible: true,
        barrierLabel: MaterialLocalizations.of(context)
          .modalBarrierDismissLabel,
        transitionDuration: const Duration(milliseconds: 200),
        pageBuilder: (BuildContext buildContext,
          Animation animation,
          Animation secondaryAnimation) {
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 32.0, horizontal: 16.0),
            child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              child:  SingleChildScrollView(
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
                    padding: EdgeInsets.only(top: 80.0) ,
                  ),
                  Column(
                    children: [
                      Text(
                        fullname,
                        style: const TextStyle(fontSize: 20.00,fontWeight: FontWeight.bold,),
                      ),
                      const Padding(
                      padding: EdgeInsets.only(top: 14.0) ,
                      ),
                      Text(
                        position,
                        style: const TextStyle(fontSize: 16.00),
                      ),
                      const Padding(
                      padding: EdgeInsets.only(top: 36.0),
                      ),
                      Padding(
                        padding:const EdgeInsets.only(left: 24.0),
                        child: Column(
                          children: [
                            Row(
                              children: [
                                const Icon( Icons.house),
                                const Padding(padding: EdgeInsets.only(right: 8.0)),
                                Text(department)
                              ],
                            ),
                            const Padding(padding: EdgeInsets.only(top: 12.0)),
                            Row(
                              children: [
                                const Icon( Icons.work),
                                const Padding(padding: EdgeInsets.only(right: 8.0)),
                                Text(position)
                              ],
                            ),
                            const Padding(padding: EdgeInsets.only(top: 12.0)),
                            Row(
                              children: [
                                const Icon( Icons.mail),
                                const Padding(padding: EdgeInsets.only(right: 8.0)),
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
        }
      );
  }
}


class LogoutAlertDialog{

  showAlertDialog(BuildContext context) {

    Widget cancelButton = TextButton(
      child: const Text("Cancelar"),
      onPressed:  () {
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => const HomePage())); 
        Navigator.of(context, rootNavigator: true).pop('dialog');
      },
    );
    Widget continueButton = TextButton(
      child:const Text("Aceptar"),
      onPressed:  () {
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => const LoginForm()));
      },
    );

    AlertDialog alert = AlertDialog(
      title:const Text("Salir de la aplicación"),
      content:const Text("¿Desea cerra la aplicación?"),
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