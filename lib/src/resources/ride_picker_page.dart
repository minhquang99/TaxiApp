import 'package:flutter/material.dart';

class RidePickerPage extends StatefulWidget {
  const RidePickerPage({Key? key}) : super(key: key);

  @override
  _RidePickerPageState createState() => _RidePickerPageState();
}

class _RidePickerPageState extends State<RidePickerPage> {

  var _addressController;

  @override
  void initState(){
    _addressController = TextEditingController(text: "");
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        constraints: BoxConstraints.expand(),
        color: Color(0xfff8f8f8),
        child: Column(
          children: [
            Container(
              color: Colors.white,
              child: Padding(
                padding: const EdgeInsets.only(top: 10),
                child: Container(
                  width: double.infinity,
                  height: 50,
                  child: Stack(
                    alignment: AlignmentDirectional.centerStart,
                    children: [
                      SizedBox(
                        width: 40,
                        height: 50,
                        child: Center(
                            child: Image.asset('assets/ic_map_nav.png')
                        ),
                      ),
                      Positioned(
                        top: 0,
                        right: 0,
                        width: 40,
                        height: 60,
                        child: Center(
                          child: FlatButton(
                              onPressed: () {},
                              child: Image.asset('assets/ic_remove_x.png')
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 40, right: 50),
                        child: TextField(
                          controller: _addressController, 
                          textInputAction: TextInputAction.search,
                          onSubmitted: (str) {},
                          style: TextStyle(fontSize: 15, color: Colors.black),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
