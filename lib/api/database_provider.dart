import 'dart:io';

import 'package:objectdb/objectdb.dart';
import 'package:path_provider/path_provider.dart';

class DatabaseProvider {
  DatabaseProvider._();

  static final DatabaseProvider db = DatabaseProvider._();

  ObjectDB _database;

  initializeDatabase() async {
    Directory appDocDir = await getApplicationDocumentsDirectory();
    String path = [appDocDir.path, 'example.db'].join('/');
    _database = ObjectDB(path);
    _database.open();
    return _database;
  }

  Future<ObjectDB> get database async {
    return _database == null ? await initializeDatabase() : _database;
  }

  insertName(String name) async {
    ObjectDB tempDatabase = await database;
    tempDatabase.insert({'name': name});
  }

  Future<List<Map<dynamic, dynamic>>> getAllNames() async {
    ObjectDB tempDatabase = await database;
    return await tempDatabase.find({});
  }

  removeName(String id) async {
    ObjectDB tempDatabase = await database;
    await tempDatabase.remove({ '_id': id });
  }

  close() async {
    ObjectDB tempDatabase = await database;
    await tempDatabase.tidy();
    await tempDatabase.close();
  }
}
