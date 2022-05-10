import 'package:flutter/material.dart';
import 'package:intranet_movil/model/request.dart';
import 'package:intranet_movil/services/api_request.dart';
import 'package:intranet_movil/utils/constants.dart';
import 'package:intranet_movil/views/request/modules/approved.dart';
import 'package:intranet_movil/views/request/modules/pending.dart';
import 'package:intranet_movil/views/request/modules/process.dart';
import 'package:intranet_movil/views/request/modules/rejected.dart';
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

    _requestModel = (await ApiRequestService().getRequest(token.toString()))!.cast<RequestModel>();
    Future.delayed(const Duration(seconds: 1)).then((value) => setState(() {}));
  }


  static const String _title = 'Solicitudes';
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
        length: 4  ,
        child: Scaffold(
          drawer: const NavigationDrawerWidget(),
          appBar: AppBar(
            bottom: TabBar(
              isScrollable: true,
              unselectedLabelColor: Colors.white.withOpacity(0.3),
              indicatorColor: Colors.white,
              tabs: const [
                  Tab(child: Text('Pendientes'),),
                  Tab(child: Text('En proceso'),),
                  Tab(child: Text('Aprobadas'),),
                  Tab(child: Text('Rechazadas'),),
                ]),
            title: const Text(_title),
          ),
          body: TabBarView(
            children: [
              PendingRequestPage( requestModel: _requestModel),
              ProcessRequestPage(requestModel: _requestModel),
              ApprovedRequestPage(requestModel: _requestModel),
              RejectedRequestPage(requestModel: _requestModel),
            ],
          ),
        ),
      ),
    );
  }
}


