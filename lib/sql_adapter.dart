import 'package:form/internal_storage.dart';
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
        return db.execute('CREATE TABLE Users (name Text, surname Text)');
      },
      version: 1);
  }

  @override
  Future<String> getFullName() {
    // TODO: implement getFullName
   return Future.value('Usuario nao encontrado');
  }

  @override
  void saveUser(String name, String surName) async {
    // TODO: implement saveUser
    final Database db = await database;
    var user = {
      'name': name,
      'surname': surName,
    };

    await db.insert('User', user); 
    print('Usuario salvo no banco de dados');
  }
  
}