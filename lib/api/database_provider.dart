import 'dart:io';

import 'package:objectdb/objectdb.dart';

class DatabaseProvider {
  DatabaseProvider._();

  final path = Directory.current.path + 'example.db';

  static final DatabaseProvider databaseProvider = DatabaseProvider._();

  ObjectDB _database;

  initializeDatabase() async {
    _database = ObjectDB(path);
    _database.open();
    return _database;
  }

  Future<ObjectDB> get database async {
    return _database == null ? await initializeDatabase() : _database;
  }

  insertName(String name) async {
    ObjectDB db = await database;
    db.insert({ 'name': name });
  }

  close() async {
    ObjectDB db = await database;
    await db.tidy();
    await db.close();
  }



}