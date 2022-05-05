import 'package:flutter/material.dart';
import 'package:intranet_movil/services/auth.dart';
import 'package:intranet_movil/views/auth/login_page.dart';
import 'package:intranet_movil/views/home/home_page.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';


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
    
  late String? _token = "";

  @override
  void initState() {
    super.initState();
    _getData();
  }

   void _getData() async {
    final prefs = await SharedPreferences.getInstance();
    _token = prefs.getString('token');
      Future.delayed(const Duration(seconds: 1)).then((value) => setState(() {}));
  }

  @override
  Widget build(BuildContext context) {
    return 
     MaterialApp(
      title: 'Login',
      home:  Scaffold(
        body:
        _token == ""?
        const Center(
          child: CircularProgressIndicator(),
        )
        :
        _token == null || _token!.isEmpty 
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



