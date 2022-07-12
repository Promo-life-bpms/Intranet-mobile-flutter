import 'package:flutter/material.dart';
import 'package:intranet_movil/model/manual.dart';
import 'package:intranet_movil/services/api_manual.dart';
import 'package:intranet_movil/utils/constants.dart';
import 'package:intranet_movil/views/chat/chat_page.dart';
import 'package:intranet_movil/views/manual/widget/manual_card.dart';
import 'package:intranet_movil/widget/navigation_drawer_widget.dart';
import 'package:intranet_movil/widget/skeletons/list_view_cards.dart';

class ManualPage extends StatefulWidget {
  const ManualPage({Key? key, required this.manualData}) : super(key: key);

  final List<ManualModel> manualData;

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<ManualPage> {
  late List<ManualModel>? _manualModel = [];
  static List<ManualModel>? _manualList = [];

  @override
  void initState() {
    super.initState();
    print("dataaaaaaaaaaaaaaaaaaaaa");
    print(widget.manualData.length);

    if(widget.manualData.isNotEmpty ){
      _manualList = widget.manualData;
      _getData();
    }else{
      _getData();
    }
   
  }

  void _getData() async {
    _manualModel = (await ApiManualService().getManual())!.cast<ManualModel>();
    setState(() {
      _manualList = _manualModel!;
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
        title: const Text(StringIntranetConstants.manualPage),
      ),
      body: _manualList == null || _manualList!.isEmpty 
          ? const ListviewCardsExamplePage()
          : ListView.builder(
              padding: const EdgeInsets.all(8),
              itemCount: _manualList!.length,
              itemBuilder: (context, index) {
                return ManualCard(manualData: [
                  ManualModel(
                      id: _manualList![index].id,
                      name: _manualList![index].name,
                      file: _manualList![index].file,
                      img: _manualList![index].img)
                ]);
              },
            ),
    );
  }
}
