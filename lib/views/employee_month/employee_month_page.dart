import 'package:flutter/material.dart';
import 'package:intranet_movil/model/employee.dart';
import 'package:intranet_movil/services/api_employee.dart';
import 'package:intranet_movil/utils/constants.dart';
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
        title: const Text("Empleado del Mes"),
      ),
      body: _monthEmployeeModel == null || _monthEmployeeModel!.isEmpty
          ? ListviewEmploye()
          : ListView.builder(
              padding: const EdgeInsets.all(8),
              itemCount: _monthEmployeeModel!.length,
              itemBuilder: (context, index) {
                return Card(
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 20.0),
                    child: Column(
                      children: [
                        const Padding(
                          padding: EdgeInsets.only(bottom: 20.0),
                        ),
                        const Padding(
                          padding: EdgeInsets.only(
                              left: 12, top: 0, right: 12, bottom: 0),
                          child: SizedBox(
                            width: double.infinity,
                            child: Text(
                              "¡Gracias por tu compromiso y dedicación!",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: Color.fromRGBO(96, 125, 139, 1),
                                  fontSize: 25.0,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                        const Padding(
                          padding: EdgeInsets.only(bottom: 20.0),
                        ),
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
                        Text(
                          _monthEmployeeModel![index].position,
                          style: const TextStyle(
                            fontSize: 20.00,
                          ),
                        ),
                        const Padding(
                          padding: EdgeInsets.only(bottom: 20.0),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const <Widget>[
                            Icon(
                              Icons.star,
                              color: Color.fromARGB(255, 28, 47, 56),
                              size: 24,
                            ),
                          ],
                        ),
                        Text(_monthEmployeeModel![index].star),
                      ],
                    ),
                  ),
                );
              },
            ),
    );
  }
}
