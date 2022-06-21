import 'dart:async';

import 'package:flutter/material.dart';
import 'package:intranet_movil/model/directory.dart';
import 'package:intranet_movil/model/message.dart';
import 'package:intranet_movil/model/user_model.dart';
import 'package:intranet_movil/services/api_directory.dart';
import 'package:intranet_movil/services/api_message.dart';
import 'package:intranet_movil/views/chat/widget/user_chat_builder.dart';
import 'package:intranet_movil/widget/skeletons/list_view_company.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserChatPage extends StatefulWidget {
  const UserChatPage({Key? key}) : super(key: key);

  @override
  _UserChatPageState createState() => _UserChatPageState();
}

class _UserChatPageState extends State<UserChatPage> {
  late List<DirectoryModel>? _directoryModel = [];
  late List<DirectoryModel>? _directoryModelSearch = [];
  late List<MessageModel>? _messageModel = [];
  late List<UserModel>? _userlModel = [];


  final _debouncer = Debouncer();

  @override
  void initState() {
    super.initState();
    _getData();
    _directoryModelSearch = _directoryModel;
  }

  void _getData() async {
     final prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString('token');
     _messageModel = (await ApiMessageService().getMessages(token.toString()))!.cast<MessageModel>();
    _directoryModel = (await ApiDirectoryService().getDirectory())!.cast<DirectoryModel>();
    _messageModel = (await ApiMessageService().getMessages(token.toString()))!.cast<MessageModel>();
    Future.delayed(const Duration(seconds: 1)).then((value) => setState(() {}));
  }

  @override
  Widget build(BuildContext context) {
    return _directoryModel == null || _directoryModel!.isEmpty
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
                  ? UserChatBuilder(
                      directoryData: List<DirectoryModel>.generate(
                          _directoryModel!.length,
                          (index) => DirectoryModel(
                              id: _directoryModel![index].id,
                              fullname: _directoryModel![index].fullname,
                              email: _directoryModel![index].email,
                              photo: _directoryModel![index].photo,
                              department: _directoryModel![index].department,
                              position: _directoryModel![index].position,
                              onlineStatus: _directoryModel![index].onlineStatus)),
                              messageData: _messageModel!,
                              userModelData: _userlModel!)
                  : UserChatBuilder(
                      directoryData: List<DirectoryModel>.generate(
                          _directoryModelSearch!.length,
                          (index) => DirectoryModel(
                              id: _directoryModelSearch![index].id,
                              fullname: _directoryModelSearch![index].fullname,
                              email: _directoryModelSearch![index].email,
                              photo: _directoryModelSearch![index].photo,
                              department: _directoryModelSearch![index].department,
                              position:_directoryModelSearch![index].position,
                              onlineStatus: _directoryModel![index].onlineStatus)),
                              messageData: _messageModel!,
                              userModelData: _userlModel!)
                                  
            ],
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
      const Duration(milliseconds: Duration.millisecondsPerSecond),
      action,
    );
  }
}
