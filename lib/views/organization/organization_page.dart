import 'package:flutter/material.dart';
import 'package:intranet_movil/model/directory.dart';
import 'package:intranet_movil/services/api_directory.dart';
import 'package:intranet_movil/utils/constants.dart';
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

class OrganizationPage extends StatefulWidget {
  const OrganizationPage({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<OrganizationPage> {
  late List<DirectoryModel>? _directoryModel = [];
  late List<DirectoryModel>? _directoryModelFull = [];


  @override
  void initState() {
    super.initState();
    _getData();
    }

  void _getData() async {
    _directoryModel = (await ApiDirectoryService().getDirectory())!.cast<DirectoryModel>();
    if(_directoryModel!=null && _directoryModel!.isNotEmpty){
      _directoryModelFull = _directoryModel;
    }
    Future.delayed(const Duration(seconds: 1)).then((value) => setState(() {}));
  }


  static const String _title = 'Organigrama';
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: ColorIntranetConstants.primaryColorLight, 
        primaryColorLight: ColorIntranetConstants.primaryColorLight,
        primaryColorDark: ColorIntranetConstants.primaryColorDark,
        backgroundColor: ColorIntranetConstants.backgroundColorDark,
        hoverColor: ColorIntranetConstants.primaryColorLight,
        appBarTheme: const AppBarTheme(backgroundColor: ColorIntranetConstants.primaryColorLight) 
        ),
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
          body: TabBarView(
            children: [
              OrganizationDirectoryPage(directoryModel: _directoryModel?.where((i) => i.department =="Direccion").toList()),
              RHDirectoryPage(directoryModel:  _directoryModel?.where((i) => i.department =="Recursos Humanos").toList()),
              ManagementDirectoryPage(directoryModel:  _directoryModel?.where((i) => i.department =="Administracion").toList()),
              SalesBHDirectoryPage(directoryModel:  _directoryModel?.where((i) => i.department =="Ventas BH").toList()),
              SalesPLDirectoryPage(directoryModel:  _directoryModel?.where((i) => i.department =="Ventas BH").toList()),
              ImportsDirectoryPage(directoryModel:  _directoryModel?.where((i) => i.department =="Importaciones").toList()),
              DesignDirectoryPage(directoryModel:  _directoryModel?.where((i) => i.department =="Diseno").toList()),
              SystemsDirectoryPage(directoryModel:  _directoryModel?.where((i) => i.department =="Sistemas").toList()),
              OperationsDirectoryPage(directoryModel:  _directoryModel?.where((i) => i.department =="Operaciones").toList()),
              TechnologyDirectoryPage(directoryModel:  _directoryModel?.where((i) => i.department =="Tecnologia e Innovacion").toList()),
              CancunDirectoryPage(directoryModel:  _directoryModel?.where((i) => i.department =="Cancun").toList()),
              MarketingDirectoryPage(directoryModel:  _directoryModel?.where((i) => i.department =="Marketing").toList()),
              CommunicationDirectoryPage(directoryModel:  _directoryModel?.where((i) => i.department =="Comunicacion").toList()),
              LogisticsDirectoryPage(directoryModel:  _directoryModel?.where((i) => i.department =="Logistica").toList()),
              StoreDirectoryPage(directoryModel:  _directoryModel?.where((i) => i.department =="Almacen").toList()),
            ],
          ),
        ),
      ),
    );
  }
}


