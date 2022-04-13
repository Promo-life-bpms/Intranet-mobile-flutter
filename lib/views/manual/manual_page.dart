import 'package:flutter/material.dart';
import 'package:intranet_movil/model/manual.dart';
import 'package:intranet_movil/services/api_manual.dart';
import 'package:intranet_movil/utils/constants.dart';
import 'package:intranet_movil/widget/navigation_drawer_widget.dart';
import 'package:url_launcher/url_launcher.dart';

class ManualPage extends StatefulWidget {
  const ManualPage({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<ManualPage> {
  late List<ManualModel>? _manualModel = [];
  
  @override
  void initState() {
    super.initState();
    _getData();
  }

  void _getData() async {
    _manualModel = (await ApiManualService().getManual())!.cast<ManualModel>();
    Future.delayed(const Duration(seconds: 1)).then((value) => setState(() {}));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const NavigationDrawerWidget(),
      appBar: AppBar(
        title: const Text('Manuales'),
      ),
      body: _manualModel == null || _manualModel!.isEmpty
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : ListView.builder(
              padding: const EdgeInsets.all(8),
              itemCount: _manualModel!.length,
              itemBuilder: (context, index) {
                return Card(
                  child:Padding(
                    padding: const EdgeInsets.only(bottom: 20.0),
                      child: Column(
                      children: [
                        const SizedBox(
                          width: double.infinity,
                          height: 160.0,
                          child:FittedBox(
                            fit: BoxFit.contain,
                            child: Image(
                                image: AssetImage('lib/assets/pdf.png'),
                              )
                          ),
                        ),

                        Text(
                          _manualModel![index].name,
                          style: const TextStyle(fontSize: 20.00,fontWeight: FontWeight.bold,),
                        ),
                        const  Padding( 
                          padding: EdgeInsets.only(bottom: 20.0),
                        ),
                        SizedBox(
                          width: 200,
                          height: 50, 
                          child: ElevatedButton(
                            onPressed: () {
                              _launchURL(ApiIntranetConstans.baseUrl+_manualModel![index].file); 
                            },
                              child: const Text('ABRIR'),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
    );
  }
}


// Funcion que abre url en el navegador
void _launchURL(_url) async {
  if (!await launch(_url)) throw 'Could not launch $_url';
}
