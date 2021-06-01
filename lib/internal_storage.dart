import "package:shared_preferences/shared_preferences.dart";

class InternalStorage {

  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  void saveUser(String name, String surName) async {
    final internalPref = await _prefs;
    internalPref.setString('name', name);
    internalPref.setString('surname', surName);
    print('Dados Salvos');
  }
}