import 'package:benhviengk/models/phongbenh.dart';
import 'package:flutter/material.dart';

class edit_phong extends StatefulWidget {
  final PhongBenh phong;
  edit_phong(this.phong);

  @override
  State<edit_phong> createState() => _edit_phongState();
}

class _edit_phongState extends State<edit_phong> {
  final soPhongController = TextEditingController();

  final khoaController = TextEditingController();

  final soLuongController = TextEditingController();

  final trangThaiController = TextEditingController();

  @override
  void initState() {
    super.initState();
    soPhongController.text = widget.phong.SoPhong.toString();
    khoaController.text = widget.phong.Khoa.toString();
    soLuongController.text = widget.phong.SoLuong.toString();
    trangThaiController.text = widget.phong.TrangThai.toString();
  }
  void _showSuccessSnackbar() {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        duration: Duration(seconds: 2),
        content: Row(
          children: [
            Icon(
              Icons.check_circle,
              color: Colors.green,
            ),
            SizedBox(width: 8),
            Text('Chỉnh sửa thành công!', style: TextStyle(color: Colors.green)),
          ],
        ),
      ),
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Chinh sua Phong Benh'),
      ),
      body: SingleChildScrollView(
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
                  PhongBenh editPhong = PhongBenh(
                    SoPhong: int.parse(soPhongController.text),
                    Khoa: khoaController.text,
                    SoLuong: int.parse(soLuongController.text),
                    TrangThai: trangThaiController.text,
                  );
                  Navigator.pop(context, editPhong);
                  _showSuccessSnackbar();

                  // Thực hiện xử lý hoặc lưu thông tin ở đây
                },
                style: ElevatedButton.styleFrom(
                  primary: Color.fromRGBO(112, 109, 219, 2),
                ),
                child: Text(
                  'Luu Phong Benh',
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