import 'package:flutter/material.dart';
import 'package:intranet_movil/model/approve_request.dart';
import 'package:intranet_movil/services/post_approved_request.dart';
import 'package:intranet_movil/utils/constants.dart';

class ApprovedRequestDetail extends StatefulWidget {
  const ApprovedRequestDetail({Key? key, required this.approvedRequestData})
      : super(key: key);

  final List<ApprovedRequestModel> approvedRequestData;

  @override
  State<StatefulWidget> createState() => _ApprovedRequestDetailState();
}

class _ApprovedRequestDetailState extends State<ApprovedRequestDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(StringIntranetConstants.requestDetail),
        ),
        body: SingleChildScrollView(
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
                    style: TextStyle(fontSize: 16.00, fontWeight: FontWeight.bold),
                  ),
                  const Padding(padding: EdgeInsets.only(left: 8)),
                  Text(widget.approvedRequestData[0].typeRequest,
                  style: const TextStyle(fontSize: 16.00))
                ],
              ),
              const Padding(padding: EdgeInsets.only(top: 24)),
              Row(
                children: [
                  const Text(
                    "Forma de pago:  ",
                    style: TextStyle(fontSize: 16.00, fontWeight: FontWeight.bold),
                  ),
                  const Padding(padding: EdgeInsets.only(left: 8)),
                  Text(
                    widget.approvedRequestData[0].payment,
                    style: const TextStyle(fontSize: 16),
                  ),
                ],
              ),
              widget.approvedRequestData[0].typeRequest ==
                      "Salir durante la jornada"
                  ? Column(
                      children: [
                        const Padding(padding: EdgeInsets.only(top: 24)),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            const Text("Hora de salida:  ",
                                style: TextStyle(
                                    fontSize: 16.00,
                                    fontWeight: FontWeight.bold)),
                            Text(widget.approvedRequestData[0].start,
                            style: const TextStyle(fontSize: 16.00))
                          ],
                        ),
                      ],
                    )
                  : const Padding(padding: EdgeInsets.only(top: 8)),
              const Padding(padding: EdgeInsets.only(top: 16)),
              const Text(
                    "Dias seleccionados: ",
                    style: TextStyle(fontSize: 16.00, fontWeight: FontWeight.bold),
                  ),
              const Padding(padding: EdgeInsets.only(top: 8)),
              ListView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: widget.approvedRequestData[0].days.split(',').length,
                  itemBuilder: (BuildContext context, int index) {
                    return Card(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(
                                left: 16, top: 16, bottom: 16),
                            child: Text(widget.approvedRequestData[0].days
                                .split(',')[index]),
                          ),
                        ],
                      ),
                    );
                  }),
                  const Padding(padding: EdgeInsets.only(top: 8)),
              widget.approvedRequestData[0].revealName == "no data"
                  ? const Padding(padding: EdgeInsets.zero)
                  :  Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Responsable durante ausencia:",
                    style: TextStyle(fontSize: 16.00, fontWeight: FontWeight.bold),
                  ),
                  const Padding(padding: EdgeInsets.only(top: 4)),

                  Text(widget.approvedRequestData[0].revealName,
                  style: const TextStyle(fontSize: 16.00))
                ],
              ),
              const Padding(padding: EdgeInsets.only(top: 24)),
              const Text(
                "Motivo",
                style: TextStyle(
                  fontSize: 16.00,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.start,
              ),
              const Padding(padding: EdgeInsets.only(top: 8)),
              Text(widget.approvedRequestData[0].reason,
              style: const TextStyle(fontSize: 16.00)),
              const Padding(padding: EdgeInsets.only(top: 64)),

              SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: ColorIntranetConstants.primaryColorDark, // background
                    onPrimary: Colors.white, // foreground
                  ),
                  child:  const Text("APROBAR SOLICITUD"),
                  onPressed: (){
                    showManagerAlertDialog(context,widget.approvedRequestData[0].id.toString(), "Aprobada");
                  },
                ),
              ),
              const Padding(padding: EdgeInsets.only(top: 16)),
              SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Color.fromARGB(255, 202, 20, 7), // background
                    onPrimary: Colors.white, // foreground
                  ),
                  child:  const Text("RECHAZAR SOLICITUD"),
                  onPressed: (){
                    showManagerAlertDialog(context,widget.approvedRequestData[0].id.toString(), "Rechazada");
                  },
                ),),
          
            ],
          ),
        ));
  }

  showManagerAlertDialog(BuildContext context, String requestID, String responseRequest) {
    Widget cancelButton = TextButton(
      child: const Text("Cancelar"),
      onPressed:  () {
        Navigator.of(context, rootNavigator: true).pop();
      },
    );
    Widget continueButton = TextButton(
      child: const Text("Aceptar"),
      onPressed:  () {
        postApprovedRequest(requestID, responseRequest, context);
        Navigator.of(context, rootNavigator: true).pop();
      },
    );

    AlertDialog alert = AlertDialog(
      title: const Text("Aprobar"),
      content: const Text("¿Deseas aprobar esta solicitud?"),
      actions: [
        cancelButton,
        continueButton,
      ],
    );

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

  }
