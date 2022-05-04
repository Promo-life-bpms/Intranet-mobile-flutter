import 'package:flutter/material.dart';
import 'package:intranet_movil/services/auth.dart';
import 'package:intranet_movil/views/auth/login_page.dart';
import 'package:intranet_movil/views/home/home_page.dart';
/* import 'package:intranet_movil/widget/splash_screen.dart';
 */import 'package:provider/provider.dart';

/* void main() => runApp( const MyApp());

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
} */



void main() {
  runApp(
      ChangeNotifierProvider(
        create: (BuildContext context) => AuthProvider(),
        child: const MyApp(),
      )
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Sanctum Books',
      home:  Scaffold(
        body: Center(
            child: Consumer<AuthProvider>(
              builder: (context, auth, child) {
                switch (auth.isAuthenticated) {
                  case true:
                    return  HomePage();
                  default:
                    return  LoginForm();
                }
              },
            )
        ),
      )
    );
  }
}
