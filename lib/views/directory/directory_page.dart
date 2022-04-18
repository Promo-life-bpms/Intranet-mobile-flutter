import 'package:flutter/material.dart';
import 'package:intranet_movil/model/directory.dart';
import 'package:intranet_movil/services/api_directory.dart';
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
    print(_directoryModel);
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
                    child: Row(
                    children: [
                      const Padding(
                        padding: EdgeInsets.symmetric(vertical: 16.0, horizontal: 24.0),
                        child: SizedBox(
                          width: 50,
                          height: 50,
                          child:CircleAvatar(
                          backgroundImage: AssetImage('lib/assets/pdf.png'),
                          ),
                        )    
                      ),
                      Column(
                        children: [
                          RichText(
                            overflow: TextOverflow.clip,
                            strutStyle: const StrutStyle(fontSize: 12.0),
                            text: TextSpan(
                                style: const TextStyle(fontSize: 12.00,),
                                text: _directoryModel![index].name + _directoryModel![index].lastname ,
                          ),
                         /*  Text(
                            _directoryModel![index].name + " " +_directoryModel![index].lastname ,
                            style: const TextStyle(fontSize: 16.00,fontWeight: FontWeight.bold,),
                          ), */
                          /* const Padding(padding: EdgeInsets.only(top:4)),
                           Text(
                            _directoryModel![index].position,
                            style: const TextStyle(fontSize: 12.00,),
                            textAlign: TextAlign.left,
                          ), */
                          ),   
                        ],
                      ),        
                    ],
                  ),
                  
                );
              },
            ),
    );
  }
}
