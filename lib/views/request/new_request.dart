import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:intranet_movil/model/user_model.dart';
import 'package:intranet_movil/services/api_user.dart';
import 'package:intranet_movil/services/post_request.dart';
import 'package:intranet_movil/utils/constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

class RequestPage extends StatefulWidget {
  const RequestPage({Key? key}) : super(key: key);
  @override
  _MyHomePageState createState() {
    return _MyHomePageState();
  }
}

//El usuario puede crear una solicitud de 3 diferentes tipos, la primera denominada "Salir durante la jornada" muestra un widget extra para colocar la fecha de salida. 
//La segunda "Faltar a sus labores"  al igual que  "Solicitar vacaciones", remueve dicho widget. 
//La tercer tipo de solicitud cambia el texto del botón para seleccionar dias, mostrando al usuario la cantidad de dias disponibles que tiene para solicitar vacaciones, las otras 2  (Salir durante la jornada,Faltar a sus labores) no lo muestra.
//Cuando el usuario alcanza el maximo de dias disponibles de vacaciones en el tipo de solicitud "Solicitar vacaciones", no se le permite agregar mas dias.
//El usuario puede agregar y eliminar los dias del calendario.

class _MyHomePageState extends State<RequestPage> {

  String date = "";
  int maxDays = 0;
  int daysToShow = 0;
  //Lista  de dias  para mostrar localmente con formato yyyy-MM-dd
  List<String> days = [];
  //Lista de dias para enviar con formato ddMMyyyy
  List<String> daysToSend = [];
  String dropdownvalue = 'Salir durante la jornada';
  late String payment = "Descontar Tiempo/Dia";
  TimeOfDay selectedTime = TimeOfDay.now();
  DateTime selectedDate = DateTime.now();
  
  final reason = TextEditingController();
  late String token = "";
  final _formKey = GlobalKey<FormState>();

  var typeRequest = [
    'Salir durante la jornada',
    'Faltar a sus labores',
    'Solicitar vacaciones',
  ];

  late List<UserModel>? _userlModel = [];

  @override
  void initState() {
    super.initState();
    _getData();
  }

  void _getData() async {
    final prefs = await SharedPreferences.getInstance();
    String? _token = prefs.getString('token');
    //Asigna el token a una variable para posteriormente enviarlo en la solicitud
    if (_token != null || _token!.isNotEmpty) {
      token = _token;
    }
    _userlModel = (await ApiUserService().getUsers(token.toString()))!.cast<UserModel>();
    //Obtiene el total de dias disponibles del endpoint y lo asigna  a la variable maxDays, mismo que sera utilizado en la variable daysToShow
    maxDays = _userlModel![0].daysAvailables;
    daysToShow = maxDays;
    Future.delayed(const Duration(seconds: 1)).then((value) => setState(() {}));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(StringIntranetConstants.requestCreatePage),
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
                            underline: const SizedBox(),
                            items: typeRequest.map((String items) {
                              return DropdownMenuItem(
                                value: items,
                                child: Text(items),
                              );
                            }).toList(),
                            onChanged: (String? newValue) {
                              setState(() {
                                //De acuerdo al valor del dropdown, seran las opciones que se muestren al usuario
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
                      dropdownvalue == "Salir durante la jornada"
                          ? Column(
                              children: [
                                const Padding(
                                    padding: EdgeInsets.only(top: 24)),
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
                      days.length >= maxDays && dropdownvalue == 'Solicitar vacaciones'
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
                                child: dropdownvalue != 'Solicitar vacaciones'?
                                const Text("SELECCIONAR DÍA ")
                                  : Text("SELECCIONAR DIAS ($daysToShow) DISPONIBLES "),
                              ),
                            ),
                      ListView.builder(
                          physics: const NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: days.length,
                          itemBuilder: (BuildContext context, int index) {
                            return Card(
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Padding(
                                    padding:const EdgeInsets.only(left: 16),
                                    child: Text(days[index]),
                                  ),
                                  IconButton(
                                      onPressed: () {
                                        _delete(days, days[index],
                                            daysToSend[index]);
                                      },
                                      icon: const Icon(
                                        Icons.delete,
                                        color: ColorIntranetConstants
                                            .primaryColorNormal,
                                      )),
                                ],
                              ),
                            );
                          }),

                          //Dias de expiracion
                          dropdownvalue == 'Solicitar vacaciones' 
                           ?
                          ListView.builder(
                          padding: const  EdgeInsets.only(top: 8),
                          physics: const NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: _userlModel![0].expiration.length,
                          itemBuilder: (BuildContext context, int index) {
                            return Padding(
                              padding: const EdgeInsets.all(4.0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.start,
                                children: [
                                  const Text( "Tienes "),
                                  Text( _userlModel![0].expiration[index].daysAvailables, style:const  TextStyle(fontWeight: FontWeight.bold),),
                                  const Text( " dias disponibles hasta el "),
                                  Text(_userlModel![0].expiration[index].cutoffDate, style:const  TextStyle(fontWeight: FontWeight.bold)),
                                ],
                              ),
                            );
                          })

                           :
                           const Padding(padding: EdgeInsets.zero),
                         

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
                        maxLength: 250,
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
                            if (_formKey.currentState!.validate()) {
                              if (daysToSend.isNotEmpty) {
                                postRequest(
                                    token,
                                    dropdownvalue,
                                    payment,
                                    selectedTime.format(context),
                                    daysToSend.toString(),
                                    reason.text,
                                    (maxDays - days.length).toString(),
                                    context);
                              } else {
                                ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                        content:
                                            Text('No hay dias seleccionados')));
                              }
                            }
                          },
                          child: const Text("CREAR SOLICITUD"),
                        ),
                      )
                    ],
                  ),
                )));
  }

  //Calendario
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
        String formattedDate2 = DateFormat('ddMMyyyy').format(selected);
        daysToSend.add(formattedDate2);
        //resta la cantidad de dias dis´ponibles
        daysToShow = daysToShow -1;
      });
    }
  }

  _delete(days, selected, selectedToSend) async {
    setState(() {
      //remueve el valor mostrado al usuario de ambas listas
      days.remove(selected);
      daysToSend.remove(selectedToSend);
      daysToShow = daysToShow +1;

    });
  }

  //Hora
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

class DaysTo {
  final String day;
  const DaysTo(this.day);
  Map<String, dynamic> toJson() => {
        "day": day,
      };
}
