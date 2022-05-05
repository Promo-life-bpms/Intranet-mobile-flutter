import 'package:flutter/material.dart';
import 'package:intranet_movil/views/organization/modules/cancun.dart';
import 'package:intranet_movil/views/organization/modules/communication.dart';
import 'package:intranet_movil/views/organization/modules/desing.dart';
import 'package:intranet_movil/views/organization/modules/directory.dart';
import 'package:intranet_movil/views/organization/modules/imports.dart';
import 'package:intranet_movil/views/organization/modules/logistics.dart';
import 'package:intranet_movil/views/organization/modules/management.dart';
import 'package:intranet_movil/views/organization/modules/marketing.dart';
import 'package:intranet_movil/views/organization/modules/operations.dart';
import 'package:intranet_movil/views/organization/modules/rh.dart';
import 'package:intranet_movil/views/organization/modules/salesBH.dart';
import 'package:intranet_movil/views/organization/modules/salesPL.dart';
import 'package:intranet_movil/views/organization/modules/store.dart';
import 'package:intranet_movil/views/organization/modules/systems.dart';
import 'package:intranet_movil/views/organization/modules/technology.dart';
import 'package:intranet_movil/widget/navigation_drawer_widget.dart';

void main() => runApp(const OrganizationPage());

class OrganizationPage extends StatelessWidget {
  const OrganizationPage({Key? key}) : super(key: key);

  static const String _title = 'Organigrama';
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DefaultTabController(
        length: 15  ,
        child: Scaffold(
          drawer: const NavigationDrawerWidget(),
          appBar: AppBar(
            bottom: TabBar(
              isScrollable: true,
              unselectedLabelColor: Colors.white.withOpacity(0.3),
              indicatorColor: Colors.white,
              tabs: const [
                  Tab(child: Text('Direccion'),),
                  Tab(child: Text('Recursos Humanos'),),
                  Tab(child: Text('Administración'),),
                  Tab(child: Text('Ventas BH'),),
                  Tab(child: Text('Ventas PL'),),
                  Tab(child: Text('Importaciones'),),
                  Tab(child: Text('Diseno'),),
                  Tab(child: Text('Sistemas'),),
                  Tab(child: Text('Operaciones'),),
                  Tab(child: Text('Tecnología e Innovación'),),
                  Tab(child: Text('Cancún'),),
                  Tab(child: Text('Marketing'),),
                  Tab(child: Text('Comunicación'),),
                  Tab(child: Text('Logística'),),
                  Tab(child: Text('Almacen'),),
                ]),
            title: const Text(_title),
          ),
          body: const TabBarView(
            children: [
              OrganizationDirectoryPage(),
              RHDirectoryPage(),
              ManagementDirectoryPage(),
              SalesBHDirectoryPage(),
              SalesPLDirectoryPage(),
              ImportsDirectoryPage(),
              DesignDirectoryPage(),
              SystemsDirectoryPage(),
              OperationsDirectoryPage(),
              TechnologyDirectoryPage(),
              CancunDirectoryPage(),
              MarketingDirectoryPage(),
              CommunicationDirectoryPage(),
              LogisticsDirectoryPage(),
              StoreDirectoryPage(),
            ],
          ),
        ),
      ),
    );
  }
}


