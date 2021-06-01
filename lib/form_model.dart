import 'package:form/internal_storage.dart';

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

  final InternalStorage internalStorage = InternalStorage();
  void saveUser(){
    if(_name == null) return;
    if(_surName == null) return;

    internalStorage.saveUser(_name!, _surName!);
  }
}