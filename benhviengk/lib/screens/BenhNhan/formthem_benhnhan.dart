import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
class FormThemBenhNhan extends StatefulWidget {
  final Function AddBenhNhan;
  FormThemBenhNhan (this.AddBenhNhan);

  @override
  State<FormThemBenhNhan> createState() => _FormThemBenhNhanState();
}
class _FormThemBenhNhanState extends State<FormThemBenhNhan> {
  final TextEditingController hoVaTen = TextEditingController();
  DateTime _ngaySinh = DateTime.now();
  final TextEditingController soPhong = TextEditingController();
  final TextEditingController Khoa = TextEditingController();
  final TextEditingController BenhAn = TextEditingController();
  final TextEditingController ma = TextEditingController();
  String TrangThai = "Nhập viện";
  void submitdataBenhNhan() {
    final enterma = ma.text;
    final enterhoVaTen = hoVaTen.text;
    final enterngaySinh = _ngaySinh;
    final entersoPhong = soPhong.text;
    final enterKhoa = Khoa.text;
    final enterBenhAn = BenhAn.text;
    final enterTrangThai = TrangThai;
      widget.AddBenhNhan(
        int.tryParse(enterma),
        enterhoVaTen,
        enterngaySinh ,
        int.tryParse(entersoPhong),
        enterKhoa,
        enterBenhAn,
        enterTrangThai,
      );
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
            Text('Thêm người bệnh thành công', style: TextStyle(color: Colors.green)),
          ],
        ),
      ),
    );
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Card(
        elevation: 6,
        child: SingleChildScrollView(
        child: Container(
          height: 1500,
          padding: EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              TextField(
                decoration: InputDecoration(labelText: 'Nhập mã bệnh nhân'),
                controller:ma,
                keyboardType: TextInputType.number,
              ),
              TextField(
                decoration: InputDecoration(labelText: 'Họ và tên'),
                controller: hoVaTen,
              ),
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
                      setState(() {_ngaySinh = pickedDate;
                      }
                      );
                    }
                    },
                      child:const Text("Sửa")),
                ],
              ),
              TextField(
                decoration: InputDecoration(labelText: 'Sồ phòng: '),
                controller: soPhong,
              ),
              TextField(
                decoration: InputDecoration(labelText: 'Khoa: '),
                controller: Khoa,
              ),
              TextField(
                decoration: InputDecoration(labelText: 'Bệnh án: '),
                controller: BenhAn,
              ),
              Row(
                children: [
                  Text("Chọn trạng thái: "),
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
              TextButton(
                child: Text('Thêm bệnh nhân'),
                onPressed: () {
                  submitdataBenhNhan();
                  _showSuccessSnackbar();
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        ),
      ),
      ),
    );
  }
}