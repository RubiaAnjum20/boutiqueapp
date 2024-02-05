import 'package:flutter/material.dart';

class SignUpProvider extends ChangeNotifier {
  String _email = "", _password = "", _name = "";
  TextEditingController _emailController = TextEditingController();
  TextEditingController _nameController = TextEditingController();
  TextEditingController _passController = TextEditingController();
 

  TextEditingController get emailcontroller => _emailController;
  TextEditingController get namecontroller => _nameController;
  TextEditingController get passcontroller => _passController;
 
  String get email => _email;
  String get password => _password;
  String get name => _name;
 

  final userFormKey = GlobalKey<FormState>();

  void saveCredentials() {
    _email = emailcontroller.text;
    _name = namecontroller.text;
    _password = passcontroller.text;
    notifyListeners();
  }
}