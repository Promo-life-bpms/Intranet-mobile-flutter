import 'package:flutter/material.dart';
import 'package:intranet_movil/model/brithday.dart';
import 'package:intranet_movil/services/api_brithday.dart';
import 'package:intranet_movil/utils/constants.dart';
import 'package:intranet_movil/widget/grids/birthday_grid.dart';
import 'package:intranet_movil/widget/navigation_drawer_widget.dart';
import 'package:intranet_movil/widget/skeletons/list_view_aniversary.dart';
import 'package:lottie/lottie.dart';

class BrithdayPage extends StatefulWidget {
  const BrithdayPage({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();

  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const NavigationDrawerWidget(),
      appBar: AppBar(
        title:
            const Text(StringIntranetConstants.aniversaryBirthdayBirthdayPage),
      ),
    );
  }
}

class _HomeState extends State<BrithdayPage> {
  late List<BirthdayModel>? _brithdayModel = [];

  @override
  void initState() {
    super.initState();
    _getData();
  }

  void _getData() async {
    _brithdayModel =
        (await ApiBrithdayService().getBrithday())!.cast<BirthdayModel>();
    Future.delayed(const Duration(seconds: 1)).then((value) => setState(() {}));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Cumpleaños'),
        ),
        body: _brithdayModel == null || _brithdayModel!.isEmpty
            ? const ListviewAniversary()
            : SingleChildScrollView(
                physics: const ScrollPhysics(),
                scrollDirection: Axis.vertical,
                child: Column(
                  children: [
                    Column(
                      children: [
                        SizedBox(
                          width: double.infinity,
                          child: Lottie.asset("lib/assets/flags.json"),
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        GridView.builder(
                          primary: false,
                          shrinkWrap: true,
                          scrollDirection: Axis.vertical,
                          padding: const EdgeInsets.all(0),
                          itemCount: _brithdayModel!.length,
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 3,
                            childAspectRatio: 0.8,
                          ),
                          itemBuilder: (BuildContext context, int index) {
                            return BirthdayGrid(birthdayData: [
                              BirthdayModel(
                                  id: _brithdayModel![index].id,
                                  name: _brithdayModel![index].name,
                                  lastname: _brithdayModel![index].lastname,
                                  photo: _brithdayModel![index].photo,
                                  date: _brithdayModel![index].date)
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
