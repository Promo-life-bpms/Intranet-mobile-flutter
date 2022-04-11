import 'package:flutter/material.dart';
import 'package:intranet_movil/views/auth/login_page.dart';
import 'package:intranet_movil/widget/splash_screen.dart';

void main() => runApp( const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: "presentacion",
      routes: {
        "presentacion": (_) => const Presentacion(),
        "inicio": (_) => const Login(),
      },
    );
  }
}
