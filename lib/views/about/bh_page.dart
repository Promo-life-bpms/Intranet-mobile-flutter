import 'package:flutter/material.dart';
import 'package:intranet_movil/widget/navigation_drawer_widget.dart';

void main() => runApp(const BHPage());

class BHPage extends StatelessWidget {
  const BHPage({Key? key}) : super(key: key);

  static const String _title = 'Acerca de BH Trademarket';

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: _title,
      home: BHWidget(),
    );
  }
}

class BHWidget extends StatelessWidget {
  const BHWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const NavigationDrawerWidget(),
      appBar: AppBar(
        title: const Text('BH'),
      ), 
      body: const Center(
        child: Text(
          'Pagina de BH',
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}

