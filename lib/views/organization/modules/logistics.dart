import 'package:flutter/material.dart';
import 'package:intranet_movil/model/directory.dart';
import 'package:intranet_movil/widget/cards/user_info_card.dart';
import 'package:intranet_movil/widget/skeletons/list_view_company.dart';

class LogisticsDirectoryPage extends StatefulWidget {
  const LogisticsDirectoryPage({Key? key, required this.directoryModel}) : super(key: key);
  final List<DirectoryModel>? directoryModel;

  @override
  State<LogisticsDirectoryPage> createState() => _LogisticsDirectoryPageState();
}

class _LogisticsDirectoryPageState extends State<LogisticsDirectoryPage> {
  @override
  Widget build(BuildContext context) {
    return  widget.directoryModel == null || widget.directoryModel!.isEmpty
          ? 
          const ListviewCompanyPage()
          : 
          Column(
            children: [
              const Padding(padding: EdgeInsets.only(top: 20)),
              Expanded(
                child: ListView.builder(
                  padding: const EdgeInsets.only(left:16, right: 16),
                  itemCount: widget.directoryModel!.length,
                  itemBuilder: (context, index) {
                    return UserInfoCard(userData: [
                      DirectoryModel(
                          id: widget.directoryModel![index].id,
                          fullname: widget.directoryModel![index].fullname,
                          email: widget.directoryModel![index].email,
                          photo: widget.directoryModel![index].photo,
                          department: widget.directoryModel![index].department,
                          position: widget.directoryModel![index].position)
                    ]);
                  },
                ),
              )
            ],
          );
  }
}
