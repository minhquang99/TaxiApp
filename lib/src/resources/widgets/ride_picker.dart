import 'package:flutter/material.dart';
import 'package:qrab/src/resources/ride_picker_page.dart';

class RidePicker extends StatefulWidget {
  @override
  _RidePickerState createState() => _RidePickerState();
}

class _RidePickerState extends State<RidePicker> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(10)),
        boxShadow: [
          BoxShadow(
            color: Color(0x88999999),
            offset: Offset(0, 5),
            blurRadius: 5,
          )
        ]
      ),
      child: Column(
        children: [
          Container(
            height: 50,
            width: double.infinity,
            child: FlatButton(
                onPressed: (){
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => RidePickerPage()));
                },
                child: SizedBox(
                  width: double.infinity,
                  height: double.infinity,
                  child: Stack(
                    alignment: AlignmentDirectional.centerStart,
                    children: [
                      SizedBox(
                        width: 30,
                        height: 30,
                        //icon map
                        child: Center(
                          child: Image.asset('assets/ic_location_black.png'),
                        ),
                      ),
                      Positioned(
                        right: 0,
                        top: 10,
                        width: 30,
                        height: 30,
                        //icon remove
                          child: Center(
                            child: Image.asset('assets/ic_remove_x.png'),
                          )),
                      Padding(
                        padding: const EdgeInsets.only(left: 40, right: 50),
                        child: Text(
                          '237 Pham Van Chieu, P13, Go Vap',
                          style: TextStyle(fontSize: 15, color: Colors.black),
                        ),
                      ),
                    ],
                  ),
                )
            ),
          ),
          Container(
            height: 50,
            width: double.infinity,
            child: FlatButton(
                onPressed: (){},
                child: SizedBox(
                  width: double.infinity,
                  height: double.infinity,
                  child: Stack(
                    alignment: AlignmentDirectional.centerStart,
                    children: [
                      SizedBox(
                        width: 30,
                        height: 30,
                        //icon map
                        child: Center(
                          child: Image.asset('assets/ic_map_nav.png'),
                        ),
                      ),
                      Positioned(
                          right: 0,
                          top: 10,
                          width: 30,
                          height: 30,
                          //icon remove
                          child: Center(
                            child: Image.asset('assets/ic_remove_x.png'),
                          )),
                      Padding(
                        padding: const EdgeInsets.only(left: 40, right: 50),
                        child: Text(
                          'Home',
                          style: TextStyle(fontSize: 15, color: Colors.black),
                        ),
                      ),
                    ],
                  ),
                )
            ),
          ),
        ],
      ),
    );
  }
  
}
