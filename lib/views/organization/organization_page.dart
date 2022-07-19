import 'package:flutter/material.dart';
import 'package:intranet_movil/model/directory.dart';
import 'package:intranet_movil/services/api_directory.dart';
import 'package:intranet_movil/utils/constants.dart';
import 'package:intranet_movil/views/chat/chat_page.dart';
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
import 'package:intranet_movil/views/organization/modules/sales_bh.dart';
import 'package:intranet_movil/views/organization/modules/sales_pl.dart';
import 'package:intranet_movil/views/organization/modules/store.dart';
import 'package:intranet_movil/views/organization/modules/systems.dart';
import 'package:intranet_movil/views/organization/modules/technology.dart';
import 'package:intranet_movil/widget/navigation_drawer_widget.dart';

class OrganizationPage extends StatefulWidget {
  const OrganizationPage({Key? key, required this.directoryData}) : super(key: key);
  final List<DirectoryModel> directoryData;

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<OrganizationPage> {
  late List<DirectoryModel>? _directoryModel = [];
  static List<DirectoryModel>? _directoryList = [];

  @override
  void initState() {
    super.initState();
     if(widget.directoryData.isNotEmpty){
        _directoryList = widget.directoryData;
    }else{
      _getData();
    }
  }

  void _getData() async {
    _directoryModel = (await ApiDirectoryService().getDirectory())!.cast<DirectoryModel>();
    setState(() {
      _directoryList = _directoryModel;
    });
    Future.delayed(const Duration(seconds: 1)).then((value) => setState(() {}));
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          primaryColor: ColorIntranetConstants.primaryColorLight,
          primaryColorLight: ColorIntranetConstants.primaryColorLight,
          primaryColorDark: ColorIntranetConstants.primaryColorDark,
          backgroundColor: ColorIntranetConstants.backgroundColorDark,
          hoverColor: ColorIntranetConstants.primaryColorLight,
          scaffoldBackgroundColor: ColorIntranetConstants.backgroundColorNormal,
          appBarTheme: const AppBarTheme(
              backgroundColor: ColorIntranetConstants.primaryColorLight)),
      home: DefaultTabController(
        length: 15,
        child: Scaffold(
          drawer: const NavigationDrawerWidget(),
          appBar: AppBar(
            actions: [
          Padding(
              padding:const  EdgeInsets.only(right: 8.0),
              child: GestureDetector(
                onTap: () {
                  Navigator.of(context)
                   .push(MaterialPageRoute(builder: (context) => const ChatPage()));
                },
                child: const Image(
                  image: AssetImage('lib/assets/chat.png'),
                ),
              ),
            ),
        ],
            bottom: TabBar(
                isScrollable: true,
                unselectedLabelColor: Colors.white.withOpacity(0.3),
                indicatorColor: Colors.white,
                tabs: const [
                  Tab(
                    child:
                        Text(StringIntranetConstants.organizationDirectoryPage),
                  ),
                  Tab(
                    child: Text(StringIntranetConstants.organizationRHPage),
                  ),
                  Tab(
                    child: Text(
                        StringIntranetConstants.organizationManagementPage),
                  ),
                  Tab(
                    child:
                        Text(StringIntranetConstants.organizationSalesBHPage),
                  ),
                  Tab(
                    child:
                        Text(StringIntranetConstants.organizationSalesPLPage),
                  ),
                  Tab(
                    child: Text(StringIntranetConstants.organizationImportPage),
                  ),
                  Tab(
                    child: Text(StringIntranetConstants.organizationDesingPage),
                  ),
                  Tab(
                    child: Text(StringIntranetConstants.organizationSystemPage),
                  ),
                  Tab(
                    child:
                        Text(StringIntranetConstants.organizationOperationPage),
                  ),
                  Tab(
                    child: Text(
                        StringIntranetConstants.organizationTechnologyPage),
                  ),
                  Tab(
                    child: Text(StringIntranetConstants.organizationCancunPage),
                  ),
                  Tab(
                    child:
                        Text(StringIntranetConstants.organizationMarketingPage),
                  ),
                  Tab(
                    child: Text(
                        StringIntranetConstants.organizationCommunicationPage),
                  ),
                  Tab(
                    child:
                        Text(StringIntranetConstants.organizationLogisticPage),
                  ),
                  Tab(
                    child: Text(StringIntranetConstants.organizationStorePage),
                  ),
                ]),
            title: const Text(StringIntranetConstants.organizationPage),
          ),
          body: TabBarView(
            children: [
              OrganizationDirectoryPage(
                  directoryModel: _directoryList!
                      .where((i) => i.department == "Direccion")
                      .toList()),
              RHDirectoryPage(
                  directoryModel: _directoryList!
                      .where((i) => i.department == "Recursos Humanos")
                      .toList()),
              ManagementDirectoryPage(
                  directoryModel: _directoryList!
                      .where((i) => i.department == "Administracion")
                      .toList()),
              SalesBHDirectoryPage(
                  directoryModel: _directoryList!
                      .where((i) => i.department == "Ventas BH")
                      .toList()),
              SalesPLDirectoryPage(
                  directoryModel: _directoryList!
                      .where((i) => i.department == "Ventas PL")
                      .toList()),
              ImportsDirectoryPage(
                  directoryModel: _directoryList!
                      .where((i) => i.department == "Importaciones")
                      .toList()),
              DesignDirectoryPage(
                  directoryModel: _directoryList!
                      .where((i) => i.department == "Diseno")
                      .toList()),
              SystemsDirectoryPage(
                  directoryModel: _directoryList!
                      .where((i) => i.department == "Sistemas")
                      .toList()),
              OperationsDirectoryPage(
                  directoryModel: _directoryList!
                      .where((i) => i.department == "Operaciones")
                      .toList()),
              TechnologyDirectoryPage(
                  directoryModel: _directoryList!
                      .where((i) => i.department == "Tecnologia e Innovacion")
                      .toList()),
              CancunDirectoryPage(
                  directoryModel: _directoryList!
                      .where((i) => i.department == "Cancun")
                      .toList()),
              MarketingDirectoryPage(
                  directoryModel: _directoryList!
                      .where((i) => i.department == "Marketing")
                      .toList()),
              CommunicationDirectoryPage(
                  directoryModel: _directoryList!
                      .where((i) => i.department == "Comunicacion")
                      .toList()),
              LogisticsDirectoryPage(
                  directoryModel: _directoryList!
                      .where((i) => i.department == "Logistica")
                      .toList()),
              StoreDirectoryPage(
                  directoryModel: _directoryList!
                      .where((i) => i.department == "Almacen")
                      .toList()),
            ],
          ),
        ),
      ),
    );
  }
}
