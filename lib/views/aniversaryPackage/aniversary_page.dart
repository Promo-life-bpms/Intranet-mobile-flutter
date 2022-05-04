import 'package:flutter/material.dart';
import 'package:intranet_movil/model/aniversary.dart';
import 'package:intranet_movil/services/api_aniversary.dart';
import 'package:intranet_movil/utils/constants.dart';
import 'package:intranet_movil/widget/navigation_drawer_widget.dart';
import 'package:lottie/lottie.dart';

class AniversaryPage extends StatefulWidget {
  const AniversaryPage({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
  static const String _title = 'Aniversarios';

  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const NavigationDrawerWidget(),
      appBar: AppBar(
        title: const Text(_title),
      ),
    );
  }
}

class _HomeState extends State<AniversaryPage> {
  late List<AniversaryModel>? _aniversaryModel = [];

  @override
  void initState() {
    super.initState();
    _getData();
  }

  void _getData() async {
    _aniversaryModel =
        (await ApiAniversaryService().getAniversary())!.cast<AniversaryModel>();
    Future.delayed(const Duration(seconds: 1)).then((value) => setState(() {}));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Aniversarios'),
      ),
      body: _aniversaryModel == null || _aniversaryModel!.isEmpty
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : Container(
              child: Column(
                children: [
                  Column(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(8.0),
                        width: 750,
                        child: Lottie.asset("lib/assets/flags.json"),
                      ),
                    ],
                  ),
                  Expanded(
                    child: GridView.builder(
                      padding: const EdgeInsets.all(0),
                      itemCount: _aniversaryModel!.length,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3,
                        childAspectRatio: 0.8,
                      ),
                      itemBuilder: (BuildContext context, int index) {
                        return Column(
                          children: [
                            const SizedBox(
                              width: 80,
                              height: 80,
                              child: CircleAvatar(
                                  /* backgroundImage: NetworkImage(
                                  ApiIntranetConstans.baseUrl +
                                      _brithdayModel![index].photo.toString()),*/
                                  ),
                            ),
                            const Padding(
                                padding: EdgeInsets.only(
                                    left: 1, top: 10, right: 5, bottom: 4)),
                            Container(
                              width: 100,
                              height: 30,
                              child: Text(
                                  _aniversaryModel![index].name +
                                      " " +
                                      _aniversaryModel![index].lastname,
                                  style: const TextStyle(
                                    fontSize: 12.00,
                                    fontWeight: FontWeight.bold,
                                  ),
                                  textAlign: TextAlign.center),
                            ),
                            const Padding(
                                padding: EdgeInsets.symmetric(vertical: 2)),
                            Center(
                                child: Text(_aniversaryModel![index].date,
                                    style: const TextStyle(fontSize: 10.00),
                                    textAlign: TextAlign.center)),
                            const Padding(
                                padding: EdgeInsets.symmetric(vertical: 5)),
                          ],
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
    );
  }
}
