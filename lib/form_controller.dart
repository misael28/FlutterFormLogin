import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import './form_model.dart';

class FormController {
  final _formKey = GlobalKey<FormState>();
  final _model = FormModel();
  bool get isValid => _formKey.currentState!.validate();

  String get name => _model.getName;
  String get surName => _model.getSurName;

  GlobalKey get formKey => _formKey;

  String? validateName(String? text){
    if(text == null || text.isEmpty){
      return 'Campo nome é obrigatorio';
    }
      return null;
  }
  void onChangeName(String value){
    _model.setName = value;
   } 
  void onChangeSurName(String value){
    _model.setSurName = value;
  } 

  void saveUser() {
    _model.saveUser();
  }

  Future<String> get fullName => _model.getFullName();

  Future<String> deleteUser(int? id) => _model.deleteUser(id);
}