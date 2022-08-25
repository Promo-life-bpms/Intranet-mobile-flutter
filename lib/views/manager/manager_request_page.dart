import 'package:flutter/material.dart';
import 'package:intranet_movil/model/approve_request.dart';
import 'package:intranet_movil/services/api_manager_request.dart';
import 'package:intranet_movil/utils/constants.dart';
import 'package:intranet_movil/views/chat/chat_page.dart';
import 'package:intranet_movil/views/manager/module/approved_manager_request.dart';
import 'package:intranet_movil/views/manager/module/pending_manager_request.dart';
import 'package:intranet_movil/views/manager/module/rejected_manager_request.dart';
import 'package:intranet_movil/widget/navigation_drawer_widget.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ManagerRequestPage extends StatefulWidget {
  const ManagerRequestPage({Key? key}) : super(key: key);
 
  @override
  _ManagerRequestPage createState() => _ManagerRequestPage();
}

class _ManagerRequestPage extends State<ManagerRequestPage> {
  
  
  late List<ApprovedRequestModel>? _approvedRequestModel = [];
  late List<ApprovedRequestModel>? _approvedRequestModel2 = [];


  @override
  void initState() {
    super.initState();
    _getData();
   
  }

  Stream<List<ApprovedRequestModel>?> _request() async* {
    while (true) {
      await Future<void>.delayed(const Duration(seconds: 2));
       final prefs = await SharedPreferences.getInstance();
      String? token = prefs.getString('token');
      _approvedRequestModel2 = (await ApiManagerRequestService().getManagerRequest(token.toString()))!.cast<ApprovedRequestModel>();
      
      yield _approvedRequestModel2;
     
    }
  }


  void _getData() async {
    final prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString('token');

    _approvedRequestModel = (await ApiManagerRequestService().getManagerRequest(token.toString()))!.cast<ApprovedRequestModel>();
    
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
          body: StreamBuilder(
                  stream: _request(),
                  builder:
                      (context, AsyncSnapshot<List<ApprovedRequestModel>?> snapshot) {
                    
                    if (snapshot.hasData) {
                      _approvedRequestModel = _approvedRequestModel2;
                      TabBarView(
                        children: [
                          PendingManagerRequestPage(approvedModel: _approvedRequestModel!.reversed.where((element) => element.directManagerStatus == "Pendiente").toList()),
                          ApprovedManagerRequestPage(approvedModel: _approvedRequestModel!.reversed.where((element) => element.directManagerStatus == "Aprobada").toList()),
                          RejectedManagerRequestPage(approvedModel: _approvedRequestModel!.reversed.where((element) => element.directManagerStatus == "Rechazada").toList())   
                          ] 
                        );
                    }
                    return TabBarView(
                        children: [
                          PendingManagerRequestPage(approvedModel: _approvedRequestModel!.reversed.where((element) => element.directManagerStatus == "Pendiente").toList()),
                          ApprovedManagerRequestPage(approvedModel: _approvedRequestModel!.reversed.where((element) => element.directManagerStatus == "Aprobada").toList()),
                          RejectedManagerRequestPage(approvedModel: _approvedRequestModel!.reversed.where((element) => element.directManagerStatus == "Rechazada").toList())   
                          ] 
                        );
                   }
                  )
          ),
        ),
      );
  }
}