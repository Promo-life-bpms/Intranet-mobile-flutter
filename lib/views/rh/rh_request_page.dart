import 'package:flutter/material.dart';
import 'package:intranet_movil/model/approve_request.dart';
import 'package:intranet_movil/services/api_rh_request.dart';
import 'package:intranet_movil/utils/constants.dart';
import 'package:intranet_movil/views/chat/chat_page.dart';
import 'package:intranet_movil/views/manager/module/approved_manager_request.dart';
import 'package:intranet_movil/views/manager/module/pending_manager_request.dart';
import 'package:intranet_movil/views/manager/module/rejected_manager_request.dart';
import 'package:intranet_movil/views/rh/module/approved_rh_request.dart';
import 'package:intranet_movil/views/rh/module/pending_rh_request.dart';
import 'package:intranet_movil/views/rh/module/rejected_rh_request.dart';
import 'package:intranet_movil/widget/navigation_drawer_widget.dart';

class RHRequestPage extends StatefulWidget {
  const RHRequestPage({Key? key}) : super(key: key);
 
  @override
  _RHRequestPage createState() => _RHRequestPage();
}

class _RHRequestPage extends State<RHRequestPage> {
  
  
  late List<ApprovedRequestModel>? _approvedRequestModel = [];


  @override
  void initState() {
    super.initState();
    _getData();
  }

  void _getData() async {

    _approvedRequestModel = (await ApiRhRequestService().getRhRequest())!.cast<ApprovedRequestModel>();
    
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
        length: 3,
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
                        Text(StringIntranetConstants.requestPendingPage),
                  ),
                  Tab(
                    child: Text(StringIntranetConstants.requestApprovedPage),
                  ),
                  Tab(
                    child: Text(
                        StringIntranetConstants.requestRejectedPage),
                  ),
                 
                ]),
            title: const Text(StringIntranetConstants.managerApproveRequest),
          ),
          body: TabBarView(
            children: [
              PendingRhRequestPage(approvedModel: _approvedRequestModel!.where((element) => element.directManagerStatus == "Pendiente").toList()),
              ApprovedRhRequestPage(approvedModel: _approvedRequestModel!.where((element) => element.directManagerStatus == "Aprobada").toList()),
              RejectedRhRequestPage(approvedModel: _approvedRequestModel!.where((element) => element.directManagerStatus == "Rechazada").toList())   
              ] 
            ),
          ),
        ),
      );
  }
}