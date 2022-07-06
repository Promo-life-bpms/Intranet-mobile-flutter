import 'package:flutter/material.dart';
import 'package:intranet_movil/model/employee.dart';
import 'package:intranet_movil/services/api_employee.dart';
import 'package:intranet_movil/utils/constants.dart';
import 'package:intranet_movil/views/chat/chat_page.dart';
import 'package:intranet_movil/views/employee_month/widget/employee_month_builder.dart';
import 'package:intranet_movil/widget/navigation_drawer_widget.dart';
import 'package:intranet_movil/widget/skeletons/list_view_employe.dart';

class EmployeeMonthPage extends StatefulWidget {
  const EmployeeMonthPage({Key? key, required this.monthEmployeeData }) : super(key: key);
  final List<MonthEmployeeModel>? monthEmployeeData;

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<EmployeeMonthPage> {
  late List<MonthEmployeeModel>? _monthEmployeeModel = [];

  @override
  void initState() {
    super.initState();
     if(widget.monthEmployeeData!.isNotEmpty){
      _monthEmployeeModel = widget.monthEmployeeData;
    }else{
      _getData();
    }
    
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
        actions: [
          Padding(
              padding:const  EdgeInsets.only(right: 8.0),
              child: GestureDetector(
                onTap: () {
                  Navigator.of(context)
                   .push(MaterialPageRoute(builder: (context) => const ChatPage()));
                },
                child: const Image(
                  image: AssetImage('lib/assets/chat.png'),
                ),
              ),
            ),
        ],
        title: const Text(StringIntranetConstants.monthPage),
      ),
      body: _monthEmployeeModel == null || _monthEmployeeModel!.isEmpty
          ? const ListviewEmploye() //Skeleton 
          : EmployeeMonthBuilder(
              employeeMonthData: List<MonthEmployeeModel>.generate(
                  _monthEmployeeModel!.length,
                  (index) => MonthEmployeeModel(
                      id: _monthEmployeeModel![index].id,
                      name: _monthEmployeeModel![index].name,
                      position: _monthEmployeeModel![index].position,
                      star: _monthEmployeeModel![index].star,
                      photo: _monthEmployeeModel![index].photo))),
    );
  }
}
