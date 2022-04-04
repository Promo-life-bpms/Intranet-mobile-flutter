import 'package:flutter/material.dart';

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

class DrawerNavigation extends StatefulWidget {
  const DrawerNavigation({Key? key}) : super(key: key);

  @override
  DrawerNavigationView createState() {
    return DrawerNavigationView();
  }
}

class DrawerNavigationView extends State<DrawerNavigation> {
 
  @override
  Widget build(BuildContext context) {
    return Drawer(

      
        child: ListView(
            padding: EdgeInsets.zero,
            children: const <Widget>[
              UserAccountsDrawerHeader(
                accountName: Text("Hola"), 
                accountEmail: Text("test@test.com"),
                currentAccountPicture: CircleAvatar(
                  backgroundColor: Colors.black,
                  child: Text("O", style: TextStyle(
                    fontSize: 40.0),
                    ),
                  ),
                ),
              ListTile(
                leading: Icon(Icons.home),
                title: Text('Inicio'),
              ),
              ListTile(
                leading: Icon(Icons.info),
                title: Text('Acerca de'),
                
              ),
              ListTile(
                leading: Icon(Icons.chat_rounded),
                title: Text('Organigrama'),
              ),
              ListTile(
                leading: Icon(Icons.edit),
                title: Text('Solicitudes'),
              ),
              ListTile(
                leading: Icon(Icons.contact_mail),
                title: Text('Directorio'),
                
              ),
              ListTile(
                leading: Icon(Icons.settings),
                title: Text('Aniversarios'),
              ),
              ListTile(
                leading: Icon(Icons.settings),
                title: Text('Empleado del Mes'),
              ),
              ListTile(
                leading: Icon(Icons.settings),
                title: Text('Comunicados'),
              ),
              ListTile(
                leading: Icon(Icons.settings),
                title: Text('Manuales'),
              ),
              ListTile(
                leading: Icon(Icons.settings),
                title: Text('Accesos'),
              ),
              ListTile(
                leading: Icon(Icons.exit_to_app),
                title: Text('Salir'),
              ),
            ],
          ),
    
    );
  }
}