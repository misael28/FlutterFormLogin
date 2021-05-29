import 'package:flutter/material.dart';

class FormView extends StatefulWidget {
  @override
  _FormViewState createState() => _FormViewState();
}

class _FormViewState extends State<FormView> {
  final _formKey = GlobalKey<FormState>();
  String name='';
  String surName = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Login information"),
      ),
      body: Form(
        key: _formKey,
        child: Column(
          children: [
            TextFormField(
              validator: (text){
                if(text == null || text.isEmpty){
                  return 'Texto é obrigatorio';
                }
                return null;
              },
              decoration: InputDecoration(
                hintText: 'Nome',
              ),
              onChanged: (text){
                name = text;
              },
            ),
            TextFormField(
              validator:  (text){
                if(text == null || text.isEmpty){
                  return 'Sobrenome é obrigatorio';
                }
                return null;
              },
              decoration: InputDecoration(
                hintText: "Sobrenome"
              ),
              onChanged: (text){
                surName = text;
              },
            ),
            ElevatedButton(onPressed: (){
              final isValid = _formKey.currentState!.validate();
              if(isValid){
                showDialog(context: context, builder: (context) {
                  return AlertDialog(
                    title: Text('$name $surName'),
                  );
                });
              }
            }, child: Text("Validate"))
          ],),
      ),
    );
  }
}