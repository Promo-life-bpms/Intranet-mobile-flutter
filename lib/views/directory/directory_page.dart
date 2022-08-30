import 'dart:async';

import 'package:flutter/material.dart';
import 'package:intranet_movil/model/directory.dart';
import 'package:intranet_movil/services/api_directory.dart';
import 'package:intranet_movil/utils/constants.dart';
import 'package:intranet_movil/views/chat/chat_page.dart';
import 'package:intranet_movil/views/directory/widget/directory_builder.dart';
import 'package:intranet_movil/widget/navigation_drawer_widget.dart';
import 'package:intranet_movil/widget/skeletons/list_view_company.dart';

class DirectoryPage extends StatefulWidget {
  const DirectoryPage({Key? key, required this.directoryData}) : super(key: key);
  final List<DirectoryModel> directoryData;

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<DirectoryPage> {
  late List<DirectoryModel>? _directoryModel = [];


  static List<DirectoryModel>? _directoryList = [];
  static List<DirectoryModel>? _directoryListSearch = [];
  final _debouncer = Debouncer();

  @override
  void initState() {
    super.initState();

     if(widget.directoryData.isNotEmpty){
        _directoryList = widget.directoryData;
        _directoryListSearch = widget.directoryData;
    }else{
      _getData();
    }
   
  }

  void _getData() async {
    _directoryModel = (await ApiDirectoryService().getDirectory())!.cast<DirectoryModel>();
    setState(() {
      _directoryList = _directoryModel;
      _directoryListSearch = _directoryModel;
    });
    Future.delayed(const Duration(seconds: 1)).then((value) => setState(() {}));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
          title: const Text(StringIntranetConstants.directoryPage),
        ),
        body: _directoryList == null || _directoryList!.isEmpty
            ? const ListviewCompanyPage()
            : Column(
                children: [
                  //Widget de barra de busqueda
                  Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 16.0, horizontal: 24.0),
                      child: TextField(
                        textInputAction: TextInputAction.search,
                        decoration: InputDecoration(
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(25.0),
                            borderSide: const BorderSide(
                              color: Colors.grey,
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20.0),
                            borderSide: const BorderSide(
                              color: Colors.blue,
                            ),
                          ),
                          suffixIcon: const InkWell(
                            child: Icon(Icons.search),
                          ),
                          contentPadding: const EdgeInsets.all(15.0),
                          hintText: 'Buscar',
                        ),
                        onChanged: (string) {
                          _debouncer.run(() {
                            setState(() {
                              //Filtrado de usuarios por nombre completo
                              _directoryListSearch = _directoryList
                                  ?.where(
                                    (u) => (u.fullname.toLowerCase().contains(
                                          string.toLowerCase(),
                                        )),
                                  )
                                  .toList();
                               if(_directoryListSearch!.isEmpty){
                                _directoryListSearch = _directoryList; 
                               }   
                            });
                          });
                        },
                      )),
                  _directoryListSearch!.isEmpty
                      //Builder del Directorio, que muestra todos los empleados cuando el usuario no realizó ninguna busqueda
                      ? DirectoryBuilder(
                          directoryData: List<DirectoryModel>.generate(
                              _directoryListSearch!.length,
                              (index) => DirectoryModel(
                                  id: _directoryListSearch![index].id,
                                  fullname: _directoryListSearch![index].fullname,
                                  email: _directoryListSearch![index].email,
                                  photo: _directoryListSearch![index].photo,
                                  department:_directoryListSearch![index].department,
                                  position: _directoryListSearch![index].position,
                                  onlineStatus: _directoryListSearch![index].onlineStatus,
                                  data: _directoryListSearch![index].data)))
                      : DirectoryBuilder(
                          directoryData: List<DirectoryModel>.generate(
                              _directoryListSearch!.length,
                              (index) => DirectoryModel(
                                  id: _directoryListSearch![index].id,
                                  fullname:_directoryListSearch![index].fullname,
                                  email: _directoryListSearch![index].email,
                                  photo: _directoryListSearch![index].photo,
                                  department: _directoryListSearch![index].department,
                                  position: _directoryListSearch![index].position,
                                  onlineStatus: _directoryListSearch![index].onlineStatus,
                                  data: _directoryListSearch![index].data)))
                ],
              ));
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
      const Duration(milliseconds: Duration.millisecondsPerSecond),
      action,
    );
  }
}
