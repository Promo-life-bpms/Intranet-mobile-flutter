import 'package:flutter/material.dart';
import 'package:intranet_movil/model/request.dart';
import 'package:intranet_movil/services/api_request.dart';
import 'package:intranet_movil/utils/constants.dart';
import 'package:intranet_movil/views/request/modules/approved.dart';
import 'package:intranet_movil/views/request/modules/pending.dart';
import 'package:intranet_movil/views/request/modules/process.dart';
import 'package:intranet_movil/views/request/modules/rejected.dart';
import 'package:intranet_movil/views/request/new_request.dart';
import 'package:intranet_movil/widget/navigation_drawer_widget.dart';
import 'package:shared_preferences/shared_preferences.dart';

class RequestMainPage extends StatefulWidget {
  const RequestMainPage({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<RequestMainPage> {
  late List<RequestModel>? _requestModel = [];

  @override
  void initState() {
    super.initState();
    _getData();
  }

  void _getData() async {
    final prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString('token');

    _requestModel = (await ApiRequestService().getRequest(token.toString()))!
        .cast<RequestModel>();
    Future.delayed(const Duration(seconds: 1)).then((value) => setState(() {}));
  }

  static const String _title = 'Solicitudes';
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          primaryColor: ColorIntranetConstants.primaryColorLight,
          primaryColorLight: ColorIntranetConstants.primaryColorLight,
          primaryColorDark: ColorIntranetConstants.primaryColorDark,
          backgroundColor: ColorIntranetConstants.backgroundColorDark,
          hoverColor: ColorIntranetConstants.primaryColorLight,
          appBarTheme: const AppBarTheme(
              backgroundColor: ColorIntranetConstants.primaryColorLight)),
      home: DefaultTabController(
        length: 4,
        child: Scaffold(
          drawer: const NavigationDrawerWidget(),
          appBar: AppBar(
            bottom: TabBar(
                isScrollable: true,
                unselectedLabelColor: Colors.white.withOpacity(0.3),
                indicatorColor: Colors.white,
                tabs: const [
                  Tab(
                    child: Text('Pendientes'),
                  ),
                  Tab(
                    child: Text('En proceso'),
                  ),
                  Tab(
                    child: Text('Aprobadas'),
                  ),
                  Tab(
                    child: Text('Rechazadas'),
                  ),
                ]),
            title: const Text(_title),
          ),
          body: TabBarView(
            children: [
              PendingRequestPage(requestModel: _requestModel?.where((i) => i.directManagerStatus == "Pendiente" && i.humanResourcesStatus=="Pendiente").toList()),
              ProcessRequestPage(requestModel: _requestModel?.where((i) => i.directManagerStatus == "Aprobada" && i.humanResourcesStatus=="Pendiente").toList()),
              ApprovedRequestPage(requestModel: _requestModel?.where((i) => i.directManagerStatus == "Aprobada" && i.humanResourcesStatus=="Aprobada").toList()),
              RejectedRequestPage(requestModel: _requestModel?.where((i) => i.directManagerStatus == "Rechazada" || i.humanResourcesStatus=="Rechazada").toList()),
            ],
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => RequestPage()),
              );
            },
            backgroundColor: ColorIntranetConstants.primaryColorNormal,
            child: const Icon(Icons.add),
          ),
        ),
      ),
    );
  }
}


