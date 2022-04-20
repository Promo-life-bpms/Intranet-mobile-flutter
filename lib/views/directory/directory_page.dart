import 'package:flutter/material.dart';
import 'package:intranet_movil/model/directory.dart';
import 'package:intranet_movil/services/api_directory.dart';
import 'package:intranet_movil/utils/alert_dialog.dart';
import 'package:intranet_movil/utils/constants.dart';
import 'package:intranet_movil/widget/navigation_drawer_widget.dart';

class DirectoryPage extends StatefulWidget {
  const DirectoryPage({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<DirectoryPage> {
  late List<DirectoryModel>? _directoryModel = [];
  
  @override
  void initState() {
    super.initState();
    _getData();
  }

  void _getData() async {
    _directoryModel = (await ApiDirectoryService().getDirectory())!.cast<DirectoryModel>();
    Future.delayed(const Duration(seconds: 1)).then((value) => setState(() {}));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const NavigationDrawerWidget(),
      appBar: AppBar(
        title: const Text('Directorio'),
      ),
      body: _directoryModel == null || _directoryModel!.isEmpty
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : 
          ListView.builder(
              padding: const EdgeInsets.only(left:16, right: 16),
              itemCount: _directoryModel!.length,
              itemBuilder: (context, index) {
                return Card(
                  shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                  ),
                  clipBehavior: Clip.antiAlias,
                  child: InkWell(
                    onTap: (){
                      UserCardAlertDialog.showFullDialog(
                        context,
                        _directoryModel![index].name + " " +_directoryModel![index].lastname,
                        _directoryModel![index].email,
                         ApiIntranetConstans.baseUrl + _directoryModel![0].photo, 
                        _directoryModel![index].department,
                        _directoryModel![index].position );
                    },
                    child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 24.0),
                        child: SizedBox(
                          width: 50,
                          height: 50,
                          child:CircleAvatar(
                          backgroundImage: NetworkImage(ApiIntranetConstans.baseUrl + _directoryModel![0].photo.toString()),
/*                           backgroundImage: NetworkImage(ApiIntranetConstans.baseUrl + _directoryModel![index].photo.toString()),
 */                          ),
                        )    
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                              _directoryModel![index].name + " " +_directoryModel![index].lastname,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: const TextStyle(fontSize: 16.00,fontWeight: FontWeight.bold,),
                          ),
                         const Padding(
                            padding: EdgeInsets.only(top:8)
                          ),
                         Text(
                              _directoryModel![index].position,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: const TextStyle(fontSize: 12.00,)
                          )  
                          
                        ],
                      ),        
                    ],
                  ),
                  ),

                    
                  
                );
              },
            ),
    );
  }
}
