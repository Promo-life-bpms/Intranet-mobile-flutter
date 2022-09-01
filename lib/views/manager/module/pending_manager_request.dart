import 'package:flutter/material.dart';
import 'package:intranet_movil/model/approve_request.dart';
import 'package:intranet_movil/views/manager/module/approved_request_detail.dart';
import 'package:intranet_movil/views/request/modules/no_request.dart';
import 'package:intranet_movil/widget/skeletons/list_view_company.dart';

class PendingManagerRequestPage extends StatefulWidget {
  const PendingManagerRequestPage({Key? key, required this.approvedModel})
: super(key: key);
  final List<ApprovedRequestModel> approvedModel;

  @override
  State<PendingManagerRequestPage> createState() =>  _PendingManagerRequestState();
}

class _PendingManagerRequestState extends State<PendingManagerRequestPage> {
  @override
  Widget build(BuildContext context) {
    return widget.approvedModel.isEmpty
        ? const NoRequest()
        : Column(
            children: [
              Expanded(
                child: ListView.builder(
                  padding: const EdgeInsets.all(8),
                  itemCount: widget.approvedModel.length,
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
                                  Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) =>
                                      ApprovedRequestDetail(approvedRequestData: [
                                        ApprovedRequestModel(
                                            id: widget.approvedModel[index].id,
                                            employeeID: widget.approvedModel[index].employeeID,
                                            fullname: widget.approvedModel[index].fullname,
                                            typeRequest: widget.approvedModel[index].typeRequest,
                                            revealName: widget.approvedModel[index].revealName,
                                            payment: widget.approvedModel[index].payment,
                                            start: widget.approvedModel[index].start,
                                            end:widget.approvedModel[index].end,
                                            reason: widget.approvedModel[index].reason,
                                            directManagerId: widget.approvedModel[index].directManagerId,
                                            directManagerStatus: widget.approvedModel[index].directManagerStatus,
                                            humanResourcesStatus: widget.approvedModel[index].humanResourcesStatus,
                                            visible: widget.approvedModel[index].visible,
                                            days: widget.approvedModel[index].days)
                                      ])));
                                  },
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.only(left: 16, right: 16, top: 16),
                                        child: Text(
                                          widget.approvedModel[index].typeRequest,
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                          style: const TextStyle(
                                            fontSize: 16.00,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),

                                      Padding(
                                        padding: const EdgeInsets.only(left: 16, top: 4, bottom: 4),
                                        child: Text("Solicitante: "+ widget.approvedModel[index].fullname,
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                          style: const TextStyle(
                                            fontSize: 12.00,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding:const EdgeInsets.only(
                                            left: 16, bottom: 16),
                                        child: Row(
                                          children: [
                                            Text(widget.approvedModel[index].payment,
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
                                                    widget.approvedModel[index].days,
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
