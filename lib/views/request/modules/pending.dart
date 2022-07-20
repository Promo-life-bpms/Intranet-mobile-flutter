import 'package:flutter/material.dart';
import 'package:intranet_movil/model/request.dart';
import 'package:intranet_movil/views/request/modules/no_request.dart';
import 'package:intranet_movil/views/request/widget/request_delete_alert_dialog.dart';
import 'package:intranet_movil/views/request/widget/request_detail_alert_dialog.dart';


class PendingRequestPage extends StatelessWidget {
  const PendingRequestPage({Key? key, required this.requestModel, required this.token, required this.contextMain} ) : super(key: key);
  final List<RequestModel>? requestModel;
  final String token;
  final BuildContext contextMain;

  @override
  Widget build(BuildContext context) {
    return  requestModel == null || requestModel!.isEmpty
          ? const NoRequest()
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
                                    requestModel![index].revealName,
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
                                        padding: const EdgeInsets.only(left: 16, right:16 ),
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              requestModel![index].typeRequest,
                                              maxLines: 1,
                                              overflow: TextOverflow.ellipsis,
                                              style: const TextStyle(
                                                fontSize: 16.00,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),

                                            IconButton(
                                              onPressed: (){
                                                RequestDelete().showRequestDelete(contextMain, token, requestModel![index].id.toString());
/*                                                 postRequestDelete(token, requestModel![index].id.toString());
 */                                              }, 
                                              icon: const Icon(Icons.delete)
                                              )
                                          ],
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
