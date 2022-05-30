import 'package:flutter/material.dart';
import 'package:intranet_movil/model/directory.dart';
import 'package:intranet_movil/views/organization/widget/organization_builder.dart';
import 'package:intranet_movil/widget/skeletons/list_view_company.dart';

class LogisticsDirectoryPage extends StatefulWidget {
  const LogisticsDirectoryPage({Key? key, required this.directoryModel}) : super(key: key);
  final List<DirectoryModel> directoryModel;

  @override
  State<LogisticsDirectoryPage> createState() => _LogisticsDirectoryPageState();
}

class _LogisticsDirectoryPageState extends State<LogisticsDirectoryPage> {
  @override
  Widget build(BuildContext context) {
    return widget.directoryModel.isEmpty
        ? const ListviewCompanyPage()
        : OrganizationBuilder(directoryData: widget.directoryModel);
  }
}