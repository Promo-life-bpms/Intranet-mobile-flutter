import 'package:flutter/material.dart';
import 'package:intranet_movil/model/birthday.dart';
import 'package:intranet_movil/services/api_birthday.dart';
import 'package:intranet_movil/utils/constants.dart';
import 'package:intranet_movil/views/aniversary/widget/birthday_builder.dart';
import 'package:intranet_movil/views/aniversary/widget/flags_widget.dart';
import 'package:intranet_movil/widget/navigation_drawer_widget.dart';
import 'package:intranet_movil/widget/skeletons/list_view_aniversary.dart';

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
          title: const Text(StringIntranetConstants.aniversaryBirthdayBirthdayPage),
        ),
        body: _brithdayModel == null || _brithdayModel!.isEmpty
            ? const ListviewAniversary()
            : SingleChildScrollView(
                physics: const ScrollPhysics(),
                scrollDirection: Axis.vertical,
                child: Column(
                  children: [
                    const FlagsWidget(),
                    BirthdayBuilder(
                      brithdayData: List<BirthdayModel>.generate(
                          _brithdayModel!.length,
                          (index) => BirthdayModel(
                              id: _brithdayModel![index].id,
                              name: _brithdayModel![index].name,
                              lastname: _brithdayModel![index].lastname,
                              photo: _brithdayModel![index].photo,
                              date: _brithdayModel![index].date)),
                    )
                  ],
                ),
              ));
  }
}
