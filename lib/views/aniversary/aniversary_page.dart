import 'package:flutter/material.dart';
import 'package:intranet_movil/model/aniversary.dart';
import 'package:intranet_movil/services/api_aniversary.dart';
import 'package:intranet_movil/utils/constants.dart';
import 'package:intranet_movil/widget/navigation_drawer_widget.dart';

class AniversaryPage extends StatefulWidget {
  const AniversaryPage({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
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
      drawer: const NavigationDrawerWidget(),
      appBar: AppBar(
        title: const Text("Cumpleaños"),
      ),
      body: _aniversaryModel == null || _aniversaryModel!.isEmpty
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : Column(
              children: [
                const Padding(
                  padding: EdgeInsets.only(top: 20, bottom: 30),
                  child: Text(
                    "Cumpleaños",
                    style: TextStyle(
                      fontSize: 16.00,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.left,
                  ),
                ),
                Expanded(
                  child: GridView.builder(
                      padding: const EdgeInsets.all(0),
                      itemCount: _aniversaryModel!.length,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 3, childAspectRatio: 0.8),
                      itemBuilder: (BuildContext context, int index) {
                        return Column(
                          children: [
                            SizedBox(
                              width: 80,
                              height: 80,
                              child: CircleAvatar(
                                backgroundImage: NetworkImage(
                                    ApiIntranetConstans.baseUrl +
                                        _aniversaryModel![index]
                                            .photo
                                            .toString()),
                              ),
                            ),
                            const Padding(
                                padding: EdgeInsets.symmetric(vertical: 8)),
                            Center(
                              child: Text(_aniversaryModel![index].lastname,
                                  style: const TextStyle(
                                    fontSize: 12.00,
                                    fontWeight: FontWeight.bold,
                                  ),
                                  textAlign: TextAlign.center),
                            ),
                            const Padding(
                                padding: EdgeInsets.symmetric(vertical: 4)),
                            Center(
                                child: Text(_aniversaryModel![index].date,
                                    style: const TextStyle(fontSize: 10.00),
                                    textAlign: TextAlign.center))
                          ],
                        );
                      }),
                ),
              ],
            ),
    );
  }
}
