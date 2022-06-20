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
  const DirectoryPage({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<DirectoryPage> {
  late List<DirectoryModel>? _directoryModel = [];
  late List<DirectoryModel>? _directoryModelSearch = [];
  final _debouncer = Debouncer();

  @override
  void initState() {
    super.initState();
    _getData();
    _directoryModelSearch = _directoryModel;
  }

  void _getData() async {
    _directoryModel =
        (await ApiDirectoryService().getDirectory())!.cast<DirectoryModel>();
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
        body: _directoryModel == null || _directoryModel!.isEmpty
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
                              _directoryModelSearch = _directoryModel
                                  ?.where(
                                    (u) => (u.fullname.toLowerCase().contains(
                                          string.toLowerCase(),
                                        )),
                                  )
                                  .toList();
                            });
                          });
                        },
                      )),
                  _directoryModelSearch!.isEmpty
                      //Builder del Directorio, que muestra todos los empleados cuando el usuario no realizó ninguna busqueda
                      ? DirectoryBuilder(
                          directoryData: List<DirectoryModel>.generate(
                              _directoryModel!.length,
                              (index) => DirectoryModel(
                                  id: _directoryModel![index].id,
                                  fullname: _directoryModel![index].fullname,
                                  email: _directoryModel![index].email,
                                  photo: _directoryModel![index].photo,
                                  department:_directoryModel![index].department,
                                  position: _directoryModel![index].position,
                                  onlineStatus: _directoryModel![index].onlineStatus)))
                      : DirectoryBuilder(
                          directoryData: List<DirectoryModel>.generate(
                              _directoryModelSearch!.length,
                              (index) => DirectoryModel(
                                  id: _directoryModelSearch![index].id,
                                  fullname:_directoryModelSearch![index].fullname,
                                  email: _directoryModelSearch![index].email,
                                  photo: _directoryModelSearch![index].photo,
                                  department: _directoryModelSearch![index].department,
                                  position: _directoryModelSearch![index].position,
                                  onlineStatus: _directoryModel![index].onlineStatus)))
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
