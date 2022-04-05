import 'package:flutter/material.dart';
import 'package:intranet_movil/views/about/bh.dart';
import 'package:intranet_movil/views/about/promolife.dart';

class Home extends StatefulWidget{
  
  HomePage createState() =>  HomePage();
}

class HomePage extends State<Home> {

  int _selectedDrawerItem = 0;

  _getDrawerItemWidget(int pos){
    switch(pos){
      case 0: return const AboutBH();
      case 1: return const AboutBH();
      case 2: return const AboutPromolife();
      case 3: return const AboutPromolife();
      case 4: return const AboutPromolife();
      case 5: return const AboutPromolife();
      case 6: return const AboutPromolife();
      case 7: return const AboutPromolife();
      case 8: return const AboutPromolife();
      case 9: return const AboutPromolife();
  
    }
  }

  _onSelectedItem(int pos){
    setState(() {
      _selectedDrawerItem = pos;
    });
  }


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Home',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Home'),
        ),
        body: _getDrawerItemWidget(_selectedDrawerItem), 
        drawer: Drawer(
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
                      selected: (_selectedDrawerItem == 0),
                      onTap: () {
                        _onSelectedItem(0); 
                      },  
                    ),   
                    ListTile(
                      leading: const Icon(Icons.info),
                      title: const Text('Acerca de'),
                      selected: (_selectedDrawerItem == 1),
                      onTap: () {
                        Navigator.of(context).pop();
                        _onSelectedItem(1);
                      },  
                    ),
                    ListTile(
                      leading: const Icon(Icons.chat_rounded),
                      title: const Text('Organigrama'),
                      selected: (_selectedDrawerItem == 2),
                      onTap: (){
                        _onSelectedItem(2);
                      },  
                    ),
                    ListTile(
                      leading: const Icon(Icons.edit),
                      title: const Text('Solicitudes'),
                      selected: (_selectedDrawerItem == 3),
                      onTap: () {
                        _onSelectedItem(3);
                      },  
                    ),
                    ListTile(
                      leading: const Icon(Icons.contact_mail),
                      title: const Text('Directorio'),     
                      selected: (_selectedDrawerItem == 4),
                      onTap: () {
                        _onSelectedItem(4);
                      } ,  
                    ),
                    ListTile(
                      leading: const Icon(Icons.settings),
                      title: const Text('Aniversarios'),
                      selected: (_selectedDrawerItem == 5),
                      onTap: () { 
                        _onSelectedItem(5);
                        },  
                    ),
                    ListTile(
                      leading: const Icon(Icons.settings),
                      title: const Text('Empleado del Mes'),
                      selected: (_selectedDrawerItem == 6),
                      onTap: () {
                         _onSelectedItem(6);
                      },  
                    ),
                    ListTile(
                      leading: const Icon(Icons.settings),
                      title: const Text('Comunicados'),
                      selected: (_selectedDrawerItem == 7),
                      onTap: () => _onSelectedItem(7),  
                    ),
                    ListTile(
                      leading: const Icon(Icons.settings),
                      title: const Text('Manuales'),
                      selected: (_selectedDrawerItem == 8),
                      onTap: () => _onSelectedItem(8),  
                    ),
                    ListTile(
                      leading: const Icon(Icons.settings),
                      title: const Text('Accesos'),
                      selected: (_selectedDrawerItem == 9),
                      onTap: () => _onSelectedItem(9),  
                    ),
                    ListTile(
                      leading: const Icon(Icons.exit_to_app),
                      title: const Text('Salir'),
                      selected: (_selectedDrawerItem == 10),
                      onTap: () => _onSelectedItem(10),  
                    ),
                  ],
                ),
              ),
      ),
    );
  }
}

