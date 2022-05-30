import 'package:flutter/material.dart';
import 'package:intranet_movil/model/directory.dart';
import 'package:intranet_movil/views/organization/widget/organization_builder.dart';
import 'package:intranet_movil/widget/skeletons/list_view_company.dart';

class ManagementDirectoryPage extends StatefulWidget {
  const ManagementDirectoryPage({Key? key, required this.directoryModel}) : super(key: key);
  final List<DirectoryModel>? directoryModel;

  @override
  State<ManagementDirectoryPage> createState() => _ManagementDirectoryPageState();
}

class _ManagementDirectoryPageState extends State<ManagementDirectoryPage> {
  @override
  Widget build(BuildContext context) {
    return  widget.directoryModel == null || widget.directoryModel!.isEmpty
          ? 
          const ListviewCompanyPage()
          : OrganizationBuilder(
            directoryData: List<DirectoryModel>.generate(
                widget.directoryModel!.length,
                (index) => DirectoryModel(
                    id: widget.directoryModel![index].id,
                    fullname: widget.directoryModel![index].fullname,
                    email: widget.directoryModel![index].email,
                    photo: widget.directoryModel![index].photo,
                    department: widget.directoryModel![index].department,
                    position: widget.directoryModel![index].position)));
  }
}
