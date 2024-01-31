import 'package:flutter/material.dart';
import 'package:hactiv8_bithealth_flutter/widgets/login_card.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        title: const Text("Splash Screen"),
      ),
      body: const FormCard(),
    );
  }
}
