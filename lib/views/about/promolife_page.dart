import 'package:flutter/material.dart';
import 'package:intranet_movil/widget/navigation_drawer_widget.dart';

void main() => runApp(const PromolifePage());

class PromolifePage extends StatelessWidget {
  const PromolifePage({Key? key}) : super(key: key);

  static const String _title = 'Acerca de Promolife';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const NavigationDrawerWidget(),
      appBar: AppBar(
        title: const Text(_title),
      ),
      body: const PromolifeWidget(),
    );
  }
}

class PromolifeWidget extends StatelessWidget {
  const PromolifeWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        "Aqui va el codigo"
      ),
    );
  }
}
