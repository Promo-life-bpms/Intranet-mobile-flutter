import 'package:flutter/material.dart';
import 'package:intranet_movil/widget/navigation_drawer_widget.dart';

void main() => runApp(const HomePage());

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  static const String _title = 'Inicio';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const NavigationDrawerWidget(),
      appBar: AppBar(
        title: const Text(_title),
      ),
      body: const HomePageWidget(),
    );
  }
}

class HomePageWidget extends StatelessWidget {
  const HomePageWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        "Aqui va el codigo"
      ),
    );
  }
}

