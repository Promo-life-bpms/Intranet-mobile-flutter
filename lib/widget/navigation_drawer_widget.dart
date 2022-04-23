import 'package:flutter/material.dart';
import 'package:intranet_movil/views/about/about_main_page.dart';
import 'package:intranet_movil/views/access/access_page.dart';
import 'package:intranet_movil/views/aniversary/aniversary_page.dart';
import 'package:intranet_movil/views/auth/login_page.dart';
import 'package:intranet_movil/views/communicate/communicate_page.dart';
import 'package:intranet_movil/views/directory/directory_page.dart';
import 'package:intranet_movil/views/employee_month/employee_month_page.dart';
import 'package:intranet_movil/views/home/home_page.dart';
import 'package:intranet_movil/views/manual/manual_page.dart';
import 'package:intranet_movil/views/organization/organization_page.dart';
import 'package:intranet_movil/views/request/request_main_page.dart';

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
              selected: (_selectedDrawerItem == 3),
              onTap: () {
                selectedItem(context, 3); 
                },  
              ),
              ListTile(
                leading: const Icon(Icons.contact_mail),
                title: const Text('Directorio'),     
                selected: (_selectedDrawerItem == 4),
                onTap: () {
                  selectedItem(context, 4); 
                } ,  
              ),
              ListTile(
                leading: const Icon(Icons.celebration),
                title: const Text('Aniversarios'),
                selected: (_selectedDrawerItem == 5),
                onTap: () { 
                  selectedItem(context, 5); 
                  },  
                ),
              ListTile(
                leading: const Icon(Icons.emoji_events),
                title: const Text('Empleado del Mes'),
                selected: (_selectedDrawerItem == 6),
                onTap: () {
                  selectedItem(context, 6); 
                  },  
                ),
                ListTile(
                  leading: const Icon(Icons.notifications),
                  title: const Text('Comunicados'),
                  selected: (_selectedDrawerItem == 7),
                  onTap: () {
                  selectedItem(context, 7); 
                  }, 
                ),
                ListTile(
                  leading: const Icon(Icons.library_books),
                  title: const Text('Manuales'),
                  selected: (_selectedDrawerItem == 8),
                  onTap: () {
                  selectedItem(context, 8); 
                  }, 
                ),
                ListTile(
                  leading: const Icon(Icons.public),
                  title: const Text('Accesos'),
                  selected: (_selectedDrawerItem == 9),
                  onTap: () {
                  selectedItem(context, 9); 
                  },
                ),
                ListTile(
                  leading: const Icon(Icons.exit_to_app),
                  title: const Text('Salir'),
                  selected: (_selectedDrawerItem == 10),
                  onTap: () {
                  selectedItem(context, 10);
                   
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
        Navigator.of(context).push(MaterialPageRoute(builder: (context)=> const HomePage()));   
        break;
      case 1: 
        _selectedDrawerItem = index;
        Navigator.of(context).push(MaterialPageRoute(builder: (context)=> const AboutMainPage()));   
        break;
      case 2: 
        _selectedDrawerItem = index;
        Navigator.of(context).push(MaterialPageRoute(builder: (context)=>  OrganizationPage()));   
        break;
      case 3:
        _selectedDrawerItem = index;
        Navigator.of(context).push(MaterialPageRoute(builder: (context)=> const RequestMainPage()));   
        break;
      case 4: 
        _selectedDrawerItem = index;
        Navigator.of(context).push(MaterialPageRoute(builder: (context)=> const DirectoryPage()));   
        break;
      case 5: 
        _selectedDrawerItem = index;
        Navigator.of(context).push(MaterialPageRoute(builder: (context)=> const AniversaryPage()));   
        break;
      case 6:
        _selectedDrawerItem = index;
        Navigator.of(context).push(MaterialPageRoute(builder: (context)=> const EmployeeMonthPage()));   
        break;
      case 7: 
        _selectedDrawerItem = index;
        Navigator.of(context).push(MaterialPageRoute(builder: (context)=> const CommunicatePage()));   
        break;
      case 8: 
        _selectedDrawerItem = index;
        Navigator.of(context).push(MaterialPageRoute(builder: (context)=> const ManualPage()));   
        break;
      case 9: 
        _selectedDrawerItem = index;
        Navigator.of(context).push(MaterialPageRoute(builder: (context)=> const AccessPage()));   
        break;
      case 10: 
        _selectedDrawerItem = index;
        Navigator.of(context).push(MaterialPageRoute(builder: (context)=> const Login()));   
        break;
    }
  }
}
 