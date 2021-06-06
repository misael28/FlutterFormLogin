import 'package:flutter/material.dart';
import 'package:form/form_controller.dart';

class FormView extends StatefulWidget {
  @override
  _FormViewState createState() => _FormViewState();
}
class _FormViewState extends State<FormView> {
  final controller = FormController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      body: Center(
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
          ),
          width: MediaQuery.of(context).size.width * 0.7,
          height: MediaQuery.of(context).size.height * 0.5,
          child: Form(
            key: controller.formKey,
            child: Column(
              children: [
                Container(
                  margin: EdgeInsets.all(20),
                  width: MediaQuery.of(context).size.width * 0.6,
                  child: TextFormField(
                    validator: (String? text)=> controller.validateName(text),
                    decoration: InputDecoration(
                      hintText: 'Nome',
                    ),
                    onChanged: (value){controller.onChangeName(value);},
                  ),
                ),
                Container(
                   margin: EdgeInsets.all(10),
                  width: MediaQuery.of(context).size.width * 0.6,
                  child: TextFormField(
                    validator: (String? text)=>controller.validateName(text),
                    decoration: InputDecoration(
                      hintText: "Sobrenome"
                    ),
                    onChanged: (value){controller.onChangeSurName(value);},
                  ),
                ),
                Row(
                    children : [
                      Container(
                     margin: EdgeInsets.all(15),
                    child: ElevatedButton(
                      onPressed: (){
                      final isValid = controller.isValid;
                      if(isValid){
                        showDialog(
                          context: context, 
                          builder: (context) {
                          final name = controller.name;
                          final surName = controller.surName;
                          return AlertDialog(
                            title: Text('Bem vindo! $name $surName'),
                            content:
                                Container(
                                  child: ElevatedButton(
                                    onPressed:(){
                                      controller.saveUser();
                                      }, 
                                      child: Text('Salvar'))
                                ),  
                            );
                        });
                      }
                    }, child: Text("Validar")),
                  ),
                  Container(
                     margin: EdgeInsets.all(15),
                    child: FutureBuilder<String>(
                        future: controller.fullName,
                        builder: (context, snapshot) {
                          return Text(
                            snapshot.data ?? '',
                            maxLines: 10,);
                        },
                      )
                    ) 
                  ]
                ),
              ElevatedButton(
                onPressed: (){},
                child: Text(''),
              )],
              ),
          ),
        ),
      ),
    );
  }
}