import 'package:flutter/material.dart';
import 'package:intranet_movil/model/aniversary.dart';
import 'package:intranet_movil/services/api_aniversary.dart';
import 'package:intranet_movil/utils/constants.dart';
import 'package:intranet_movil/views/aniversary/widget/aniversary_builder.dart';
import 'package:intranet_movil/views/aniversary/widget/flags_widget.dart';
import 'package:intranet_movil/widget/navigation_drawer_widget.dart';
import 'package:intranet_movil/widget/skeletons/list_view_aniversary.dart';

class AniversaryPage extends StatefulWidget {
  const AniversaryPage({Key? key, required this.aniversaryData}) : super(key: key);
  final List<AniversaryModel> aniversaryData;

  @override
  _HomeState createState() => _HomeState();

  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const NavigationDrawerWidget(),
      appBar: AppBar(
        title: const Text(StringIntranetConstants.aniversaryBirthdayAniversaryPage),
      ),
    );
  }
}

class _HomeState extends State<AniversaryPage> {
  late List<AniversaryModel>? _aniversaryModel = [];

  @override
  void initState() {
    super.initState();
    if(widget.aniversaryData.isNotEmpty){
      _aniversaryModel = widget.aniversaryData;
    }else{
      _getData();
    }
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
                    const FlagsWidget(),
                    AniversaryBuilder(
                      aniversaryData: List<AniversaryModel>.generate(
                          _aniversaryModel!.length,
                          (index) => AniversaryModel(
                              id: _aniversaryModel![index].id,
                              name: _aniversaryModel![index].name,
                              lastname: _aniversaryModel![index].lastname,
                              photo: _aniversaryModel![index].photo,
                              date: _aniversaryModel![index].date)),
                    )
                  ],
                ),
              ));
  }
}
