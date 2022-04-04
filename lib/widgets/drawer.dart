import 'package:flutter/material.dart';
import 'package:intranet_movil/views/about/promolife.dart';
import 'package:intranet_movil/views/auth/login.dart';
import 'package:intranet_movil/views/home/home.dart';


class DrawerNavigation extends StatefulWidget {
  const DrawerNavigation({Key? key}) : super(key: key);

  @override
  DrawerNavigationView createState() {
    return DrawerNavigationView();
  }
}

class DrawerNavigationView extends State<DrawerNavigation> {
   int _selectedDestination = 0;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
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
            selected: _selectedDestination == 0,
            onTap: () => selectDestination(0),
          ),   
          ListTile(
            leading: const Icon(Icons.info),
            title: const Text('Acerca de'),
            selected: _selectedDestination == 1,
            onTap: () => selectDestination(1),  
          ),
          ListTile(
            leading: const Icon(Icons.chat_rounded),
            title: const Text('Organigrama'),
            selected: _selectedDestination == 2,
            onTap: () => selectDestination(2),  
          ),
          ListTile(
            leading: const Icon(Icons.edit),
            title: const Text('Solicitudes'),
            selected: _selectedDestination == 3,
            onTap: () => selectDestination(3),  
          ),
          ListTile(
            leading: const Icon(Icons.contact_mail),
            title: const Text('Directorio'),     
            selected: _selectedDestination == 4,
            onTap: () => selectDestination(4),  
          ),
          ListTile(
            leading: const Icon(Icons.settings),
            title: const Text('Aniversarios'),
            selected: _selectedDestination == 5,
            onTap: () => selectDestination(5),  
          ),
          ListTile(
            leading: const Icon(Icons.settings),
            title: const Text('Empleado del Mes'),
            selected: _selectedDestination == 6,
            onTap: () => selectDestination(6),  
          ),
          ListTile(
            leading: const Icon(Icons.settings),
            title: const Text('Comunicados'),
            selected: _selectedDestination == 7,
            onTap: () => selectDestination(7),  
          ),
          ListTile(
            leading: const Icon(Icons.settings),
            title: const Text('Manuales'),
            selected: _selectedDestination == 8,
            onTap: () => selectDestination(8),  
          ),
          ListTile(
            leading: const Icon(Icons.settings),
            title: const Text('Accesos'),
            selected: _selectedDestination == 9,
            onTap: () => selectDestination(9),  
          ),
          ListTile(
            leading: const Icon(Icons.exit_to_app),
            title: const Text('Salir'),
            selected: _selectedDestination == 10,
            onTap: () => selectDestination(10),  
          ),
        ],
      ),  
    );
  }

  void selectDestination(int index) {
    setState(() {
      _selectedDestination = index;
      switch (_selectedDestination) {
        case 0 :
          Navigator.of(context).push(MaterialPageRoute(builder: (context)=>const HomePage()));   
          break;
        case 1:
          Navigator.of(context).push(MaterialPageRoute(builder: (context)=>const AboutPromolife()));   
          break;
        case 2:
          Navigator.of(context).push(MaterialPageRoute(builder: (context)=>const Login()));   
          break;
        case 3:
         /*  Navigator.of(context).push(MaterialPageRoute(builder: (context)=>const HomePage()));    */
          break;
        case 4:
         /*  Navigator.of(context).push(MaterialPageRoute(builder: (context)=>const AboutPromolife()));   */ 
          break;
        case 5:
          /* Navigator.of(context).push(MaterialPageRoute(builder: (context)=>const HomePage()));    */
          break;
        case 6:
         /*  Navigator.of(context).push(MaterialPageRoute(builder: (context)=>const HomePage()));    */
          break;
        case 7:
         /*  Navigator.of(context).push(MaterialPageRoute(builder: (context)=>const HomePage()));    */
          break;
        case 8:
         /*  Navigator.of(context).push(MaterialPageRoute(builder: (context)=>const HomePage()));    */
          break;
        case 9:
         /*  Navigator.of(context).push(MaterialPageRoute(builder: (context)=>const HomePage()));    */
          break;
        case 10:
          Navigator.of(context).push(MaterialPageRoute(builder: (context)=>const Login()));   
          break;
        default:
          Navigator.of(context).push(MaterialPageRoute(builder: (context)=>const HomePage()));   


      }
    });
  }
}