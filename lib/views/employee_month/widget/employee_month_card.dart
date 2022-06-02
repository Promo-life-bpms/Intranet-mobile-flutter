import 'package:flutter/material.dart';
import 'package:intranet_movil/model/employee.dart';
import 'package:intranet_movil/utils/constants.dart';

class EmployeeMonthCard extends StatefulWidget {
  const EmployeeMonthCard({Key? key, required this.employeeMonthData})
      : super(key: key);

  final List<MonthEmployeeModel> employeeMonthData;

  @override
  State<EmployeeMonthCard> createState() => _EmployeeMonthCardState();
}

class _EmployeeMonthCardState extends State<EmployeeMonthCard> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0),
      child: Card(
        elevation: 4,
        child: Padding(
          padding: const EdgeInsets.only(bottom: 20.0),
          child: Column(
            children: [
              const Padding(
                padding: EdgeInsets.only(bottom: 20.0),
              ),
              const Padding(
                padding: EdgeInsets.only(left: 12, top: 0, right: 12, bottom: 0),
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
                      image: NetworkImage(ApiIntranetConstans.baseUrl +
                          widget.employeeMonthData[0].photo),
                    )),
              ),
              const Padding(
                padding: EdgeInsets.only(bottom: 20.0),
              ),
              Text(
                widget.employeeMonthData[0].name,
                style: const TextStyle(
                  fontSize: 20.00,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(bottom: 20.0),
              ),
              Text(
                widget.employeeMonthData[0].position,
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
              Text(widget.employeeMonthData[0].star),
            ],
          ),
        ),
      ),
    );
  }
}
