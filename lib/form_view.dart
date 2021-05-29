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
      backgroundColor: Colors.blue,
      body: Center(
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
          ),
          width: MediaQuery.of(context).size.width * 0.7,
          height: MediaQuery.of(context).size.height * 0.5,
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                TextFormField(
                  validator: (text){
                    if(text == null || text.isEmpty){
                      return 'Campo nome é obrigatorio';
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
                      return 'Campo sobrenome é obrigatorio';
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
                        title: Text('Bem vindo! $name $surName'),
                      );
                    });
                  }
                }, child: Text("Validar"))
              ],),
          ),
        ),
      ),
    );
  }
}