import 'package:flutter/material.dart';
import 'package:intranet_movil/widget/navigation_drawer_widget.dart';

void main() => runApp(const AniversaryPage());

class AniversaryPage extends StatelessWidget {
  const AniversaryPage({Key? key}) : super(key: key);

  static const String _title = 'Aniversarios';

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: _title,
      home: AniversaryWidget(),
    );
  }
}

class AniversaryWidget extends StatelessWidget {
  const AniversaryWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const NavigationDrawerWidget(),

      appBar: AppBar(
        title: const Text('Aniversarios'),
      ),
      body: const Center(
        child: Text(
          'Pagina de aniversarios',
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}
