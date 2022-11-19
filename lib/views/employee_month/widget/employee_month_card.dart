import 'package:flutter/material.dart';
import 'package:intranet_movil/model/employee.dart';
import 'package:intranet_movil/utils/constants.dart';
import 'package:lottie/lottie.dart';

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
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Padding(
          padding: const EdgeInsets.only(bottom: 20.0),
          child: Column(
            children: [
              const Padding(
                padding: EdgeInsets.only(bottom: 20.0),
              ),
              const Padding(
                padding:
                    EdgeInsets.only(left: 12, top: 0, right: 12, bottom: 0),
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
              Padding(
                padding: const EdgeInsets.only(left: 24, right: 24, bottom: 8),
                child: Container(
                  width: double.infinity,
                  height: 400.0,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    image: DecorationImage(
                      image: NetworkImage(ApiIntranetConstans.baseUrl +
                          widget.employeeMonthData[0].photo),
                      fit: BoxFit.cover,
                    ),
                  ),
                  child: Align(
                    alignment: const Alignment(1.8, -1.3),
                    child: SizedBox(
                      width: 150.0,
                      child: SizedBox(
                        width: 120,
                        height: 120,
                        child: Lottie.asset("lib/assets/star_badge.json"),
                      ),
                    ),
                  ),
                ),
              ),
              Text(
                widget.employeeMonthData[0].name,
                style: const TextStyle(
                  fontSize: 20.00,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(bottom: 8.0),
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
            ],
          ),
        ),
      ),
    );
  }
}
