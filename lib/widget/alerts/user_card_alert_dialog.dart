import 'package:flutter/material.dart';
import 'package:flutter_linkify/flutter_linkify.dart';
import 'package:intranet_movil/model/directory.dart';
import 'package:url_launcher/url_launcher.dart';

class UserCardAlertDialog {
  static showFullDialog(
    BuildContext context,
    String fullname,
    String email,
    String photo,
    String department,
    String position,
    List<Data> data,

  ) {
    showGeneralDialog(
        context: context,
        barrierDismissible: true,
        barrierLabel:
            MaterialLocalizations.of(context).modalBarrierDismissLabel,
        transitionDuration: const Duration(milliseconds: 200),
        pageBuilder: (BuildContext buildContext, Animation animation,
            Animation secondaryAnimation) {
          return Padding(
            padding:
                const EdgeInsets.symmetric(vertical: 32.0, horizontal: 16.0),
            child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Column(
                  children: [
                    Container(
                      width: double.infinity,
                      height: 200.0,
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage("lib/assets/background.jpg"),
                          fit: BoxFit.cover,
                        ),
                      ),
                      child: Align(
                        alignment: const Alignment(0, 2.5),
                        child: SizedBox(
                          width: 120.0,
                          height: 120.0,
                          child: OverflowBox(
                            child: CircleAvatar(
                              backgroundImage: NetworkImage(photo),
                            ),
                          ),
                        ),
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(top: 80.0),
                    ),
                    Column(
                      children: [
                        Text(
                          fullname,
                          style: const TextStyle(
                            fontSize: 20.00,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const Padding(
                          padding: EdgeInsets.only(top: 14.0),
                        ),
                        Text(
                          position,
                          style: const TextStyle(fontSize: 16.00),
                        ),
                        const Padding(
                          padding: EdgeInsets.only(top: 36.0),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 24.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  const Icon(Icons.house),
                                  const Padding(
                                      padding: EdgeInsets.only(right: 8.0)),
                                  Text(department)
                                ],
                              ),
                              const Padding(
                                  padding: EdgeInsets.only(top: 12.0)),
                              Row(
                                children: [
                                  const Icon(Icons.work),
                                  const Padding(
                                      padding: EdgeInsets.only(right: 8.0)),
                                  Text(position)
                                ],
                              ),
                              const Padding( padding: EdgeInsets.only(top: 12.0)),

                              const Text("Información de contacto: ", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold), textAlign: TextAlign.start,),
                              
                              const Padding( padding: EdgeInsets.only(top: 12.0)),

                              data.isNotEmpty ?
                              Column(
                                children: [
                                  ListView.builder(
                                  physics: const NeverScrollableScrollPhysics(),
                                  shrinkWrap: true,
                                  padding: const EdgeInsets.all(0),
                                  itemCount: data.length,
                                  itemBuilder: (context, index) {
                                    return 
                                    data[index].type == "Email"?
                                    Padding(
                                      padding: const EdgeInsets.only(bottom: 8),
                                      child: Row(                            
                                        children: [
                                          InkWell(
                                            child: const Icon(Icons.mail),
                                            onTap: (){
                                              launch("mailto://${data[index].data}");
                                            },
                                          ),
                                          const Padding(padding: EdgeInsets.only(right: 8.0)),
                                          SelectableLinkify(
                                            onOpen: (link) => launch("mailto://${data[index].data}"),
                                            text: data[index].data,
                                            style: const TextStyle(
                                              fontSize: 12.00,
                                            ),
                                            textAlign: TextAlign.justify,
                                          ),
                                        ],
                                      ),
                                    )
                                    : data[index].type == "Celular"? 
                                    Padding(
                                      padding: const EdgeInsets.only(bottom: 8),
                                      child: Row(                            
                                        children: [
                                          InkWell(
                                            child: const Icon(Icons.phone),
                                            onTap: (){
                                              launch("tel://${data[index].data}");
                                            },
                                            ),
                                          const Padding(padding: EdgeInsets.only(right: 8.0)),
                                          SelectableLinkify(
                                            onOpen: (link) => launch("tel://${data[index].data}"),
                                            text: data[index].data,
                                            style: const TextStyle(
                                              fontSize: 12.00,
                                            ),
                                            textAlign: TextAlign.justify,
                                          ),
                                        ],
                                      ),
                                    )

                                    : const Padding(padding: EdgeInsets.zero);
                                  },
                                ),
                                ],
                                
                              )
                              :
                               Row(
                                children: [
                                  InkWell(
                                    child: const Icon(Icons.mail),
                                      onTap: (){
                                        launch("mailto://$email");
                                        },
                                    ),
                                  const Padding(padding: EdgeInsets.only(right: 8.0)),
                                  SelectableLinkify(
                                          onOpen: (link) => launch("mailto://$email"),
                                          text: email,
                                          style: const TextStyle(
                                            fontSize: 12.00,
                                          ),
                                          textAlign: TextAlign.justify,
                                        ),
                                ],
                              ), 
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          );
        });
  }
}
