import 'package:flutter/material.dart';
import 'package:intranet_movil/widget/navigation_drawer_widget.dart';

void main() => runApp(const PromolifePage());

class PromolifePage extends StatelessWidget {
  const PromolifePage({Key? key}) : super(key: key);

  static const String _title = 'Acerca de Promolife';

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: _title,
      home: PromolifeWidget(),
    );
  }
}

class PromolifeWidget extends StatelessWidget {
  const PromolifeWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const NavigationDrawerWidget(),
      appBar: AppBar(
        title: const Text('Promolife'),
      ), 
      body: const Center(
        child: Text(
          'Pagina de promolife',
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}