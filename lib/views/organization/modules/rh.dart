import 'package:flutter/material.dart';
import 'package:intranet_movil/model/directory.dart';
import 'package:intranet_movil/views/organization/widget/organization_builder.dart';
import 'package:intranet_movil/widget/skeletons/list_view_company.dart';

class RHDirectoryPage extends StatefulWidget {
  const RHDirectoryPage({Key? key, required this.directoryModel}) : super(key: key);
  final List<DirectoryModel> directoryModel;

  @override
  State<RHDirectoryPage> createState() => _RHDirectoryPageState();
}

class _RHDirectoryPageState extends State<RHDirectoryPage> {
   @override
  Widget build(BuildContext context) {
    return widget.directoryModel.isEmpty
        ? const ListviewCompanyPage()
        : OrganizationBuilder(directoryData: widget.directoryModel);
  }
}
