import 'dart:async';

import 'package:flutter/material.dart';
import 'package:qrab/src/fire_base/fire_base_auth.dart';

class Auth_Bloc {
  var _fireAuth = FireAuth();
  StreamController _nameController = new StreamController();
  StreamController _phoneController = new StreamController();
  StreamController _emailController = new StreamController();
  StreamController _pwdController = new StreamController();

  Stream get nameStream => _nameController.stream;
  Stream get phoneStream => _phoneController.stream;
  Stream get emailStream => _emailController.stream;
  Stream get pwdStream => _pwdController.stream;

  bool isValidInfor(String name, String phone, String email, String pwd) {
    if (name == null || name.length < 6) {
      _nameController.sink.addError('Name incorrect!');
      return false;
    }
    _nameController.sink.add('OK');
    if (phone == null) {
      _phoneController.sink.addError('Phone number invalid!');
      return false;
    }
    _phoneController.sink.add('OK');
    if (email == null || !email.contains('@')) {
      _emailController.sink.addError('Email is invalid');
      return false;
    }
    _emailController.sink.add('OK');
    if (pwd == null || pwd.length < 6) {
      _pwdController.sink.addError('Password is incorrect!');
      return false;
    }
    _pwdController.sink.add('OK');
    return true;
  }

  void signUp(String name, String phone, String email, String pass,
      Function onSuccess, Function(String) onRegisterErr) {
    _fireAuth.signUp(email, pass, name, phone, onSuccess, onRegisterErr);
  }

  void signIn(String email, String pass, Function onSuccess,
      Function(String) onSignInErr) {
    _fireAuth.signIn(email, pass, onSuccess, onSignInErr);
  }

  void dispose() {
    _nameController.close();
    _emailController.close();
    _pwdController.close();
    _phoneController.close();
  }
}
