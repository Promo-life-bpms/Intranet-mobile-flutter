import 'package:flutter/material.dart';
import 'package:intranet_movil/widget/navigation_drawer_widget.dart';

void main() => runApp(const CommunicatePage());

class CommunicatePage extends StatelessWidget {
  const CommunicatePage({Key? key}) : super(key: key);

  static const String _title = 'Comunicados';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const NavigationDrawerWidget(),
      appBar: AppBar(
        title: const Text(_title),
      ),
      body: const CommunicateWidget(),
    );
  }
}

class CommunicateWidget extends StatelessWidget {
  const CommunicateWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        "Aqui va el codigo"
      ),
    );
  }
}
