import 'package:flutter/material.dart';
import 'package:intranet_movil/model/brithday.dart';
import 'package:intranet_movil/services/api_brithday.dart';
import 'package:intranet_movil/utils/constants.dart';
import 'package:intranet_movil/widget/navigation_drawer_widget.dart';
import 'package:lottie/lottie.dart';

class BrithdayPage extends StatefulWidget {
  const BrithdayPage({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
  static const String _title = 'Cumpleaños';

  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const NavigationDrawerWidget(),
      appBar: AppBar(
        title: const Text(_title),
      ),
    );
  }
}

class _HomeState extends State<BrithdayPage> {
  late List<BrithdayModel>? _brithdayModel = [];

  @override
  void initState() {
    super.initState();
    _getData();
  }

  void _getData() async {
    _brithdayModel =
        (await ApiBrithdayService().getBrithday())!.cast<BrithdayModel>();
    Future.delayed(const Duration(seconds: 1)).then((value) => setState(() {}));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cumpleaños'),
      ),
      body: _brithdayModel == null || _brithdayModel!.isEmpty
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : Column(
            children: [
              Column(
                children: [
                  Container(
                    padding: const EdgeInsets.all(8.0),
                    width: 700,
                    child: Lottie.asset("lib/assets/flags.json"),
                  ),
                ],
              ),
              Expanded(
                child: GridView.builder(
                  padding: const EdgeInsets.all(0),
                  itemCount: _brithdayModel!.length,
                  gridDelegate:
                      const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    childAspectRatio: 0.8,
                  ),
                  itemBuilder: (BuildContext context, int index) {
                    return Column(
                      children: [
                        SizedBox(
                          width: 80,
                          height: 80,
                          child: CircleAvatar(
                               backgroundImage: NetworkImage(
                              ApiIntranetConstans.baseUrl +
                                  _brithdayModel![index].photo.toString()),
                              ),
                        ),
                        const Padding(
                            padding: EdgeInsets.only(
                                left: 1, top: 5, right: 5, bottom: 4)),
                        SizedBox(
                          width: 100,
                          height: 30,
                          child: Text(
                              _brithdayModel![index].name +
                                  " " +
                                  _brithdayModel![index].lastname,
                              style: const TextStyle(
                                fontSize: 12.00,
                                fontWeight: FontWeight.bold,
                              ),
                              textAlign: TextAlign.center),
                        ),
                        const Padding(
                            padding: EdgeInsets.symmetric(vertical: 4)),
                        Center(
                            child: Text(_brithdayModel![index].date,
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
    );
  }
}
