import 'package:flutter/material.dart';
import 'package:intranet_movil/widget/navigation_drawer_widget.dart';

void main() => runApp(const OrganizationPage());

class OrganizationPage extends StatelessWidget {
  const OrganizationPage({Key? key}) : super(key: key);

  static const String _title = 'Organigrama';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DefaultTabController(
        length: 3,
        child: Scaffold(
          drawer: const NavigationDrawerWidget(),
          appBar: AppBar(
            bottom: const TabBar(
              tabs:  [
                Tab(icon: Icon(Icons.directions_car)),
                Tab(icon: Icon(Icons.directions_transit)),
                Tab(icon: Icon(Icons.directions_bike)),
              ],
            ),
            title: const Text(_title),
          ),
          body: const TabBarView(
            children: [
              Center(child: Text("Hola"),),
              Icon(Icons.directions_transit),
              Icon(Icons.directions_bike),
            ],
          ),
        ),
      ),
    );
  }
}


class OrganizationWidget extends StatelessWidget {
  const OrganizationWidget({Key? key}) : super(key: key);

 @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        "Aqui va el codigo"
      ),
    );
  }
}
