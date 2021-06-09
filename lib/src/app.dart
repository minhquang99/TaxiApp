import 'package:flutter/material.dart';
import 'package:qrab/src/blocs/auth_bloc.dart';
import 'package:qrab/src/resources/login_page.dart';
import 'package:qrab/src/resources/register_page.dart';

class MyApp extends InheritedWidget {

  //inheritedWidget: cac Widget con co the truy cap den cha Inherited
  //khai bao Auth_bloc 1 lan de cac widget con dung
  final Auth_Bloc authBloc;
  final Widget child;
  MyApp(this.authBloc, this.child) : super(child: child);

  // @override
  // Widget build(BuildContext context) {
  //   return MaterialApp(
  //     home: LoginPage(),
  //   );
  // }

  @override
  bool updateShouldNotify(InheritedWidget oldWidget) {
    return false;
    throw UnimplementedError();
  }
  //static func, help the widgets connect and use data in MyApp extends Inherited
  static MyApp? of(BuildContext context){
    return context.dependOnInheritedWidgetOfExactType<MyApp>();
  }
}
