import 'package:flutter/material.dart';
import 'package:intranet_movil/widget/navigation_drawer_widget.dart';

void main() => runApp(const AniversaryPage());

class AniversaryPage extends StatelessWidget {
  const AniversaryPage({Key? key}) : super(key: key);

  static const String _title = 'Aniversarios';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const NavigationDrawerWidget(),
      appBar: AppBar(
        title: const Text(_title),
      ),
      body: const AniversaryWidget(),
    );
  }
}

class AniversaryWidget extends StatelessWidget {
  const AniversaryWidget({Key? key}) : super(key: key);

  
  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        "Aqui va el codigo"
      ),
    );
  }
}
