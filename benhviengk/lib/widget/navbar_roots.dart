import 'package:benhviengk/screens/chat_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:benhviengk/screens/home_screen.dart';
import 'package:benhviengk/screens/settings_screen.dart';
import "package:benhviengk/screens/BenhNhan/benhnhan.dart";
import 'package:benhviengk/screens/PhongBenh/DanhSachPhongBenh.dart';


class NavBarRoots extends StatefulWidget {
  @override
  State<NavBarRoots> createState() => _NavBarRootsState();
}

class _NavBarRootsState extends State<NavBarRoots> {
  int _selectedIndex = 0;
  final _screens = [
    HomeScreen(),
    DSBenhNhan(),
    DanhSachPhongBenh(),
    ChatScreen(),
    SettingScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: _screens[_selectedIndex],
      bottomNavigationBar: Container(
        height: 80,
        child: BottomNavigationBar(
          backgroundColor: Colors.white,
          type: BottomNavigationBarType.fixed,
          selectedItemColor: Color(0xFF7165D6),
          unselectedItemColor: Colors.black26,
          selectedLabelStyle: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 15,
          ),
          currentIndex: _selectedIndex,
          onTap: (index) {
            setState(() {
              _selectedIndex = index;
            });
          },
          items: [
            BottomNavigationBarItem(
                icon: Icon(Icons.home_filled), label: "Home"),
            BottomNavigationBarItem(
                icon: Icon(
                  CupertinoIcons.person_2_square_stack_fill,
                ),
                label: "Bệnh Nhân"),
            BottomNavigationBarItem(
                icon: Icon(Icons.local_hospital), label: "Phòng bệnh"),
                 BottomNavigationBarItem(
                icon: Icon(Icons.message), label: "Hỗ Trợ"),
            BottomNavigationBarItem(
                icon: Icon(Icons.settings), label: "Settings"),
          ],
        ),
      ),
    );
  }
}
