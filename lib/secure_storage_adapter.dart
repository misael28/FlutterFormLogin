import "package:flutter_secure_storage/flutter_secure_storage.dart";
import 'package:form/internal_storage.dart';

class SecureStorageAdapter extends InternalStorageAdapter {
  final FlutterSecureStorage secureStorage = FlutterSecureStorage();

  void saveUser(String name, String surName) async {
    await secureStorage.write(key: 'name', value: name);
    await secureStorage.write(key: 'surName', value: surName);
    print('Dados seguros');
  }

  Future<String> getFullName() async {
    String? name = await secureStorage.read(key: "name");
    String? surName = await secureStorage.read(key: "surName");

     if((name != null) && (surName != null)){
      return name + " " + surName; 
    } else {
      return "Usuario nao encontrado";      
    }
  }

}
