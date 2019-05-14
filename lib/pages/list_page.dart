import 'package:Flutter_ObjectDB_Example/api/database_provider.dart';
import 'package:flutter/material.dart';

class ListPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: DatabaseProvider.db.getAllNames(),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (!snapshot.hasData) {
          return Center(
            child: CircularProgressIndicator(),
          );
        } else {
          List<Map<dynamic, dynamic>> items = snapshot.data;
          return ListView.builder(
            itemCount: items.length,
            itemBuilder: (BuildContext context, int index) {
              return Text(items.elementAt(index)['name'].toString());
            },
          );
        }
      },
    );
  }
}
