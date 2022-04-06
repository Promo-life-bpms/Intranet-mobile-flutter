import 'package:flutter/material.dart';
import 'package:intranet_movil/widget/navigation_drawer_widget.dart';

void main() => runApp(const EmployeeMonthPage());

class EmployeeMonthPage extends StatelessWidget {
  const EmployeeMonthPage({Key? key}) : super(key: key);

  static const String _title = 'Empleados del mes';

 @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const NavigationDrawerWidget(),
      appBar: AppBar(
        title: const Text(_title),
      ),
      body: const EmployeeMonthWidget(),
    );
  }
}

class EmployeeMonthWidget extends StatelessWidget {
  const EmployeeMonthWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        "Aqui va el codigo"
      ),
    );
  }
}
