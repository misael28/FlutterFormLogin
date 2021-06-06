import 'package:form/internal_storage.dart';
import 'package:form/user.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class SQLAdapter extends InternalStorageAdapter {
  static Database? _database;

  Future<Database> get database async {
    if(_database !=null ){
      return _database!;
    }

    _database = await initDB();
    return _database!;
  }

  initDB() async {
    String path = join(await getDatabasesPath(), 'user_database.db');

    return await openDatabase(
      path,
      onCreate: (db, version){
        return db.execute('CREATE TABLE Users(name TEXT, surname TEXT)');
      },
      version: 1);
  }

  @override
  Future<String> getFullName() async {
    final db = await database;
    var response = await db.query(
      'Users', 
      columns: ['rowid','name','surname'],
      where: 'rowid = ?',
      whereArgs: [2]);

    if (response.isNotEmpty) {
      final user = User.fromMap(response.first);
      
      return '${user.rowId}' + user.name + ' ' + user.surName;
    } else {
      return 'Not found';
    }
  }

  @override
  void saveUser(String name, String surName) async {
    // TODO: implement saveUser
    final Database db = await database;
    var user = {
      'name': name,
      'surname': surName,
    };

    await db.insert('Users', user); 
    print('Saved in database');
  }

  Future<String> deleteUser(int id) async {
    final Database db = await database;
    await db.rawDelete('DELETE FROM Users WHERE rowid = $id');
    return 'Deleted';
  }
}