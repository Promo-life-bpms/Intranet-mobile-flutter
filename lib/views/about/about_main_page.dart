import 'package:flutter/material.dart';
import 'package:intranet_movil/widget/navigation_drawer_widget.dart';

void main() => runApp(const AboutMainPage());

class AboutMainPage extends StatelessWidget {
  const AboutMainPage({Key? key}) : super(key: key);

  static const String _title = 'Acerca de';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const NavigationDrawerWidget(),
      appBar: AppBar(
        title: const Text(_title),
      ),
      body: const AboutMainWidget(),
    );
  }
}

class AboutMainWidget extends StatelessWidget {
  const AboutMainWidget({Key? key}) : super(key: key);

 @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        "Pantalla de acerca de"
      ),
    );
  }

}
