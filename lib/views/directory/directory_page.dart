import 'package:flutter/material.dart';
import 'package:intranet_movil/widget/navigation_drawer_widget.dart';

void main() => runApp(const DirectoryPage());

class DirectoryPage extends StatelessWidget {
  const DirectoryPage({Key? key}) : super(key: key);

  static const String _title = 'Directorio';

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: _title,
      home: DirectoryWidget(),
    );
  }
}

class DirectoryWidget extends StatelessWidget {
  const DirectoryWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const NavigationDrawerWidget(),

      appBar: AppBar(
        title: const Text('Title'),
      ),
      body: const Center(
        child: Text(
          'Pagina de directorio',
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}
