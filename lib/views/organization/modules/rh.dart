import 'package:flutter/material.dart';
import 'package:intranet_movil/model/directory.dart';
import 'package:intranet_movil/utils/alert_dialog.dart';
import 'package:intranet_movil/utils/constants.dart';

void main() => runApp( RHDirectoryPage(directoryModel:const [],));

// ignore: must_be_immutable
class RHDirectoryPage extends StatelessWidget {
   RHDirectoryPage({Key? key, required this.directoryModel}) : super(key: key);
   late List<DirectoryModel>? directoryModel = [];


  @override
  Widget build(BuildContext context) {
    return  directoryModel == null || directoryModel!.isEmpty
          ? 
          const Center(
            child: CircularProgressIndicator(color: ColorIntranetConstants.primaryColorNormal,),
          )
          : 
          Column(
            children: [
              const Padding(padding: EdgeInsets.only(top: 20)),
              Expanded(
                child: ListView.builder(
                  padding: const EdgeInsets.only(left:16, right: 16),
                  itemCount: directoryModel!.length,
                  itemBuilder: (context, index) {
                    return Card(
                      shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      ),
                      clipBehavior: Clip.antiAlias,
                      child: InkWell(
                        onTap: (){
                          UserCardAlertDialog.showFullDialog(
                            context,
                            directoryModel![index].fullname.toString(),
                            directoryModel![index].email,
                            ApiIntranetConstans.baseUrl + directoryModel![index].photo, 
                            directoryModel![index].department,
                            directoryModel![index].position );
                        },
                        child: Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 24.0),
                            child: SizedBox(
                              width: 50,
                              height: 50,
                              child:CircleAvatar(
                              backgroundImage: NetworkImage(ApiIntranetConstans.baseUrl + directoryModel![index].photo.toString()),
                              /*  backgroundImage: NetworkImage(ApiIntranetConstans.baseUrl + _directoryModel![index].photo.toString()), */                          ),
                            )    
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                  directoryModel![index].fullname,
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  style: const TextStyle(fontSize: 16.00,fontWeight: FontWeight.bold,),
                              ),
                              const Padding(
                                padding: EdgeInsets.only(top:8)
                              ),
                              Text(
                                  directoryModel![index].position,
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  style: const TextStyle(fontSize: 12.00,)
                              ),  
                            ],
                          ),        
                        ],
                        ),
                      ),
                    );
                  },
                ),
              )
            ],
          );
  }
}
