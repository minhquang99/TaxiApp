import 'package:flutter/material.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LoadingDialog {
  static void showLoadingDialog(BuildContext context, String msg){
    //dialog ko bi an di khi nhan o ngoa
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) => new Dialog(
          child: Container(
            color: Colors.white,
            height: 100,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
                  child: Text(
                    msg,
                    style: TextStyle(fontSize: 10),
                  ),
                )
              ],
            ),
          ),
    ));
  }

  static void hideLoadingDialog(BuildContext context){
    Navigator.of(context).pop(LoadingDialog);
  }
}