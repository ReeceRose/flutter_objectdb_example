import 'package:Flutter_ObjectDB_Example/api/database_provider.dart';
import 'package:flutter/material.dart';

class AddPage extends StatelessWidget {
  TextEditingController _nameController;
  String _name = "";

  AddPage() {
    _nameController = TextEditingController(text: '');
    _nameController.addListener(() {
      _name = _nameController.text;
    });
  }

  @override
  Widget build(BuildContext context) {
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
            controller: _nameController,
          ),
          FlatButton(
            color: Colors.blue,
            onPressed: () {
              if (_name.isEmpty) return;
              DatabaseProvider.db.insertName(_name);
              // reset name
              _nameController.text = '';
              // Confirmation of insert
              Scaffold.of(context).showSnackBar(
                SnackBar(
                  content: Text('Added name to local database'),
                ),
              );
              // Force close the keyboard
              FocusScope.of(context).requestFocus(new FocusNode());
            },
            child: Text('Add'),
          )
        ],
      ),
    );
  }
}
