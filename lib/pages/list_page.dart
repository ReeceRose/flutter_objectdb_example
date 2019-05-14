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
              Map<dynamic, dynamic> item = items.elementAt(index);
              return Dismissible(
                key: Key(index.toString()),
                onDismissed: (direction) {
                  items.removeAt(index);
                  DatabaseProvider.db.removeName(item['_id']);
                },
                direction: DismissDirection.endToStart,
                background: Container(
                  alignment: AlignmentDirectional.centerEnd,
                  color: Colors.red,
                  child: Padding(
                    padding: EdgeInsets.fromLTRB(0.0, 0.0, 10.0, 0.0),
                    child: Icon(
                      Icons.delete,
                      color: Colors.white,
                    ),
                  ),
                ),
                child: ListTile(
                  leading: Icon(Icons.label),
                  title: Text(
                    item['name'].toString(),
                  ),
                ),
              );
            },
          );
        }
      },
    );
  }
}
