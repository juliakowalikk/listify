import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:listify/presentation/pages/list/widgets/drawer_body.dart';
import 'package:listify/presentation/pages/list/widgets/list_view_tile.dart';

class ListPage extends StatefulWidget {
  const ListPage({super.key});

  @override
  State<ListPage> createState() => _ListPageState();
}

class _ListPageState extends State<ListPage> {
  @override
  Widget build(BuildContext context) => Scaffold(
        drawer: const DrawerBody(),
        appBar: AppBar(
          iconTheme: const IconThemeData(color: Colors.black),
          backgroundColor: Colors.white,
          title: Text(
            Strings.of(context).listPageAppBarTitle,
            style: const TextStyle(color: Colors.black),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: const [
              ListViewTile(),
            ],
          ),
        ),
      );
}
