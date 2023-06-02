import 'package:flutter/material.dart';
import 'package:torrefactor/API/TypesKafe.dart';

import '../API/Kafe.dart';
import '../API/Plan.dart';

class ChangePlanForm extends StatefulWidget {
  ChangePlanForm({super.key, this.plan});

  Plan? plan;

  @override
  State<ChangePlanForm> createState() => _ChangePlanFormState();
}

List<Kafe> list = [Rubisca(), Arbrista(), Roupetta(), Tourista(), Goldoria()];

class _ChangePlanFormState extends State<ChangePlanForm> {
  Kafe dropdownValue = list.first;

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: Form(
        key: _formKey,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            DropdownButton<Kafe>(
              value: dropdownValue,
              icon: const Icon(Icons.arrow_downward),
              elevation: 16,
              style: const TextStyle(color: Colors.deepPurple),
              underline: Container(
                height: 2,
                color: Colors.deepPurpleAccent,
              ),
              onChanged: (Kafe? value) {
                // This is called when the user selects an item.
                setState(() {
                  dropdownValue = value!;
                });
              },
              items: list.map<DropdownMenuItem<Kafe>>((Kafe value) {
                return DropdownMenuItem<Kafe>(
                  value: value,
                  child: Text(value.nom),
                );
              }).toList(),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16.0),
              child: ElevatedButton(  
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    Navigator.pop(context, Plan(dropdownValue));
                  }
                },
                child: Text('Cout : ${dropdownValue.cout} Deevee'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
