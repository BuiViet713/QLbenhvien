import 'package:flutter/material.dart';

class DSbenhnhan extends StatelessWidget {
  // const DSbenhnhan({super.key});

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text(
        'Danh sách bệnh nhân',
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