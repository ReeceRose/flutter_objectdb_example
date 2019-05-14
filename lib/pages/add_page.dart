import 'package:Flutter_ObjectDB_Example/api/database_provider.dart';
import 'package:flutter/material.dart';

class AddPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    String _name = "";
    return Container(
      padding: EdgeInsets.fromLTRB(20.0, 5.0, 20.0, 0.0),
      child: Column(
        children: <Widget>[
          TextField(
            decoration: InputDecoration(
              labelText: 'Enter name',
              hintText: 'John Doe',
            ),
            keyboardType: TextInputType.text,
            onChanged: (String value) {
              _name = value;
            },
          ),
          FlatButton(
            color: Colors.blue,
            onPressed: () {
              if (_name.isEmpty) return;
              // submit
              DatabaseProvider.db.insertName(_name);
              _name = "";
              Scaffold.of(context).showSnackBar(
                SnackBar(
                  content: Text('Added name to local database'),
                ),
              );
            },
            child: Text('Add'),
          )
        ],
      ),
    );
  }
}
