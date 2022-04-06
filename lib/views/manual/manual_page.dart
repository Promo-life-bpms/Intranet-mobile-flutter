import 'package:flutter/material.dart';
import 'package:intranet_movil/widget/navigation_drawer_widget.dart';

void main() => runApp(const ManualPage());

class ManualPage extends StatelessWidget {
  const ManualPage({Key? key}) : super(key: key);

  static const String _title = 'Manuales';

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: _title,
      home: ManualWidget(),
    );
  }
}

class ManualWidget extends StatelessWidget {
  const ManualWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const NavigationDrawerWidget(),

      appBar: AppBar(
        title: const Text('Manuales'),
      ),
      body: const Center(
        child: Text(
          'Pagina de manuales',
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}
