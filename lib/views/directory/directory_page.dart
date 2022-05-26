import 'dart:async';

import 'package:flutter/material.dart';
import 'package:intranet_movil/model/directory.dart';
import 'package:intranet_movil/services/api_directory.dart';
import 'package:intranet_movil/utils/constants.dart';
import 'package:intranet_movil/widget/alert/user_card_alert_dialog.dart';
import 'package:intranet_movil/widget/navigation_drawer_widget.dart';
import 'package:intranet_movil/widget/skeletons/list_view_custom.dart';

class DirectoryPage extends StatefulWidget {
  const DirectoryPage({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<DirectoryPage> {
  late List<DirectoryModel>? _directoryModel = [];
  late List<DirectoryModel>? _directoryModelSearch = [];
  final _debouncer = Debouncer();

  @override
  void initState() {
    super.initState();
    _getData();
    _directoryModelSearch = _directoryModel;
  }

  void _getData() async {
    _directoryModel =
        (await ApiDirectoryService().getDirectory())!.cast<DirectoryModel>();
    Future.delayed(const Duration(seconds: 1)).then((value) => setState(() {}));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: const NavigationDrawerWidget(),
        appBar: AppBar(
          title: const Text(StringIntranetConstants.directoryPage),
        ),
        body: _directoryModel == null || _directoryModel!.isEmpty
            ? const ListViewExample2Page()
            :
             Column(
                children: [
                  Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 16.0, horizontal: 24.0),
                      child: TextField(
                        textInputAction: TextInputAction.search,
                        decoration: InputDecoration(
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(25.0),
                            borderSide: const BorderSide(
                              color: Colors.grey,
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20.0),
                            borderSide: const BorderSide(
                              color: Colors.blue,
                            ),
                          ),
                          suffixIcon: const InkWell(
                            child: Icon(Icons.search),
                          ),
                          contentPadding: const EdgeInsets.all(15.0),
                          hintText: 'Buscar',
                        ),
                        onChanged: (string) {
                          _debouncer.run(() {
                            setState(() {
                              _directoryModelSearch = _directoryModel
                                  ?.where(
                                    (u) => (u.fullname.toLowerCase().contains(
                                          string.toLowerCase(),
                                        )),
                                  )
                                  .toList();
                            });
                          });
                        },
                      )),
                  _directoryModelSearch!.isEmpty
                      ? Expanded(
                          child: ListView.builder(
                            padding: const EdgeInsets.only(left: 16, right: 16),
                            itemCount: _directoryModel!.length,
                            itemBuilder: (context, index) {
                              return Card(
                                elevation: 4,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                                clipBehavior: Clip.antiAlias,
                                child: InkWell(
                                  onTap: () {
                                    UserCardAlertDialog.showFullDialog(
                                        context,
                                        _directoryModel![index]
                                            .fullname
                                            .toString(),
                                        _directoryModel![index].email,
                                        ApiIntranetConstans.baseUrl +
                                            _directoryModel![index].photo,
                                        _directoryModel![index].department,
                                        _directoryModel![index].position);
                                  },
                                  child: Row(
                                    children: [
                                      Padding(
                                          padding: const EdgeInsets.symmetric(
                                              vertical: 16.0, horizontal: 24.0),
                                          child: SizedBox(
                                            width: 50,
                                            height: 50,
                                            child: CircleAvatar(
                                              backgroundImage: NetworkImage(
                                                  ApiIntranetConstans.baseUrl +
                                                      _directoryModel![index]
                                                          .photo
                                                          .toString()), /*  backgroundImage: NetworkImage(ApiIntranetConstans.baseUrl + _directoryModel![index].photo.toString()), */
                                            ),
                                          )),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            _directoryModel![index].fullname,
                                            maxLines: 1,
                                            overflow: TextOverflow.ellipsis,
                                            style: const TextStyle(
                                              fontSize: 16.00,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          const Padding(
                                              padding: EdgeInsets.only(top: 8)),
                                          Text(_directoryModel![index].position,
                                              maxLines: 1,
                                              overflow: TextOverflow.ellipsis,
                                              style: const TextStyle(
                                                fontSize: 12.00,
                                              )),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            },
                          ),
                        )
                      : Expanded(
                          child: ListView.builder(
                            padding: const EdgeInsets.only(left: 16, right: 16),
                            itemCount: _directoryModelSearch!.length,
                            itemBuilder: (context, index) {
                              return Card(
                                elevation: 4,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                                clipBehavior: Clip.antiAlias,
                                child: InkWell(
                                  onTap: () {
                                    UserCardAlertDialog.showFullDialog(
                                        context,
                                        _directoryModelSearch![index]
                                            .fullname
                                            .toString(),
                                        _directoryModelSearch![index].email,
                                        ApiIntranetConstans.baseUrl +
                                            _directoryModelSearch![index].photo,
                                        _directoryModelSearch![index]
                                            .department,
                                        _directoryModelSearch![index].position);
                                  },
                                  child: Row(
                                    children: [
                                      Padding(
                                          padding: const EdgeInsets.symmetric(
                                              vertical: 16.0, horizontal: 24.0),
                                          child: SizedBox(
                                            width: 50,
                                            height: 50,
                                            child: CircleAvatar(
                                              backgroundImage: NetworkImage(
                                                  ApiIntranetConstans.baseUrl +
                                                      _directoryModelSearch![
                                                              index]
                                                          .photo
                                                          .toString()), /*  backgroundImage: NetworkImage(ApiIntranetConstans.baseUrl + _directoryModel![index].photo.toString()), */
                                            ),
                                          )),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            _directoryModelSearch![index]
                                                .fullname,
                                            maxLines: 1,
                                            overflow: TextOverflow.ellipsis,
                                            style: const TextStyle(
                                              fontSize: 16.00,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          const Padding(
                                              padding: EdgeInsets.only(top: 8)),
                                          Text(
                                              _directoryModelSearch![index]
                                                  .position,
                                              maxLines: 1,
                                              overflow: TextOverflow.ellipsis,
                                              style: const TextStyle(
                                                fontSize: 12.00,
                                              )),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                ],
              ));
  }
}

class Debouncer {
  int? milliseconds;
  VoidCallback? action;
  Timer? timer;

  run(VoidCallback action) {
    if (null != timer) {
      timer!.cancel();
    }
    timer = Timer(
      const Duration(milliseconds: Duration.millisecondsPerSecond),
      action,
    );
  }
}
