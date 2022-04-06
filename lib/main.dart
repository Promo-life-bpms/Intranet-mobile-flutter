import 'package:flutter/material.dart';
import 'package:intranet_movil/views/auth/login_page.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  static const String title = 'Navigation Drawer';

  @override
  Widget build(BuildContext context) => MaterialApp(
        title: title,
        theme: ThemeData(
          primarySwatch: Colors.blue),
        home: const Login(),
      );
}

