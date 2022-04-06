import 'package:flutter/material.dart';
import 'package:intranet_movil/widget/navigation_drawer_widget.dart';

void main() => runApp(const AccessPage());

class AccessPage extends StatelessWidget {
  const AccessPage({Key? key}) : super(key: key);

  static const String _title = 'Accesos';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const NavigationDrawerWidget(),
      appBar: AppBar(
        title: const Text(_title),
      ),
      body: const AccessWidget(),
    );
  }
}


class AccessWidget extends StatelessWidget {
  const AccessWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        "Pantalla de accesos"
      ),
    );
  }
}

