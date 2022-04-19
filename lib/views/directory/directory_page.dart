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
                  shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                  ),
                  clipBehavior: Clip.antiAlias,
                  child: InkWell(
                    onTap: (){
                      UserCardAlertDialog.showFullDialog(
                        context,
                       /*  ApiIntranetConstans.baseUrl + _directoryModel![0].photo, */
                        _directoryModel![index].name + " " +_directoryModel![index].lastname,
                        _directoryModel![index].position );
                    },
                    child: Row(
                    children: [
                      _directoryModel![index].photo == null
                          ?  const Padding(
                              padding: EdgeInsets.symmetric(vertical: 16.0, horizontal: 24.0),
                              child: SizedBox(
                                width: 50,
                                height: 50,
                                child:CircleAvatar(
                                backgroundImage: AssetImage('lib/assets/user.png'),
                                ),
                              )    
                            )
                          :
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
/* 
_showDialog(BuildContext context/* , String img, String name, String description */ ) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Expanded(
          child: AlertDialog(
            title: Text('Welcome'),
            content: Text('Do you wanna learn flutter?'),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text('YES', style: TextStyle(color: Colors.black),),
              ),
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text('NO', style: TextStyle(color: Colors.black),),
              ),
            ],
          ),
        );
      },
    ); 
}

_showFullDialog(BuildContext context/* , String img, String name, String description, Data data  */ ) {

  showGeneralDialog(
        context: context,
        barrierDismissible: true,
        barrierLabel: MaterialLocalizations.of(context)
          .modalBarrierDismissLabel,
        transitionDuration: const Duration(milliseconds: 200),
        pageBuilder: (BuildContext buildContext,
          Animation animation,
          Animation secondaryAnimation) {
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 32.0, horizontal: 16.0),
            child: Card(
              child:  SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Column(
                children: [
                  Container(
                  width: double.infinity,
                  height: 200.0,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage("https://media-exp1.licdn.com/dms/image/C4E1BAQHZpvSzm3mrGg/company-background_10000/0/1604596643746?e=2159024400&v=beta&t=7eQro0ejdMhEJ8UTKMZ2fEjTZmbCc6KtEm5kg-LeXIw"),
                      fit: BoxFit.cover,
                    ),
                  ),
                  
                  child:const  Align(
                    alignment:  Alignment(0, 2),
                    child: SizedBox(
                      width: 100.0,
                      height: 100.0,
                      child: OverflowBox(
                        child: CircleAvatar(
                        backgroundImage: AssetImage('lib/assets/user.png'),
                        ),
                      ),
                    ),
                  ),
                ),
                ],
              ),
              ),
              
            ),
          );
        }
      );

} */