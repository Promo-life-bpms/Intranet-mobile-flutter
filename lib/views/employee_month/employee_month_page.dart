import 'package:flutter/material.dart';
import 'package:intranet_movil/widget/navigation_drawer_widget.dart';

void main() => runApp(const EmployeeMonthPage());

class EmployeeMonthPage extends StatelessWidget {
  const EmployeeMonthPage({Key? key}) : super(key: key);

  static const String _title = 'Empleados del mes';

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: _title,
      home: EmployeeMonthWidget(),
    );
  }
}

class EmployeeMonthWidget extends StatelessWidget {
  const EmployeeMonthWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const NavigationDrawerWidget(),

      appBar: AppBar(
        title: const Text('Empleados del mes'),
      ),
      body: const Center(
        child: Text(
          'Pagina de los empleados del mes',
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}
