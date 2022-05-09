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
        primaryColor: ColorIntranetConstants.kPrimaryColorLight, 
        primaryColorLight: ColorIntranetConstants.kPrimaryColorLight,
        primaryColorDark: ColorIntranetConstants.kPrimaryColorDark,
        backgroundColor: ColorIntranetConstants.kbackgroundColorDark,
        hoverColor: ColorIntranetConstants.kPrimaryColorLight,
        appBarTheme: const AppBarTheme(backgroundColor: ColorIntranetConstants.kPrimaryColorLight) 
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
              OrganizationDirectoryPage(directoryModel: _directoryModel),
              RHDirectoryPage(directoryModel: _directoryModel),
              ManagementDirectoryPage(directoryModel: _directoryModel),
              SalesBHDirectoryPage(directoryModel: _directoryModel),
              SalesPLDirectoryPage(directoryModel: _directoryModel),
              ImportsDirectoryPage(directoryModel: _directoryModel),
              DesignDirectoryPage(directoryModel: _directoryModel),
              SystemsDirectoryPage(directoryModel: _directoryModel),
              OperationsDirectoryPage(directoryModel: _directoryModel),
              TechnologyDirectoryPage(directoryModel: _directoryModel),
              CancunDirectoryPage(directoryModel: _directoryModel),
              MarketingDirectoryPage(directoryModel: _directoryModel),
              CommunicationDirectoryPage(directoryModel: _directoryModel),
              LogisticsDirectoryPage(directoryModel: _directoryModel),
              StoreDirectoryPage(directoryModel: _directoryModel),
            ],
          ),
        ),
      ),
    );
  }
}


