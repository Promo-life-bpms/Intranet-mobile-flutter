import 'dart:async';

import 'package:flutter/material.dart';
import 'package:intranet_movil/model/directory.dart';
import 'package:intranet_movil/services/api_directory.dart';
import 'package:intranet_movil/utils/alert_dialog.dart';
import 'package:intranet_movil/utils/constants.dart';

class OrganizationDirectoryPage extends StatefulWidget {
  const OrganizationDirectoryPage({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<OrganizationDirectoryPage> {
  late List<DirectoryModel>? _directoryModel = [];
  late List<DirectoryModel> _directoryModelDirectory = [];
  final _debouncer = Debouncer();

  @override
  void initState() {
    super.initState();
    _getData();

   _directoryModelDirectory = _directoryModel!; 
    _debouncer.run(() {
                    setState(() {
                      _directoryModelDirectory = _directoryModel!
                        .where(
                            (u) => (u.department.contains(
                                  "Direccion " ,
                                )),
                          )
                          .toList();
      });
    });

    print(_directoryModelDirectory);
/*     _directoryModelDirectory = _directoryModel!; 
 */    _directoryModelDirectory = _directoryModel!.where((u) => (u.department.contains("Direccion"))).toList();

    }

  void _getData() async {
    _directoryModel = (await ApiDirectoryService().getDirectory())!.cast<DirectoryModel>();
    Future.delayed(const Duration(seconds: 1)).then((value) => setState(() {}));
  }

  @override
  Widget build(BuildContext context) {
    return  _directoryModel == null || _directoryModel!.isEmpty
          ? const Center(
              child: CircularProgressIndicator(),
            )
          :       
           GridView.builder(
              padding: const EdgeInsets.all(0),
              itemCount:  _directoryModel?.where((c) => c.department == "Direccion").length,                 
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              childAspectRatio: 1,
            ),
            itemBuilder: (BuildContext context, int index) {
            
            return
            _directoryModelDirectory![index].department == "Direccion"
            ?  Column(
                children: [
                  SizedBox(
                    width: 80,
                    height: 80,
                    child: CircleAvatar(
                    backgroundImage: NetworkImage(ApiIntranetConstans.baseUrl + _directoryModelDirectory[index].photo.toString()),
                    ),
                  ),
                  const Padding(padding: EdgeInsets.symmetric(vertical: 8)),
                  Center(
                    child: Text(_directoryModelDirectory[index].fullname,
                    style: const TextStyle(fontSize: 12.00,fontWeight: FontWeight.bold,),
                    textAlign: TextAlign.center),
                  ),
                  const Padding(padding: EdgeInsets.symmetric(vertical: 4)),
                  Center(
                    child: Text(_directoryModelDirectory[index].position,
                    style: const TextStyle(fontSize: 10.00),
                    textAlign: TextAlign.center)
                  )
                ],   
              )
              : 
              const Padding(padding: EdgeInsets.all(0));
            },  
          );
          
  }

}

class Debouncer {
  int? milliseconds;
  VoidCallback? action;
  Timer? timer;

  run(VoidCallback action) {
    if (null != timer) {
      timer!.cancel();
    }
    timer = Timer(
      Duration(milliseconds: Duration.millisecondsPerSecond),
      action,
    );
  }
}
