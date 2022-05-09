import 'dart:async';

import 'package:flutter/material.dart';
import 'package:intranet_movil/model/request.dart';
import 'package:intranet_movil/services/api_request.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PendingRequestPage extends StatefulWidget {
  const PendingRequestPage({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<PendingRequestPage> {

  

   late List<RequestModel>? _userlModel = [];

  @override
  void initState() {
    super.initState();
    _getData();
  }

   void _getData() async {
    final prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString('token');

    _userlModel = (await ApiRequestService().getRequest(token.toString()))!.cast<RequestModel>();
    Future.delayed(const Duration(seconds: 1)).then((value) => setState(() {}));
  }
 
  @override
  Widget build(BuildContext context) {
    return  _userlModel == null || _userlModel!.isEmpty
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : 
          Center(child: Text("adqdw"),);
          /* Column(
            children: [
              const Padding(padding: EdgeInsets.only(top: 20)),
              Expanded(
                child: ListView.builder(
                  padding: const EdgeInsets.only(left:16, right: 16),
                  itemCount: _requestModel!.length,
                  itemBuilder: (context, index) {
                    return 
                    _requestModel![index].direct_manager_status =="Pendiente" && _requestModel![index].human_resources_status =="Pendiente" 
                    ?Card(
                      shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      ),
                      clipBehavior: Clip.antiAlias,
                      /* child: InkWell(
                        onTap: (){
                          UserCardAlertDialog.showFullDialog(
                            context,
                            _requestModel![index].type_request.toString(),
                            _directoryModel![index].email,
                            ApiIntranetConstans.baseUrl + _directoryModel![index].photo, 
                            _directoryModel![index].department,
                            _directoryModel![index].position );
                        }, */
                        child: Row(
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                  _requestModel![index].type_request,
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  style: const TextStyle(fontSize: 16.00,fontWeight: FontWeight.bold,),
                              ),
                              const Padding(
                                padding: EdgeInsets.only(top:8)
                              ),
                              Text(
                                  _requestModel![index].payment,
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  style: const TextStyle(fontSize: 12.00,)
                              ),  
                            ],
                          ),        
                        ],
                        ),
                      )
                    
                    : const Padding(padding: EdgeInsets.zero);
                  },
                ),
              )
            ],
          ); */
  }
}
