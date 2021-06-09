import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:qrab/src/app.dart';
import 'package:qrab/src/blocs/auth_bloc.dart';
import 'package:qrab/src/resources/home_page.dart';
import 'package:qrab/src/resources/login_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp(
      new Auth_Bloc(),
      MaterialApp(
        home: LoginPage(),
      )));
}
