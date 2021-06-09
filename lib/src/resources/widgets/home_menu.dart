import 'package:flutter/material.dart';

class MenuHome extends StatefulWidget {
  @override
  _MenuHomeState createState() => _MenuHomeState();
}

class _MenuHomeState extends State<MenuHome> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        ListTile(
          leading: Image.asset('assets/ic_menu_user.png'),
          title: Text(
            'Thông tin cá nhân',
            style: TextStyle(fontSize: 18, color: Colors.blue),
          ),
        ),
        ListTile(
          leading: Image.asset('assets/ic_menu_history.png'),
          title: Text(
            'Lịch sử chuyến đi',
            style: TextStyle(fontSize: 18, color: Colors.blue),
          ),
        ),
        ListTile(
          leading: Image.asset('assets/ic_menu_percent.png'),
          title: Text(
            'Mã giảm giá',
            style: TextStyle(fontSize: 18, color: Colors.blue),
          ),
        ),
        ListTile(
          leading: Image.asset('assets/ic_menu_help.png'),
          title: Text(
            'Hỗ trợ',
            style: TextStyle(fontSize: 18, color: Colors.blue),
          ),
        ),
        ListTile(
          leading: Image.asset('assets/ic_menu_logout.png'),
          title: Text(
            'Đăng xuất',
            style: TextStyle(fontSize: 18, color: Colors.blue),
          ),
        ),
      ],
    );
  }
}
