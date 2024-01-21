import 'package:flutter/material.dart';
class AddNewPhongBenh extends StatelessWidget {
  final Function addPhongBenh;
  final soPhongController = TextEditingController();
  final khoaController = TextEditingController();
  final soLuongController = TextEditingController();
  final trangThaiController = TextEditingController();
  AddNewPhongBenh(this.addPhongBenh);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: MediaQuery.of(context).viewInsets,
      child: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: Column(
          children: [
            TextField(
              controller: soPhongController,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'So Phong',
              ),
            ),
            SizedBox(height: 20),
            TextField(
              controller: khoaController,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Khoa',
              ),
            ),
            SizedBox(height: 20),
            TextField(
              controller: soLuongController,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'So Luong',
              ),
            ),
            SizedBox(height: 20),
            TextField(
              controller: trangThaiController,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Trang Thai',
              ),
            ),
            SizedBox(height: 20),
            SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                onPressed: () {
                  addPhongBenh(
                    int.parse(soPhongController.text),
                    khoaController.text,
                    int.parse(soLuongController.text),
                    trangThaiController.text,
                  );
                },
                style: ElevatedButton.styleFrom(
                  primary: Color.fromRGBO(112, 109, 219, 2),
                ),
                child: Text(
                  'Them Phong Benh',
                  style: TextStyle(color: Colors.white, fontSize: 18),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}