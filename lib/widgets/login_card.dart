import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/http_exception_model.dart';
import '../providers/auth_provider.dart';

class FormCard extends StatefulWidget {
  const FormCard({Key? key}) : super(key: key);

  @override
  State<FormCard> createState() => _FormCardState();
}

class _FormCardState extends State<FormCard> {
  final _formKey = GlobalKey<FormState>();
  bool _isLoading = false;

  final Map<String, String> _authData = {
    'email': "",
    'password': "",
  };

  void _showErrorDialog(String errMessage) {
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text("Error"),
        content: Text(errMessage),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            style: TextButton.styleFrom(
              backgroundColor: Colors.orange,
            ),
            child: const Text(
              "Okay",
              style: TextStyle(color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }

  Future<void> _formsubmit() async {
    // if (!_formKey.currentState!.validate()) {
    //   return;
    // }

    try {
      setState(() {
        _isLoading = true;
      });
      _formKey.currentState?.save();

      await Provider.of<AuthProvider>(context, listen: false)
          .login(_authData['email'] as String, _authData['password'] as String);
    } on HttpException catch (err) {
      _showErrorDialog(err.toString());
    } catch (err) {
      _showErrorDialog("Something went wrong");
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        ClipRRect(
          borderRadius: BorderRadius.circular(60),
          child: SizedBox(
            height: 120,
            width: 120,
            child: Image.network(
              "https://pbs.twimg.com/profile_images/1303645505465974785/BAedfmOT.jpg",
              fit: BoxFit.contain,
            ),
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 10),
                  child: TextFormField(
                    decoration: const InputDecoration(
                      labelText: "E-mail",
                      border: OutlineInputBorder(),
                    ),
                    keyboardType: TextInputType.emailAddress,
                    onSaved: (email) {
                      _authData["email"] = email as String;
                    },
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Email cannot be empty";
                      }
                      return "";
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 10),
                  child: TextFormField(
                    decoration: const InputDecoration(
                      labelText: "Password",
                      border: OutlineInputBorder(),
                    ),
                    obscureText: true,
                    onSaved: (password) {
                      _authData["password"] = password as String;
                    },
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Password cannot be empty";
                      }
                      return "";
                    },
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    _isLoading ? null : _formsubmit();
                  },
                  child: _isLoading
                      ? const CircularProgressIndicator()
                      : const Text("Login"),
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}
