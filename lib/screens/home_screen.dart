import 'package:flutter/material.dart';
import 'package:hactiv8_bithealth_flutter/widgets/my_custom_dropdown_form.dart';
import 'package:hactiv8_bithealth_flutter/widgets/my_custom_form.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final GlobalKey<FormState> _dropdownForm = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Form Validation Demo"),
      ),
      body: const Column(
        children: [
          MyCustomForm(),
          MyCustomDropdownForm(),
        ],
      ),
    );
  }
}
