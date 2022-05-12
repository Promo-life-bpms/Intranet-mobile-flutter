import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class RequestPage extends StatefulWidget {
  const RequestPage({Key? key}) : super(key: key);
  @override
  _MyHomePageState createState() {
    return _MyHomePageState();
  }
}

class _MyHomePageState extends State<RequestPage> {
  String date = "";
  int maxDays = 5;
  List<String> days = [];

  final _formKey = GlobalKey<FormState>();

  var typeRequest = [
    'Salir durante la jornada',
    'Faltar a sus labores',
    'Solicitar vacaciones',
  ];

  String dropdownvalue = 'Salir durante la jornada';
  late String payment = "Descontar Tiempo/Dia";
  TimeOfDay selectedTime = TimeOfDay.now();
  TimeOfDay selectedTimeReturn = TimeOfDay.now();

  DateTime selectedDate = DateTime.now();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Crear solicitud"),
        ),
        body: Form(
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
                        items: typeRequest.map((String items) {
                          return DropdownMenuItem(
                            value: items,
                            child: Text(items),
                          );
                        }).toList(),
                        onChanged: (String? newValue) {
                          setState(() {
                            dropdownvalue = newValue!;
                            if (dropdownvalue == "Salir durante la jornada" ||
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
                                    onPressed: () {
                                      _selectTime(context);
                                    },
                                    child: Text(selectedTime.format(context),
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
                            onPressed: () {
                              _selectDate(context);
                            },
                            child: const Text("SELECCIONAR DIAS"),
                          ),
                        ),
                  ListView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: days.length,
                      itemBuilder: (BuildContext context, int index) {
                        return Card(
                          child: ListTile(
                              leading: Icon(Icons.delete),
                              onTap: () {
                                _delete(days, days[index]);
                              },
                              title: Text(days[index])),
                        );
                      }),
                  const Padding(padding: EdgeInsets.only(top: 24)),
                  const Text("Motivo",
                      style: TextStyle(
                        fontSize: 16.00, fontWeight: FontWeight.bold,),
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
                        contentPadding:
                            EdgeInsets.symmetric(vertical: 8, horizontal: 16)),
                  ),
                ],
              ),
            )));
  }

  _selectDate(BuildContext context) async {
    final DateTime? selected = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(2010),
      lastDate: DateTime(2025),
    );
    if (selected != null && selected != selectedDate) {
      setState(() {
        String formattedDate = DateFormat('yyyy-MM-dd').format(selected);
        days.add(formattedDate);
        selectedDate = selected;
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

  _selectTimeReturn(BuildContext context) async {
    final TimeOfDay? timeOfDay = await showTimePicker(
      context: context,
      initialTime: selectedTimeReturn,
      initialEntryMode: TimePickerEntryMode.dial,
    );
    if (timeOfDay != null && timeOfDay != selectedTime) {
      setState(() {
        selectedTimeReturn = timeOfDay;
      });
    }
  }
}
