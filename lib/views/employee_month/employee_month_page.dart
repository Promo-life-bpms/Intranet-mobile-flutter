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
  static List<MonthEmployeeModel>? _monthEmployeeList = [];

  @override
  void initState() {
    super.initState();
     if(widget.monthEmployeeData!.isNotEmpty){
      _monthEmployeeList = widget.monthEmployeeData;
    }else{
      _getData();
    }
    
  }

  void _getData() async {
    _monthEmployeeModel = (await ApiMonthEmployeeService().getMonthEmployee())!.cast<MonthEmployeeModel>();
    setState(() {
      _monthEmployeeList = _monthEmployeeModel;
    });
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
      body: _monthEmployeeList == null || _monthEmployeeList!.isEmpty
          ? const ListviewEmploye() //Skeleton 
          : EmployeeMonthBuilder(
              employeeMonthData: List<MonthEmployeeModel>.generate(
                  _monthEmployeeList!.length,
                  (index) => MonthEmployeeModel(
                      id: _monthEmployeeList![index].id,
                      name: _monthEmployeeList![index].name,
                      position: _monthEmployeeList![index].position,
                      star: _monthEmployeeList![index].star,
                      photo: _monthEmployeeList![index].photo))),
    );
  }
}
