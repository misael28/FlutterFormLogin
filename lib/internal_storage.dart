import "package:shared_preferences/shared_preferences.dart";

class InternalStorage {

  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  void saveUser(String name, String surName) async {
    final internalPref = await _prefs;
    internalPref.setString('name', name);
    internalPref.setString('surname', surName);
    print('Dados Salvos');
  }

  Future<String> getUserFullName() async {
    final internalPref = await _prefs;
    String? name = internalPref.getString("name");
    String? surName = internalPref.getString("surName");

    if((name != null) && (surName!=null)){
      return name + " " + surName; 
    } else {
      return "Usuario nao encontrado";      
    }
  }
}