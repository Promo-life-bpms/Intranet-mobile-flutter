import 'package:flutter/material.dart';
import 'package:intranet_movil/model/employee.dart';
import 'package:intranet_movil/services/api_employee.dart';
import 'package:intranet_movil/utils/constants.dart';
import 'package:intranet_movil/widget/navigation_drawer_widget.dart';

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
        title: const Text('Comunicados'),
      ),
      body: _monthEmployeeModel == null || _monthEmployeeModel!.isEmpty
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : ListView.builder(
              padding: const EdgeInsets.all(8),
              itemCount: _monthEmployeeModel!.length,
              itemBuilder: (context, index) {
                return Card(
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 20.0),
                    child: Column(
                      children: [
                        SizedBox(
                          width: double.infinity,
                          height: 320.0,
                          child: FittedBox(
                              fit: BoxFit.contain,
                              child: Image(
                                image: NetworkImage(
                                    ApiIntranetConstans.baseUrl +
                                        _monthEmployeeModel![index].photo),
                              )),
                        ),
                        const Padding(
                          padding: EdgeInsets.only(bottom: 20.0),
                        ),
                        Text(
                          _monthEmployeeModel![index].name,
                          style: const TextStyle(
                            fontSize: 20.00,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const Padding(
                          padding: EdgeInsets.only(bottom: 20.0),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
    );
  }
}
