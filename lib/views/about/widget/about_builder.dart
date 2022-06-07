import 'package:flutter/material.dart';
import 'package:intranet_movil/model/about.dart';
import 'package:intranet_movil/utils/constants.dart';
import 'package:intranet_movil/views/about/widget/about_widget.dart';

class AboutBuilder extends StatefulWidget {
  const AboutBuilder({Key? key, })
      : super(key: key);

  

  @override
  State<AboutBuilder> createState() =>
      _AccessBuilderState();
}

class _AccessBuilderState extends State<AboutBuilder> {

  final List<AboutData> _aboutData = ListIntranetConstants().aboutPL;

  @override
 Widget build(BuildContext context) {
    return ListView.builder(
      primary: false,
      shrinkWrap: true,
      padding: const EdgeInsets.all(8),
      itemCount: _aboutData.length,
      itemBuilder: (context, index) {
        return AboutItem(aboutData: [AboutData(_aboutData[index].title, _aboutData[index].description, _aboutData[index].lottie)]);
      },
    );
  }
}
