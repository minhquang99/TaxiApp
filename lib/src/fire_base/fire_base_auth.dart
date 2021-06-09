import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:qrab/src/blocs/auth_bloc.dart';

class FireAuth {
  //Make userdatabase
  FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  //Make a Node to save the data

  _createUser(String userID, String email, String pass, Function onSuccess,
      Function(String) onRegisterErr) {
    var user = {'email': email, 'pass': pass};
    //FirebaseDatabase: an object read, listen, write data to database in Firebase
    //child: tro toi Node users
    var ref = FirebaseDatabase.instance.reference().child("users");
    //Make a key userID
    ref.child(userID).set(user).then((user) {
      //success
      onSuccess();
    }).catchError((err) {
      onRegisterErr('Sign up fail, try again');
    });
  }

  void signUp(String email, String pass, String name, String phone,
      Function onSuccess, Function(String) onRegisterErr) {
    _firebaseAuth
        .createUserWithEmailAndPassword(email: email, password: pass)
        .then((user) {
      //
      _createUser(user.user!.uid, email, pass, onSuccess, onRegisterErr);
      print(user);
    }).catchError((err) {
      _onSignUpError(err.code, onRegisterErr);
    });
  }

  void signIn(String email, String pass, Function onSuccess,
      Function(String) onSignInErr) {
    _firebaseAuth
        .signInWithEmailAndPassword(email: email, password: pass)
        .then((user) {
      print('success');
      onSuccess();
    }).catchError((err) {
      onSignInErr('Sign_in fail, please try again');
    });
  }

  void _onSignUpError(String code, Function(String) onRegisterErr) {
    switch (code) {
      case "invalid-email":
        onRegisterErr('Invalid email');
        break;
      case 'email-already-in-use':
        onRegisterErr('Email has existed');
        break;
      case 'weak-password':
        onRegisterErr('The password is not strong');
        break;
      default:
        onRegisterErr('Sign up fail, try again!');
        break;
    }
  }
}
