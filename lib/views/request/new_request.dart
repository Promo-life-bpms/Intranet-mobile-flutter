import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:intranet_movil/model/post_request.dart';
import 'package:intranet_movil/model/user_model.dart';
import 'package:intranet_movil/services/api_user.dart';
import 'package:intranet_movil/utils/constants.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class RequestPage extends StatefulWidget {
  const RequestPage({Key? key}) : super(key: key);
  @override
  _MyHomePageState createState() {
    return _MyHomePageState();
  }
}

class _MyHomePageState extends State<RequestPage> {
  String date = "";
  int maxDays = 0;
  List<String> days = [];

  final reason = TextEditingController();
  late String token = "";


  final _formKey = GlobalKey<FormState>();

  var typeRequest = [
    'Salir durante la jornada',
    'Faltar a sus labores',
    'Solicitar vacaciones',
  ];

  String dropdownvalue = 'Salir durante la jornada';
  late String payment = "Descontar Tiempo/Dia";
  TimeOfDay selectedTime = TimeOfDay.now();
  DateTime selectedDate = DateTime.now();
  var df =  DateFormat("hh:mm");




  late List<UserModel>? _userlModel = [];

  @override
  void initState() {
    super.initState();
    _getData();
  }
    @override
  void dispose() {
    reason.dispose();
    super.dispose();
  }


