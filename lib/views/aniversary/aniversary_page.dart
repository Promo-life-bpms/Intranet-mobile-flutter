import 'package:flutter/material.dart';
import 'package:intranet_movil/model/aniversary.dart';
import 'package:intranet_movil/services/api_aniversary.dart';
import 'package:intranet_movil/utils/constants.dart';
import 'package:intranet_movil/widget/grids/aniversary_grid.dart';
import 'package:intranet_movil/widget/navigation_drawer_widget.dart';
import 'package:intranet_movil/widget/skeletons/list_view_aniversary.dart';

import 'package:lottie/lottie.dart';

class AniversaryPage extends StatefulWidget {
  const AniversaryPage({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();

  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const NavigationDrawerWidget(),
      appBar: AppBar(
        title: const Text(StringIntranetConstants.aniversaryBirthdayPage),
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
          title: const Text(
              StringIntranetConstants.aniversaryBirthdayAniversaryPage),
        ),
        body: _aniversaryModel == null || _aniversaryModel!.isEmpty
            ? const ListviewAniversary()
            : SingleChildScrollView(
                physics: const ScrollPhysics(),
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
                    Column(
                      children: [
                        GridView.builder(
                          shrinkWrap: true,
                          primary: false,
                          scrollDirection: Axis.vertical,
                          padding: const EdgeInsets.all(0),
                          itemCount: _aniversaryModel!.length,
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 3,
                            childAspectRatio: 0.8,
                          ),
                          itemBuilder: (BuildContext context, int index) {
                            return AniversaryGrid(aniversaryData: [
                              AniversaryModel(
                                  id: _aniversaryModel![index].id,
                                  name: _aniversaryModel![index].name,
                                  lastname: _aniversaryModel![index].lastname,
                                  photo: _aniversaryModel![index].photo,
                                  date: _aniversaryModel![index].date)
                            ]);
                          },
                        ),
                      ],
                    ),
                  ],
                ),
              ));
  }
}
