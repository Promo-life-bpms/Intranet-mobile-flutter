import 'package:flutter/material.dart';
import 'package:intranet_movil/utils/constants.dart';
import 'package:intranet_movil/views/request/modules/approved.dart';
import 'package:intranet_movil/views/request/modules/pending.dart';
import 'package:intranet_movil/views/request/modules/process.dart';
import 'package:intranet_movil/views/request/modules/rejected.dart';
import 'package:intranet_movil/widget/navigation_drawer_widget.dart';

void main() => runApp(const RequestMainPage());

class RequestMainPage extends StatelessWidget {
  const RequestMainPage({Key? key}) : super(key: key);
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
          body: const TabBarView(
            children: [
              PendingRequestPage(),
              ProcessRequestPage(),
              ApprovedRequestPage(),
              RejectedRequestPage(),
            ],
          ),
        ),
      ),
    );
  }
}


