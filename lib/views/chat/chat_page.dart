import 'package:flutter/material.dart';
import 'package:intranet_movil/model/directory.dart';
import 'package:intranet_movil/model/message.dart';
import 'package:intranet_movil/services/api_directory.dart';
import 'package:intranet_movil/services/api_message.dart';
import 'package:intranet_movil/utils/constants.dart';
import 'package:intranet_movil/views/chat/modules/messages_chat.dart';
import 'package:intranet_movil/views/chat/modules/users_chat.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ChatPage extends StatefulWidget {
  const ChatPage({Key? key}) : super(key: key);

  @override
  _ChatPageState createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {

  late List<DirectoryModel>? _directoryModel = [];
  late List<MessageModel>? _messageModel = [];
  late String token = "";

  @override
  void initState() {
    super.initState();
    _getData();
  }

  void _getData() async {
     final prefs = await SharedPreferences.getInstance();
    String? _token = prefs.getString('token');
    if (_token != null || _token!.isNotEmpty) {
      token = _token;
    }

    _directoryModel = (await ApiDirectoryService().getDirectory())!.cast<DirectoryModel>();
    _messageModel = (await ApiMessageService().getMessages(_token.toString()))!.cast<MessageModel>(); 
    _messageModel!.sort((a, b)=> a.createdAt.compareTo(b.createdAt));
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
        appBarTheme: const AppBarTheme(backgroundColor: ColorIntranetConstants.primaryColorLight) 
        ),
        home: DefaultTabController(
        length: 2,
        child: Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            leading: IconButton(
            icon: const Icon(Icons.arrow_back, color: Colors.white),
            onPressed: () => Navigator.pop(context)),
            bottom:  TabBar(
              unselectedLabelColor: Colors.white.withOpacity(0.3),
              indicatorColor: Colors.white,
              tabs: const [
                Tab(child: Text(StringIntranetConstants.chat),),
                Tab(child: Text(StringIntranetConstants.chatUsers),),
              ],
            ),
            title: const Text(StringIntranetConstants.chatPage),
          ),
          body:  TabBarView(
            children: [
              const MessagesChatPage(),
              UserChatPage(directoryModel: _directoryModel!)
            ],
          ),
        ),
      ),
    );
  }
}


