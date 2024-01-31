import 'package:flutter/material.dart';

class MyCustomDropdownForm extends StatefulWidget {
  const MyCustomDropdownForm({Key? key}) : super(key: key);

  @override
  State<MyCustomDropdownForm> createState() => _MyCustomDropdownFormState();
}

class _MyCustomDropdownFormState extends State<MyCustomDropdownForm> {
  final _formKey = GlobalKey<FormState>();

  // final _items = const [
  //   DropdownMenuItem(value: "first Item", child: Text("First Item")),
  //   DropdownMenuItem(value: "second Item", child: Text("Second Item")),
  // ];
  final _randomItems = ["Testing", "Percobaan", "Handphone", "Smart Watch"];
  String selectedItem = "Testing";

  @override
  Widget build(BuildContext context) {
    selectedItem = _randomItems.first;

    return DropdownButtonFormField(
        key: _formKey,
        value: selectedItem,
        items: _randomItems.map<DropdownMenuItem<String>>((e) {
          return DropdownMenuItem(
            value: e,
            child: Text(e),
          );
        }).toList(),
        onChanged: (value) {
          setState(() {
            selectedItem = value!;
          });
        });
  }
}
