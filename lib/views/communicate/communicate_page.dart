import 'package:flutter/material.dart';
import 'package:intranet_movil/model/communique.dart';
import 'package:intranet_movil/services/api_communique.dart';
import 'package:intranet_movil/utils/constants.dart';
import 'package:intranet_movil/views/communicate/widget/communique_card.dart';
import 'package:intranet_movil/widget/navigation_drawer_widget.dart';
import 'package:intranet_movil/widget/skeletons/list_view_cards.dart';

class CommunicatePage extends StatefulWidget {
  const CommunicatePage({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<CommunicatePage> {
  late List<CommuniqueModel>? _communiqueModel = [];

  @override
  void initState() {
    super.initState();
    _getData();
  }

  void _getData() async {
    _communiqueModel =
        (await ApiCommuniqueService().getCommunique())!.cast<CommuniqueModel>();
    Future.delayed(const Duration(seconds: 1)).then((value) => setState(() {}));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const NavigationDrawerWidget(),
      appBar: AppBar(
        title: const Text(StringIntranetConstants.communiquePage),
      ),
      body: _communiqueModel == null || _communiqueModel!.isEmpty
          ? const ListviewCardsExamplePage()
          : ListView.builder(
              padding: const EdgeInsets.all(8),
              itemCount: _communiqueModel!.length,
              itemBuilder: (context, index) {
                return CommuniqueCard(commuiqueData: [
                  CommuniqueModel(
                      id: _communiqueModel![index].id,
                      title: _communiqueModel![index].title,
                      image: _communiqueModel![index].image,
                      description: _communiqueModel![index].description)
                ]);
              },
            ),
    );
  }
}