  void _getData() async {
    final prefs = await SharedPreferences.getInstance();
    String? _token = prefs.getString('token');
    if (_token != null || _token!.isNotEmpty) {
      token = _token;
    }

    _userlModel =
        (await ApiUserService().getUsers(token.toString()))!.cast<UserModel>();
    maxDays = _userlModel![0].daysAvailables;
    Future.delayed(const Duration(seconds: 1)).then((value) => setState(() {}));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Crear solicitud"),
        ),
        body: _userlModel == null || _userlModel!.isEmpty
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : Form(
                key: _formKey,
                child: SingleChildScrollView(
                  physics: const ScrollPhysics(),
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Row(
                        children: [
                          const Text(
                            "Tipo de solicitud ",
                            style: TextStyle(
                                fontSize: 16.00, fontWeight: FontWeight.bold),
                          ),
                          const Padding(padding: EdgeInsets.only(left: 8)),
                          DropdownButton(
                            value: dropdownvalue,
                            icon: const Icon(Icons.keyboard_arrow_down),
                            underline: SizedBox(),
                            items: typeRequest.map((String items) {
                              return DropdownMenuItem(
                                value: items,
                                child: Text(items),
                              );
                            }).toList(),
                            onChanged: (String? newValue) {
                              setState(() {
                                dropdownvalue = newValue!;
                                if (dropdownvalue ==
                                        "Salir durante la jornada" ||
                                    dropdownvalue == "Faltar a sus labores") {
                                  payment = "Descontar Tiempo/Dia";
                                } else {
                                  payment = "A cuenta de vacaciones";
                                }
                              });
                            },
                          ),
                        ],
                      ),
                      const Padding(padding: EdgeInsets.only(top: 24)),
                      Row(
                        children: [
                          const Text(
                            "Forma de pago:  ",
                            style: TextStyle(
                                fontSize: 16.00, fontWeight: FontWeight.bold),
                          ),
                          const Padding(padding: EdgeInsets.only(left: 8)),
                          Text(
                            payment,
                            style: const TextStyle(fontSize: 16),
                          ),
                        ],
                      ),
                      const Padding(padding: EdgeInsets.only(top: 24)),
                      payment == "Descontar Tiempo/Dia"
                          ? Column(
                              children: [
                                const Padding(padding: EdgeInsets.only(top: 8)),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    const Text("Hora de salida:  ",
                                        style: TextStyle(
                                            fontSize: 16.00,
                                            fontWeight: FontWeight.bold)),
                                    Flexible(
                                      child: ElevatedButton(
                                        style: ElevatedButton.styleFrom(
                                          primary: ColorIntranetConstants
                                              .primaryColorNormal, // background
                                          onPrimary: Colors.white, // foreground
                                        ),
                                        onPressed: () {
                                          _selectTime(context);
                                        },
                                        child: Text(
                                            selectedTime.format(context),
                                            style: const TextStyle(
                                                fontSize: 16.00,
                                                fontWeight: FontWeight.bold)),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            )
                          : const Padding(padding: EdgeInsets.only(top: 8)),
                      const Padding(padding: EdgeInsets.only(top: 24)),
                      days.length >= maxDays
                          ? const Center(
                              child: Text(
                                "No puedes seleccionar mas dias",
                                style: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.bold),
                              ),
                            )
                          : SizedBox(
                              width: double.infinity,
                              height: 40,
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  primary: ColorIntranetConstants
                                      .primaryColorNormal, // background
                                  onPrimary: Colors.white, // foreground
                                ),
                                onPressed: () {
                                  _selectDate(context);
                                },
                                child: Text(
                                    "SELECCIONAR DIAS ($maxDays) DISPONIBLES "),
                              ),
                            ),
                      ListView.builder(
                          physics: const NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: days.length,
                          itemBuilder: (BuildContext context, int index) {
                            return Card(
                              child: ListTile(
                                  leading: const Icon(
                                    Icons.delete,
                                    color: ColorIntranetConstants
                                        .primaryColorNormal,
                                  ),
                                  onTap: () {
                                    _delete(days, days[index]);
                                  },
                                  title: Text(days[index])),
                            );
                          }),
                      const Padding(padding: EdgeInsets.only(top: 24)),
                      const Text(
                        "Motivo",
                        style: TextStyle(
                          fontSize: 16.00,
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.start,
                      ),
                      const Padding(padding: EdgeInsets.only(top: 16)),
                      TextFormField(
                        maxLines: 4,
                        decoration: const InputDecoration(
                            border: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.blue,
                              ),
                            ),
                            contentPadding: EdgeInsets.symmetric(
                                vertical: 8, horizontal: 16)),
                           validator: (value) => value!.isEmpty
                                          ? 'Este campo no puede estar vacio'
                                          : null,
                            controller: reason,
                      ),
                      const Padding(padding: EdgeInsets.only(top: 16)),
                      SizedBox(
                        width: double.infinity,
                        height: 60,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            primary: ColorIntranetConstants
                                .primaryColorDark, // background
                            onPrimary: Colors.white, // foreground
                          ),
                          onPressed: () {

                            postRequest( token, dropdownvalue, payment, selectedTime.format(context)  , days.toString(), reason.text ,(maxDays-days.length).toString());
                           ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                              content: Text(reason.text),
                            )); 
/*                             createRequest()
 */
                          },
                          child: const Text("CREAR SOLICITUD"),
                        ),
                      )
                    ],
                  ),
                )));
  }

  _selectDate(BuildContext context) async {
    final DateTime? selected = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: selectedDate,
      lastDate: DateTime(2025),
      selectableDayPredicate: (DateTime val) =>
            val.weekday == 6 || val.weekday == 7 ? false : true,
    );
    if (selected != null && selected != selectedDate) {
      setState(() {
        String formattedDate = DateFormat('yyyy-MM-dd').format(selected);
        days.add(formattedDate);
      });
    }
  }


  _delete(days, selected) async {
    setState(() {
      days.remove(selected);
    });
  }

  _selectTime(BuildContext context) async {
    final TimeOfDay? timeOfDay = await showTimePicker(
      context: context,
      initialTime: selectedTime,
      initialEntryMode: TimePickerEntryMode.dial,
    );
    if (timeOfDay != null && timeOfDay != selectedTime) {
      setState(() {
        selectedTime = timeOfDay;
      });
    }
  }

  Future postRequest(String token, String typeRequest,String payment, String start,String reason, String days,String daysAvailables) async {
    String url =
        ApiIntranetConstans.baseUrl + ApiIntranetConstans.postRequestEndpoint;
    final response = await http.post(Uri.parse(url), body: {
      'token': token,
      'typeRequest': typeRequest,
      'payment': payment,
      'start': start,
      'reason': reason,
      'days': days,
      'daysAvailables': daysAvailables,
    }, headers: {
      'Accept': 'application/json',
    });

    print(url);
    if (response.statusCode == 200) {
      print(response.statusCode);
      return true;
    }
    print(response.statusCode);
    if (response.statusCode == 422) {
      return false;
    }

    return false;
  }

}
