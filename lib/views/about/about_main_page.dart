import 'package:flutter/material.dart';
import 'package:intranet_movil/widget/navigation_drawer_widget.dart';

void main() => runApp(const AboutMainPage());

class AboutMainPage extends StatelessWidget {
  const AboutMainPage({Key? key}) : super(key: key);

  static const String _title = 'Acerca de';

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: _title,
      home: AboutMainWidget(),
    );
  }
}

class AboutMainWidget extends StatelessWidget {
  const AboutMainWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const NavigationDrawerWidget(),

      appBar: AppBar(
        title: const Text('Acerca de'),
      ),
      body: const Center(
        child: Text(
          'Pagina de acerca de',
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}
