import 'package:Flutter_ObjectDB_Example/api/database_provider.dart';
import 'package:flutter/material.dart';

import 'package:Flutter_ObjectDB_Example/components/custom_app_bar.dart';
import 'package:Flutter_ObjectDB_Example/pages/add_page.dart';
import 'package:Flutter_ObjectDB_Example/pages/list_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> with SingleTickerProviderStateMixin {
  TabController _tabController;

  @override
  void dispose() {
    super.dispose();
    DatabaseProvider.db.close();
  }

  @override
  void initState() {
    super.initState();
    DatabaseProvider.db.initializeDatabase();
    _tabController = TabController(length: 2, vsync: this);
    _tabController.addListener(_handleTabSelection);
  }

  void _handleTabSelection() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text('ObjectDB Example'),
        ),
        body: TabBarView(
          controller: _tabController,
          children: <Widget>[
            AddPage(),
            ListPage()
          ],
        ),
        bottomNavigationBar: CustomAppBar(tabController: _tabController),
      ),
    );
  }
}
