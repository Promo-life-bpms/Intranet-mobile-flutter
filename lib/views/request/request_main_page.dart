import 'package:flutter/material.dart';
import 'package:intranet_movil/widget/navigation_drawer_widget.dart';

void main() => runApp(const RequestMainPage());

class RequestMainPage extends StatelessWidget {
  const RequestMainPage({Key? key}) : super(key: key);

  static const String _title = 'Solicitudes';

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: _title,
      home: RequestMainWidget(),
    );
  }
}

class RequestMainWidget extends StatelessWidget {
  const RequestMainWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const NavigationDrawerWidget(),

      appBar: AppBar(
        title: const Text('Solicitudes'),
      ),
      body: const Center(
        child: Text(
          'Pagina de solicitudes',
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}
