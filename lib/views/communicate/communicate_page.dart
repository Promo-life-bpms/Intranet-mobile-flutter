import 'package:flutter/material.dart';
import 'package:intranet_movil/model/communique.dart';
import 'package:intranet_movil/services/api_communique.dart';
import 'package:intranet_movil/utils/constants.dart';
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
        title: const Text('Comunicados'),
      ),
      body: _communiqueModel == null || _communiqueModel!.isEmpty
          ? ListviewCardsExamplePage()
          : ListView.builder(
              padding: const EdgeInsets.all(8),
              itemCount: _communiqueModel!.length,
              itemBuilder: (context, index) {
                return Card(
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 20.0),
                    child: Column(
                      children: [
                        SizedBox(
                          width: double.infinity,
                          height: 320.0,
                          child: FittedBox(
                              fit: BoxFit.contain,
                              child: Image(
                                image: NetworkImage(
                                    ApiIntranetConstans.baseUrl +
                                        _communiqueModel![index].image),
                              )),
                        ),
                        const Padding(
                          padding: EdgeInsets.only(bottom: 20.0),
                        ),
                        Text(
                          _communiqueModel![index].title,
                          style: const TextStyle(
                            fontSize: 20.00,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const Padding(
                          padding: EdgeInsets.only(bottom: 20.0),
                        ),
                        SizedBox(
                          width: 200,
                          height: 50,
                          child: ElevatedButton(
                            onPressed: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => Image(
                                      image: NetworkImage(ApiIntranetConstans
                                              .baseUrl +
                                          _communiqueModel![index].image))));
                            },
                            child: const Text('VER MAS'),
                          ),
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
