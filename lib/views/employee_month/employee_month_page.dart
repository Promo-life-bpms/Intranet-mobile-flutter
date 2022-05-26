import 'package:flutter/material.dart';
import 'package:intranet_movil/model/employee.dart';
import 'package:intranet_movil/services/api_employee.dart';
import 'package:intranet_movil/utils/constants.dart';
import 'package:intranet_movil/widget/cards/employee_month_card.dart';
import 'package:intranet_movil/widget/navigation_drawer_widget.dart';
import 'package:intranet_movil/widget/skeletons/list_view_employe.dart';

class EmployeeMonthPage extends StatefulWidget {
  const EmployeeMonthPage({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<EmployeeMonthPage> {
  late List<MonthEmployeeModel>? _monthEmployeeModel = [];

  @override
  void initState() {
    super.initState();
    _getData();
  }

  void _getData() async {
    _monthEmployeeModel = (await ApiMonthEmployeeService().getMonthEmployee())!
        .cast<MonthEmployeeModel>();
    Future.delayed(const Duration(seconds: 1)).then((value) => setState(() {}));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const NavigationDrawerWidget(),
      appBar: AppBar(
        title: const Text(StringIntranetConstants.monthPage),
      ),
      body: _monthEmployeeModel == null || _monthEmployeeModel!.isEmpty
          ? const ListviewEmploye()
          : ListView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: _monthEmployeeModel!.length,
              itemBuilder: (context, index) {
                return EmployeeMonthCard(employeeMonthData: [
                  MonthEmployeeModel(
                      id: _monthEmployeeModel![index].id,
                      name: _monthEmployeeModel![index].name,
                      position: _monthEmployeeModel![index].position,
                      star: _monthEmployeeModel![index].star,
                      photo: _monthEmployeeModel![index].photo)
                ]);
              },
            ),
    );
  }
}
