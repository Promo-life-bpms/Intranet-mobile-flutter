import 'dart:async';

import 'package:flutter/material.dart';
import 'package:intranet_movil/model/directory.dart';
import 'package:intranet_movil/services/api_directory.dart';
import 'package:intranet_movil/utils/alert_dialog.dart';
import 'package:intranet_movil/utils/constants.dart';
import 'package:intranet_movil/widget/navigation_drawer_widget.dart';

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
        title: const Text('Directorio'),
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
      child:Column(
        children:<Widget> [
          Card(
            child: Column(
              children: <Widget>[
                const SizedBox(
                    width: double.infinity,
                    height: 160.0,
                    child:FittedBox(
                      fit: BoxFit.contain,
                      child: Image(
                          image: NetworkImage('https://flutter.github.io/assets-for-api-docs/assets/widgets/owl.jpg'),
                        )
                    ),
                  ),
                  TextButton( 
                  onPressed: () {
                     LogoutAlertDialog().showAlertDialog(context);
                  },
                  child: const Text('Ver mas'),
                  ),
                
              ],
            ),
          ),
          //Segunda card
          

        ],
      ),
 
    );
  }
}
