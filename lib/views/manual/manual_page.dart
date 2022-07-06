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

  @override
  void initState() {
    super.initState();
    if(widget.manualData.isNotEmpty){
      _manualModel = widget.manualData;
    }else{
      _getData();
    }
    
  }

  void _getData() async {
    _manualModel = (await ApiManualService().getManual())!.cast<ManualModel>();
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
      body: _manualModel == null || _manualModel!.isEmpty
          ? const ListviewCardsExamplePage()
          : ListView.builder(
              padding: const EdgeInsets.all(8),
              itemCount: _manualModel!.length,
              itemBuilder: (context, index) {
                return ManualCard(manualData: [
                  ManualModel(
                      id: _manualModel![index].id,
                      name: _manualModel![index].name,
                      file: _manualModel![index].file,
                      img: _manualModel![index].img)
                ]);
              },
            ),
    );
  }
}
