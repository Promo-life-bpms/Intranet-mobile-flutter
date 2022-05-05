import 'package:flutter/material.dart';
import 'package:intranet_movil/model/user_model.dart';
import 'package:intranet_movil/services/api_user.dart';
import 'package:intranet_movil/services/auth.dart';
import 'package:intranet_movil/views/auth/login_page.dart';
import 'package:intranet_movil/views/home/home_page.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

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


/* 
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
    return 
     MaterialApp(
      title: 'Login',
      home:  Scaffold(
        body: Center(
            child: Consumer<AuthProvider>(
              builder: (context, auth, child) {
                switch (auth.isAuthenticated) {
                  case true:
                    return  const HomePage();
                  default:
                    return  const LoginForm();
                }
              },
            )
        ),
      )
    );
  }
}
 */

void main() {
  runApp(
      ChangeNotifierProvider(
        create: (BuildContext context) => AuthProvider(),
        child: const MyApp(),
      )
  );
}


class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<MyApp> {
    
  late List<UserModel>? _userlModel = [];

  @override
  void initState() {
    super.initState();
    _getData();
  }

   void _getData() async {
    final prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString('token');

    _userlModel = (await ApiUserService().getUsers(token.toString()))!.cast<UserModel>();
    Future.delayed(const Duration(seconds: 1)).then((value) => setState(() {}));
  }
  @override
  Widget build(BuildContext context) {
    return 
     MaterialApp(
      title: 'Login',
      home:  Scaffold(
        body:
        _userlModel == null || _userlModel!.isEmpty
        ?Center(
            child: Consumer<AuthProvider>(
              builder: (context, auth, child) {
                switch (auth.isAuthenticated) {
                  case true:
                    return  const HomePage();
                  default:
                    return  const LoginForm();
                }
              },
            )
        )
        :
         const HomePage()          
      )
    );
  }

}



