import 'package:flutter/material.dart';
import 'package:intranet_movil/widgets/drawer.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Home',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Home'),
        ),
        body: const HomeLayout(), 
        drawer: const DrawerNavigation(),
      ),
    );
  }
}

class HomeLayout extends StatefulWidget {
  const HomeLayout({Key? key}) : super(key: key);

  @override
  HomeLayoutView createState() {
    return HomeLayoutView();
  }
}

class HomeLayoutView extends State<HomeLayout> {
 
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,

      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 24.0),
            child: TextFormField(
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Debes llenar todos los campos';
                  }
                  return null;
                },
                decoration: const InputDecoration(
                contentPadding: EdgeInsets.only(top: 20), 
                isDense: true,
                hintText: "Correo",
                prefixIcon: Padding(
                  padding: EdgeInsets.only(top: 15), 
                  child: Icon(Icons.mail),
                ),
              ),
            ),
          ),
          
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 24.0),
            child:TextFormField(
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Debes llenar todos los campos';
                }
                return null;
                
              },
              obscureText: true,
              decoration: const InputDecoration(
                contentPadding: EdgeInsets.only(top: 20), 
                isDense: true,
                hintText: "Contrasena",
                prefixIcon: Padding(
                  padding: EdgeInsets.only(top: 15), 
                  child: Icon(Icons.password_rounded),
                ),
              ),
            ),
          ),
          
          const SizedBox(height: 20,),

          SizedBox(
            width: 200,
            height: 50, 
            child: ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(builder: (context)=>const HomePage()));   
              },
                child: const Text('INICIAR SESION'),

            ),
          ),
        ],
      ),
    );
  }
}

