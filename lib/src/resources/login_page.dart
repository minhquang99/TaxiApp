import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:qrab/src/app.dart';
import 'package:qrab/src/blocs/auth_bloc.dart';
import 'package:qrab/src/resources/dialog/loading_dialog.dart';
import 'package:qrab/src/resources/dialog/msg_dialog.dart';
import 'package:qrab/src/resources/home_page.dart';
import 'package:qrab/src/resources/register_page.dart';

class LoginPage extends StatefulWidget {

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

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
              SizedBox(
                  height: 30,
              ),
              Image.asset('assets/qrab_car_1.png', fit: BoxFit.contain, width: 180,),
              Text(
                'WELCOME BACK',
                style: TextStyle(
                    fontSize: 30,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Sigmar_One'
                )
              ),
              Text(
                  'Login to use QRAB',
                  style: TextStyle(
                      fontSize: 16,
                      color: Colors.black,
                  )
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 50, 0, 20),
                child: TextField(
                  controller: _emailController,
                  decoration: InputDecoration(
                      labelText: 'Email',
                      labelStyle: TextStyle(fontSize: 15),
                      prefixIcon: Container(
                        width: 10,
                        height: 10,
                        child: Image.asset('assets/qrab_email.png'),
                      ),
                      border: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.yellow, width: 1),
                          borderRadius: BorderRadius.all(Radius.circular(10))
                      )

                  ),
                )
              ),
              Stack(
                alignment: AlignmentDirectional.centerEnd,
                children: [
                  TextField(
                    controller: _pwdController,
                    style: TextStyle(fontSize: 18, color: Colors.black),
                    obscureText: _onShow,
                    decoration: InputDecoration(
                      labelText: 'Password',
                      labelStyle: TextStyle(fontSize: 15),
                      prefixIcon: Container(
                        width: 10,
                        height: 10,
                        child: Image.asset('assets/ic_lock.png'),
                      ),
                      border: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.yellow, width: 10),
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: onToggleShowPass,
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(0, 0, 20, 0),
                      child: Text(
                        !_onShow ? 'HIDE' : 'SHOW',
                        style: TextStyle(fontSize: 12, color: Colors.black, fontWeight: FontWeight.bold),
                      ),
                    ),
                  )
                ],
              ),
              Container(
                alignment: AlignmentDirectional.centerEnd,
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(0, 20, 0, 20),
                  child: Text(
                    'Forgot Password',
                    style: TextStyle(fontSize: 16, color: Colors.black, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              SizedBox(
                width: double.infinity,
                child: RaisedButton(
                  color: Colors.black87,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(8)),
                    ),
                    onPressed: onSignIn,
                  child: Text(
                    'SIGN IN',
                    style: TextStyle(color: Colors.yellow),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(50, 20, 0, 0),
                child: RichText(
                    text: TextSpan(
                      text: 'New user?',
                      style: TextStyle(fontSize: 16, color: Colors.black),
                      children: <TextSpan> [
                        TextSpan(
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => RegisterPage()));
                            },
                          text: ' Sign up for a new account',
                          style: TextStyle(fontSize: 16, color: Colors.black,fontWeight: FontWeight.bold)
                        ),
                      ]
                    ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  void onToggleShowPass(){
    setState(() {
      _onShow = !_onShow;
    });
  }

  void onSignIn(){
    // String email = _emailController.text;
    // String pass = _pwdController.text;
    var authBloc = MyApp.of(context)!.authBloc;
    LoadingDialog.showLoadingDialog(context, 'Loading...');
    authBloc.signIn(_emailController.text, _pwdController.text, (){
      LoadingDialog.hideLoadingDialog(context);
      Navigator.of(context).push(MaterialPageRoute(builder: (context) => HomePage()));
    }, (msg) {
      LoadingDialog.hideLoadingDialog(context);
      MsgDialog.showMsgDialog(context, 'Sign-In', msg);
    });
    //Navigator.of(context).push(MaterialPageRoute(builder: (context) => HomePage()));

  }
}
