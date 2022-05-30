// This is a Custom TextField Widget
import 'package:flutter/material.dart';
import 'package:intranet_movil/model/employee.dart';
import 'package:intranet_movil/views/employee_month/widget/employee_month_card.dart';

class EmployeeMonthBuilder extends StatefulWidget {
  const EmployeeMonthBuilder({Key? key, required this.employeeMonthData})
      : super(key: key);
  final List<MonthEmployeeModel> employeeMonthData;

  @override
  State<EmployeeMonthBuilder> createState() =>
      _EmployeeMonthBuilderState();
}

class _EmployeeMonthBuilderState extends State<EmployeeMonthBuilder> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: widget.employeeMonthData.length,
      itemBuilder: (context, index) {
        return EmployeeMonthCard(employeeMonthData: [
          MonthEmployeeModel(
              id: widget.employeeMonthData[index].id,
              name: widget.employeeMonthData[index].name,
              position: widget.employeeMonthData[index].position,
              star: widget.employeeMonthData[index].star,
              photo: widget.employeeMonthData[index].photo)
        ]);
      },
    );
  }
}
