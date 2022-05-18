import 'package:flutter/material.dart';
import 'package:intranet_movil/views/auth/login_page.dart';

class Presentacion extends StatefulWidget {
  const Presentacion({Key? key}) : super(key: key);

  @override
  _PresentacionState createState() => _PresentacionState();
}

class _PresentacionState extends State<Presentacion> {
  @override
  void initState() {
    var d = const Duration(seconds: 2);
    Future.delayed(d, () {
      Navigator.pushAndRemoveUntil(context,
          MaterialPageRoute(builder: (context) {
        return const Login();
      }), (route) => false);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("lib/assets/Bienvenido.jpeg"),
                  fit: BoxFit.cover),
            ),
          ),
          const Padding(
            padding: EdgeInsets.all(135.0),
            child: Align(
              alignment: Alignment.bottomCenter,
              child: CircularProgressIndicator(
                color: Colors.blueGrey,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
