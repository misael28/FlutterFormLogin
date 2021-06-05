import 'package:form/internal_storage.dart';
import 'package:form/shared_preferences_adapter.dart';
import 'package:form/sql_adapter.dart';

class FormModel{
  String? _name;
  String? _surName;

  get getName => _name;

  get getSurName => _surName;

  set setName(String name){
    this._name = name;
  }

  set setSurName(String surName){
    this._surName = surName;
  }

  final InternalStorageAdapter internalStorage;

  FormModel({InternalStorageAdapter ? internalStorageAdapter})
    : internalStorage = internalStorageAdapter ?? SQLAdapter();


  void saveUser(){
    if(_name == null) return;
    if(_surName == null) return;

    internalStorage.saveUser(_name!, _surName!);
  }

  Future<String> getFullName() {
    return internalStorage.getFullName();
  }
}