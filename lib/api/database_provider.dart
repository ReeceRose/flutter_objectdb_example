import 'dart:io';

import 'package:objectdb/objectdb.dart';

class DatabaseProvider {
  DatabaseProvider._();

  final path = Directory.current.path + '/example.db';

  static final DatabaseProvider databaseProvider = DatabaseProvider._();

  ObjectDB _database;


  initializeDatabase() async {
    _database = ObjectDB(path);
    _database.open();
  }


  Future<ObjectDB> get database async {
    return _database == null ? await initializeDatabase() : _database;
  }

  close() async {
    await _database.tidy();
    await _database.close();
  }



}