import 'package:flutter/material.dart';
import 'package:intranet_movil/widget/navigation_drawer_widget.dart';

class RequestFormPage extends StatefulWidget {
  const RequestFormPage({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<RequestFormPage> {
  final _formKey = GlobalKey<FormState>();

  var typeRequest = [
    'Salir durante la jornada',
    'Faltar a sus labores',
    'Solicitar vacaciones',
  ];

  String dropdownvalue = 'Salir durante la jornada';
  late String payment = "Descontar Tiempo/Dia";

  TimeOfDay selectedTime = TimeOfDay.now();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const NavigationDrawerWidget(),
      appBar: AppBar(
        title: const Text("Crear solicitud"),
      ),
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Padding(
            padding: EdgeInsets.all(24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    const Text(
                      "Tipo de solicitud: ",
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
                const Padding(padding: EdgeInsets.only(top: 16)),
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
                const Padding(padding: EdgeInsets.only(top: 16)),
                payment == "Descontar Tiempo/Dia"
                    ? Column(
                        children: [
                          const Padding(padding: EdgeInsets.only(top: 16)),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: const [
                              Text("Hora de salida",
                                  style: TextStyle(fontSize: 16.00, fontWeight: FontWeight.bold)),
                              Text("Hora de reingreso",
                                  style: TextStyle(fontSize: 16.00, fontWeight: FontWeight.bold)),
                            ],
                          ),
                          const Padding(padding: EdgeInsets.only(top: 8)),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Flexible(
                                child: ElevatedButton(
                                  onPressed: () {
                                    _selectTime(context);
                                  },
                                  child: const Text("Selecciona hora",style: TextStyle(fontSize: 16.00, fontWeight: FontWeight.bold)),
                                ),
                              ),
                              Flexible(
                                child: ElevatedButton(
                                  onPressed: () {
                                    _selectTime(context);
                                  },
                                  child: const Text("Selecciona hora",style: TextStyle(fontSize: 16.00, fontWeight: FontWeight.bold)),
                                ),
                              ),
                            ],
                          ),
                          const Padding(padding: EdgeInsets.only(top: 16)),
                        ],
                      )
                    : const Padding(padding: EdgeInsets.only(top: 8)),
                
                const Padding(padding: EdgeInsets.only(top: 16)),
                
                const Text(
                  "Motivo",
                  style: TextStyle(fontSize: 16.00),
                ),
                const Padding(padding: EdgeInsets.only(top: 8)),
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
                )
              ],
            ),
          ),
        ),
      ),
    );
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
}
