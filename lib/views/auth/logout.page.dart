
import 'package:flutter/material.dart';
import 'package:intranet_movil/widget/alert/logout_alert_dialog.dart';
import 'package:intranet_movil/utils/constants.dart';
import 'package:intranet_movil/widget/navigation_drawer_widget.dart';
import 'package:lottie/lottie.dart';

class LogoutPage extends StatefulWidget {
  const LogoutPage({Key? key}) : super(key: key);

  @override
  _LogoutState createState() => _LogoutState();
}

class _LogoutState extends State<LogoutPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const NavigationDrawerWidget(),
      appBar: AppBar(
        title: const Text(StringIntranetConstants.logoutPage),
      ),
      body: const AccessWidget(),
    );
  }
}

class AccessWidget extends StatelessWidget {
  const AccessWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Column(
        children: <Widget>[
          Column(
            children: <Widget>[
              const Padding(padding: EdgeInsets.only(top: 40)),
              const Center(
                child: Text(
                  "¿Desea cerrar sesión?",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                ),
              ),
              const Padding(padding: EdgeInsets.only(top: 16)),
              SizedBox(
                width: 160,
                height: 160,
                child: Lottie.asset("lib/assets/hello_robot.json"),
              ),
              const Padding(padding: EdgeInsets.only(top: 16)),
              Padding(
                padding: const EdgeInsets.all(32),
                child: SizedBox(
                  width: double.infinity,
                  height: 60,
                  child: ElevatedButton(
                    child: const Text("CERRAR SESIÓN"),
                    onPressed: () {
                      LogoutAlertDialog().showAlertDialog(context);
                    },
                  ),
                ),
              ),
            ],
          ),
          //Segunda card
        ],
      ),
    );
  }
}
