import "package:shared_preferences/shared_preferences.dart";
import "package:flutter_secure_storage/flutter_secure_storage.dart";

class InternalStorage {

  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  final FlutterSecureStorage secureStorage = FlutterSecureStorage();

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

    if((name != null) && (surName != null)){
      return name + " " + surName; 
    } else {
      return "Usuario nao encontrado";      
    }
  }

  void secureUser(String name, String surName) async {
    await secureStorage.write(key: 'name', value: name);
    await secureStorage.write(key: 'surName', value: surName);
    print('Dados seguros');
  }

  Future<String> getSecureFullName() async {
    String? name = await secureStorage.read(key: "name");
    String? surName = await secureStorage.read(key: "surName");
    
     if((name != null) && (surName != null)){
      return name + " " + surName; 
    } else {
      return "Usuario nao encontrado";      
    }
  }
}