import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:qrab/src/blocs/auth_bloc.dart';
import 'package:qrab/src/resources/dialog/loading_dialog.dart';
import 'package:qrab/src/resources/dialog/msg_dialog.dart';
import 'package:qrab/src/resources/home_page.dart';
import 'package:firebase_core/firebase_core.dart';

import 'login_page.dart';

class RegisterPage extends StatefulWidget {
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  Auth_Bloc _authBloc = new Auth_Bloc();

  TextEditingController _nameController = new TextEditingController();
  TextEditingController _phoneController = new TextEditingController();
  TextEditingController _emailController = new TextEditingController();
  TextEditingController _pwdController = new TextEditingController();

  bool _onShow = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.fromLTRB(30, 0, 30, 0),
        constraints: BoxConstraints.expand(),
        color: Colors.white,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset(
                'assets/qrab_car_1.png',
                fit: BoxFit.contain,
                width: 130,
              ),
              Text(
                'WELCOME',
                style: TextStyle(
                    fontSize: 30,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Sigmar_One'),
              ),
              Text('Sign up in simple steps',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.black,
                  )),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 40, 0, 20),
                child: StreamBuilder(
                    stream: _authBloc.nameStream,
                    builder: (context, snapshot) {
                      return TextField(
                        controller: _nameController,
                        decoration: InputDecoration(
                            labelText: 'Name',
                            errorText: snapshot.hasError
                                ? snapshot.error.toString()
                                : null,
                            labelStyle: TextStyle(fontSize: 15),
                            prefixIcon: Container(
                              width: 10,
                              height: 10,
                              child: Image.asset('assets/ic_user.png'),
                            ),
                            border: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.black, width: 1),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10)))),
                      );
                    }),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 0, 0, 20),
                child: StreamBuilder(
                    stream: _authBloc.phoneStream,
                    builder: (context, snapshot) {
                      return TextField(
                          controller: _phoneController,
                          decoration: InputDecoration(
                              labelText: 'Phone Number',
                              errorText: snapshot.hasError
                                  ? snapshot.error.toString()
                                  : null,
                              labelStyle: TextStyle(fontSize: 15),
                              prefixIcon: Container(
                                width: 10,
                                height: 10,
                                child: Image.asset('assets/ic_phone.png'),
                              ),
                              border: OutlineInputBorder(
                                  borderSide:
                                      BorderSide(color: Colors.black, width: 1),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10)))));
                    }),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 0, 0, 20),
                child: StreamBuilder(
                    stream: _authBloc.emailStream,
                    builder: (context, snapshot) {
                      return TextField(
                        controller: _emailController,
                        decoration: InputDecoration(
                            labelText: 'Email',
                            errorText: snapshot.hasError
                                ? snapshot.error.toString()
                                : null,
                            labelStyle: TextStyle(fontSize: 15),
                            prefixIcon: Container(
                              width: 10,
                              height: 10,
                              child: Image.asset('assets/qrab_email.png'),
                            ),
                            border: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.yellow, width: 1),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10)))),
                      );
                    }),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 0, 0, 20),
                child: Stack(
                  alignment: AlignmentDirectional.centerEnd,
                  children: [
                    StreamBuilder(
                        stream: _authBloc.pwdStream,
                        builder: (context, snapshot) {
                          return TextField(
                            controller: _pwdController,
                            style: TextStyle(fontSize: 18, color: Colors.black),
                            obscureText: _onShow,
                            decoration: InputDecoration(
                              labelText: 'Password',
                              errorText: snapshot.hasError
                                  ? snapshot.error.toString()
                                  : null,
                              labelStyle: TextStyle(fontSize: 15),
                              prefixIcon: Container(
                                width: 10,
                                height: 10,
                                child: Image.asset('assets/ic_lock.png'),
                              ),
                              border: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.yellow, width: 10),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10)),
                              ),
                            ),
                          );
                        }),
                    GestureDetector(
                      onTap: onToggleShowPass,
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(0, 0, 20, 0),
                        child: Text(
                          !_onShow ? 'HIDE' : 'SHOW',
                          style: TextStyle(
                              fontSize: 12,
                              color: Colors.black,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 0, 0, 20),
                child: SizedBox(
                  width: double.infinity,
                  child: RaisedButton(
                    color: Colors.black87,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(8)),
                    ),
                    onPressed: onSignUp,
                    child: Text(
                      'SIGN UP',
                      style: TextStyle(color: Colors.yellow),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(80, 0, 0, 0),
                child: RichText(
                  text: TextSpan(
                      text: 'Already a user?',
                      style: TextStyle(fontSize: 16, color: Colors.black),
                      children: <TextSpan>[
                        TextSpan(
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => LoginPage()));
                              },
                            text: ' Login now!',
                            style: TextStyle(
                                fontSize: 16,
                                color: Colors.black,
                                fontWeight: FontWeight.bold)),
                      ]),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  void onToggleShowPass() {
    setState(() {
      _onShow = !_onShow;
    });
  }

  void onSignUp() {
    var isValidInfor = _authBloc.isValidInfor(_nameController.text,
        _phoneController.text, _emailController.text, _pwdController.text);
    if (isValidInfor) {
      // new user
      //loading dialog
      LoadingDialog.showLoadingDialog(context, 'Loading...');
      _authBloc.signUp(_nameController.text, _pwdController.text,
          _emailController.text, _phoneController.text, () {
        LoadingDialog.hideLoadingDialog(context);
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => HomePage()));
      }, (msg) {
        LoadingDialog.hideLoadingDialog(context);
        MsgDialog.showMsgDialog(context, 'Sign in', msg);
        //show
      });
    }
  }
}
