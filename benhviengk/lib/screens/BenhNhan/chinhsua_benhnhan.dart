import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:benhviengk/models/benhnhan.dart';
import '../../models/benhnhan.dart';
class EditBenhNhan extends StatefulWidget {
  final BenhNhan benhNhan;
  EditBenhNhan (this.benhNhan);

  @override
  State<EditBenhNhan> createState() => _EditBenhNhanState();
}

class _EditBenhNhanState extends State<EditBenhNhan> {
  final TextEditingController ma = TextEditingController();
  TextEditingController hoVaTen = TextEditingController();
  TextEditingController soPhong = TextEditingController();
  TextEditingController Khoa = TextEditingController();
  TextEditingController BenhAn = TextEditingController();
  DateTime _ngaySinh = DateTime.now();

  String TrangThai = "Nhập viện";

  @override
  void initState() {
    super.initState();
    ma.text = widget.benhNhan.ma.toString();
    hoVaTen.text = widget.benhNhan.hoVaTen.toString();
    soPhong.text = widget.benhNhan.soPhong.toString();
    Khoa.text = widget.benhNhan.Khoa.toString();
    BenhAn.text = widget.benhNhan.BenhAn.toString();
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
        title: null,
        flexibleSpace: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(width: 8),
                Text('CHỈNH SỬA THÔNG TIN BỆNH NHÂN', style: TextStyle(fontSize: 18)),
              ],
            ),
          ],
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Form(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              TextFormField(
                controller: ma,
                decoration: InputDecoration(labelText: 'Mã số: '),
              ),
              SizedBox(height: 16.0),
              TextFormField(
                controller: hoVaTen,
                decoration: InputDecoration(labelText: 'Họ và tên: '),
              ),
              SizedBox(height: 16.0),
              Row(
                children: [
                  Text("Ngày sinh: " + DateFormat('dd-MM-yyyy').format(_ngaySinh)  ,style: TextStyle(fontSize: 17)),
                  TextButton(onPressed: () async {
                    DateTime? pickedDate = await showDatePicker(
                      context: context,
                      initialDate: _ngaySinh,
                      firstDate: DateTime(1900),
                      lastDate: DateTime.now(),
                    );
                    if (pickedDate != null && pickedDate != _ngaySinh) {
                      setState(() {
                        _ngaySinh = pickedDate;
                      }
                      );
                    }
                  },
                      child:const Text("Sửa")),
                ],
              ),
              TextFormField(
                controller: soPhong,
                decoration: InputDecoration(labelText: 'Số phòng: '),
              ),
              TextFormField(
                controller: Khoa,
                decoration: InputDecoration(labelText: 'Khoa: '),
              ),
              TextFormField(
                controller: BenhAn,
                decoration: InputDecoration(labelText: 'Bệnh án: '),
              ),
          Row(
            children: [
              Text("Chọn tình trạng: "),
              DropdownButton<String>(
                value: TrangThai,
                onChanged: (String? newValue1) {
                  setState(() {
                    TrangThai = newValue1!;
                  });
                },
                items: <String>['Nhập viện', 'Xuất viện'].map((String value1) {
                  return DropdownMenuItem<String>(
                    value: value1,
                    child: Text(value1),
                  );
                }).toList(),
              ),
            ],
            ),
          // TextField(
          //   decoration: InputDecoration(labelText: 'Nhập loại phòng'),
          //   controller: loaiPhong,
          // ),
            Row(
              children: [
              ElevatedButton(
                onPressed: () {
                  // Lưu thông tin chỉnh sửa và trả về kết quả
                  BenhNhan editBenhNhan = BenhNhan(
                      ma: int.parse(ma.text),
                      hoVaTen: hoVaTen.text,
                      ngaySinh: _ngaySinh,
                      soPhong: int.parse(soPhong.text),
                      Khoa: Khoa.text,
                      BenhAn: BenhAn.text,
                      TrangThai: TrangThai,
                  );
                  Navigator.pop(context, editBenhNhan);
                  _showSuccessSnackbar();
                },
                child: Text('Lưu Thay Đổi'),
              ),
              ]
            ),
          ]
        ),
      ),
    ),
    );
  }
}