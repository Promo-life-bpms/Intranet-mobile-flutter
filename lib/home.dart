import 'package:flutter/material.dart';
import 'package:intranet_movil/views/home/home_page.dart';
import 'package:intranet_movil/widget/navigation_drawer_widget.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) => const Scaffold(
        drawer:  NavigationDrawerWidget(),
      /*   appBar: AppBar(title: const Text("Home")), */
        body:  HomePage(),
      );
}

