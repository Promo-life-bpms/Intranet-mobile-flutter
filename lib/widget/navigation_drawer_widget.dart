import 'package:flutter/material.dart';
import 'package:intranet_movil/views/about/bh.dart';
import 'package:intranet_movil/views/about/promolife.dart';
import 'package:intranet_movil/views/auth/login.dart';


class NavigationDrawerWidget extends StatelessWidget {

  const NavigationDrawerWidget({Key? key}) : super(key: key);
  static var _selectedDrawerItem = 0;

  @override
  Widget build(BuildContext context) {
   
    return Drawer(
      child: Material(
        
        child: ListView(
           children: <Widget>[
              const UserAccountsDrawerHeader(
              accountName: Text("Hola"), 
              accountEmail: Text("test@test.com"),
              currentAccountPicture: CircleAvatar(
              backgroundColor: Colors.black,
              child: Text("O", style: TextStyle(fontSize: 40.0),),
              ),
            ),
            ListTile(
              leading: const Icon(Icons.home),
              title: const Text('Inicio'),
              selected: (_selectedDrawerItem == 0),
              onTap: () {
                selectedItem(context, 0); 
              },  
            ),   
            ListTile(
              leading: const Icon(Icons.info),
              title: const Text('Acerca de'),
              selected: (_selectedDrawerItem == 1),
              onTap: () {
                selectedItem(context, 1); 
              },  
            ),
            ListTile(
              leading: const Icon(Icons.chat_rounded),
              title: const Text('Organigrama'),
              selected: (_selectedDrawerItem == 2),
              onTap: (){
                selectedItem(context, 2); 
              },  
            ),
            ListTile(
              leading: const Icon(Icons.edit),
              title: const Text('Solicitudes'),
              onTap: () {
                selectedItem(context, 3); 
                },  
              ),
              ListTile(
                leading: const Icon(Icons.contact_mail),
                title: const Text('Directorio'),     
                onTap: () {
                  selectedItem(context, 0); 
                } ,  
              ),
              ListTile(
                leading: const Icon(Icons.settings),
                title: const Text('Aniversarios'),
                onTap: () { 
                  selectedItem(context, 0); 
                  },  
                ),
              ListTile(
                leading: const Icon(Icons.settings),
                title: const Text('Empleado del Mes'),
                onTap: () {
                  selectedItem(context, 0); 
                  },  
                ),
                ListTile(
                  leading: const Icon(Icons.settings),
                  title: const Text('Comunicados'),
                  onTap: () {
                  selectedItem(context, 0); 
                  }, 
                ),
                ListTile(
                  leading: const Icon(Icons.settings),
                  title: const Text('Manuales'),
                  onTap: () {
                  selectedItem(context, 0); 
                  }, 
                ),
                ListTile(
                  leading: const Icon(Icons.settings),
                  title: const Text('Accesos'),
                  onTap: () {
                  selectedItem(context, 0); 
                  },
                ),
                ListTile(
                  leading: const Icon(Icons.exit_to_app),
                  title: const Text('Salir'),
                  selected: (_selectedDrawerItem == 0),
                  onTap: () {
                  selectedItem(context, 0);
                   
                  },  
                ),
          ],
        ),
      ),
    );
  }

  selectedItem(BuildContext context, int index) {

    Navigator.of(context).pop();

    switch (index) {
      case 0:
        _selectedDrawerItem = index;
        Navigator.of(context).push(MaterialPageRoute(builder: (context)=> const Login()));   
        break;
      case 1: 
        _selectedDrawerItem = index;
        Navigator.of(context).push(MaterialPageRoute(builder: (context)=> const AboutBH()));   
        break;
      case 2: 
        _selectedDrawerItem = index;
        Navigator.of(context).push(MaterialPageRoute(builder: (context)=> const AboutPromolife()));   
        break;
    }
  }
}
 