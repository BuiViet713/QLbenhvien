import 'package:flutter/material.dart';

class ListRoom extends StatelessWidget {
  // const ListRoom({super.key});

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text(
        'Danh sách Phòng Bệnh',
        style: TextStyle(
          color: Colors.black,
          fontSize: 18,
          fontWeight: FontWeight.bold
        ),
        ),
        backgroundColor: Colors.white,
        centerTitle: true,
      ),
    );
  }
}