import 'package:flutter/material.dart';
import 'package:intranet_movil/utils/constants.dart';
import 'package:intranet_movil/views/about/widget/about_builder.dart';
import 'package:intranet_movil/views/about/widget/about_pl_header.dart';
import 'package:intranet_movil/views/about/widget/about_pl_history.dart';

void main() => runApp(const PromolifePage());

class PromolifePage extends StatelessWidget {
  const PromolifePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(StringIntranetConstants.aboutPLPage),
      ),
      body: const PromolifeWidget(),
    );
  }
}

class PromolifeWidget extends StatelessWidget {
  const PromolifeWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Card(
        margin: const EdgeInsets.symmetric(
            horizontal: 0,
        ),
        child: Column(
          children: const[
            //Header PL
            AboutPLHeaderWidget(),
            //Historia PL
            AboutPLHistoryWidget(),
            //Valores
            AboutBuilder(),
          ],
        ),
      ),
    );
  }
}

