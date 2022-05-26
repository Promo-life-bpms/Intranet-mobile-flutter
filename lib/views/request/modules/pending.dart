import 'package:flutter/material.dart';
import 'package:intranet_movil/model/request.dart';
import 'package:intranet_movil/widget/alerts/request_detail_alert_dialog.dart';
import 'package:intranet_movil/widget/skeletons/list_view_request.dart';

void main() => runApp( PendingRequestPage(requestModel:const [],));

// ignore: must_be_immutable
class PendingRequestPage extends StatelessWidget {
   PendingRequestPage({Key? key, required this.requestModel}) : super(key: key);
   late List<RequestModel>? requestModel = [];
 
  @override
  Widget build(BuildContext context) {
    return  requestModel == null || requestModel!.isEmpty
          ? const ListviewRequestPage()
          : Column(
            children: [
              Expanded(
                child: ListView.builder(
                  padding: const EdgeInsets.all(8),
                  itemCount: requestModel!.length,
                  itemBuilder: (context, index) {
                    return  Padding(
                            padding: const EdgeInsets.all(8),
                            child: Card(
                                elevation: 10,
                                shape: RoundedRectangleBorder(
                                  side: const BorderSide(
                                      color: Colors.white70, width: 1),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: InkWell(
                                  onTap: () {
                                    RequestDetailAlertDialog.showFullDialog(
                                    context, 
                                    requestModel![index].typeRequest,
                                    requestModel![index].payment,
                                    requestModel![index].start,
                                    requestModel![index].end,
                                    requestModel![index].reason,
                                    requestModel![index].directManagerStatus,
                                    requestModel![index].humanResourcesStatus,
                                    requestModel![index].days );
                                  },
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.all(16),
                                        child: Text(
                                          requestModel![index].typeRequest,
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                          style: const TextStyle(
                                            fontSize: 16.00,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding:const EdgeInsets.only(
                                            left: 16, bottom: 16),
                                        child: Row(
                                          children: [
                                            Text(requestModel![index].payment,
                                                maxLines: 1,
                                                overflow: TextOverflow.ellipsis,
                                                style: const TextStyle(
                                                  fontSize: 12.00,
                                                )),
                                            const Padding(
                                                padding:
                                                    EdgeInsets.only(left: 24)),
                                            const Text("Dias:  ",
                                                maxLines: 3,
                                                overflow: TextOverflow.ellipsis,
                                                style: TextStyle(
                                                    fontSize: 12.00,
                                                    fontWeight:
                                                        FontWeight.bold)),
                                            Flexible(
                                              child: Container(
                                                padding: const EdgeInsets.only(
                                                    right: 13.0),
                                                child: Text(
                                                    requestModel![index].days,
                                                    maxLines: 1,
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                    softWrap: false,
                                                    style: const TextStyle(
                                                      fontSize: 12.00,
                                                    )),
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                )),
                          ); 
                  },
                ),
              )
            ],
          );
  }
}
