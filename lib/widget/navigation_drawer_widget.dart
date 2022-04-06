import 'package:flutter/material.dart';
import 'package:intranet_movil/views/about/bh.dart';
import 'package:intranet_movil/views/auth/login.dart';
import 'package:intranet_movil/views/sample.dart';


class NavigationDrawerWidget extends StatelessWidget {

  const NavigationDrawerWidget({Key? key}) : super(key: key);
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
              onTap: () {
                selectedItem(context, 0); 
              },  
            ),   
            ListTile(
              leading: const Icon(Icons.info),
              title: const Text('Acerca de'),
              onTap: () {
                selectedItem(context, 1); 
              },  
            ),
            ListTile(
              leading: const Icon(Icons.chat_rounded),
              title: const Text('Organigrama'),
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
                  onTap: () {
                  selectedItem(context, 0); 
                  },  
                ),
          ],
        ),
      ),
    );
  }



  Widget buildHeader({
    required String urlImage,
    required String name,
    required String email,
    required VoidCallback onClicked,
  }) =>
      InkWell(
        onTap: onClicked,
        child: Row(
          children: [
            CircleAvatar(radius: 30, backgroundImage: NetworkImage(urlImage)),
            const SizedBox(width: 20),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                ),
                const SizedBox(height: 4),
                Text(
                  email,
                ),
              ],
            ),
            const Spacer(),
            const CircleAvatar(
              radius: 24,
            )
          ],
        ),
      );


  Widget buildMenuItem({
    required String text,
    required IconData icon,
    VoidCallback? onClicked,
  }) {
    return ListTile(
      leading: Icon(icon),
      title: Text(text, ),
      onTap: onClicked,
    );
  }

  void selectedItem(BuildContext context, int index) {
    Navigator.of(context).pop();

    switch (index) {
      case 0:
        Navigator.of(context).push(MaterialPageRoute(builder: (context)=> const Login()));   
        break;
      case 1: 
        Navigator.of(context).push(MaterialPageRoute(builder: (context)=> const AboutBH()));   
        break;
      case 2: 
        Navigator.of(context).push(MaterialPageRoute(builder: (context)=> const Sample()));   
        break;
    }
  }
}
 