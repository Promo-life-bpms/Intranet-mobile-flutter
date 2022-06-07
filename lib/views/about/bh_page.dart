import 'package:flutter/material.dart';
import 'package:intranet_movil/utils/constants.dart';
import 'package:intranet_movil/views/about/widget/about_bh_header.dart';
import 'package:intranet_movil/views/about/widget/about_bh_history.dart';
import 'package:intranet_movil/views/about/widget/about_builder.dart';

class BHPage extends StatelessWidget {
  const BHPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(StringIntranetConstants.aboutBHPage),
      ),
      body: const BHWidget(),
    );
  }
}

class BHWidget extends StatelessWidget {
  const BHWidget({Key? key}) : super(key: key);

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
            //Header BH
            AboutBHHeaderWidget(),
            //Historia BH
            AboutBHHistoryWidget(),
            //Valores
            AboutBuilder(),
          ],
        ),
      ),
    );
  }
}
