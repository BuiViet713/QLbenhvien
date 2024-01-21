import 'package:benhviengk/models/benhnhan.dart';
import 'package:benhviengk/screens/BenhNhan/nhapvien_benhnhan.dart';
import 'package:benhviengk/screens/BenhNhan/formthem_benhnhan.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:benhviengk/screens/BenhNhan/chinhsua_benhnhan.dart';
class danhsach_xuatvien extends StatefulWidget {
  final Function (int) onDelete;
  final List<BenhNhan> danhSachBenhNhanXuatVien;
  // List<BenhNhan> danhSachBenhNhanXuatVien;
  danhsach_xuatvien(this.danhSachBenhNhanXuatVien, {required this.onDelete});

  @override
  State<danhsach_xuatvien> createState() => _danhsach_xuatvienState();
}
class _danhsach_xuatvienState extends State<danhsach_xuatvien> {
  int _buttonIndex = 1;
  void _benhnhan(BuildContext context, BenhNhan benhNhan) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => EditBenhNhan(benhNhan),
      ),
    ).then((editedBN) {
      if (editedBN != null) {
        int index = widget.danhSachBenhNhanXuatVien.indexOf(benhNhan);
        setState(() {
          widget.danhSachBenhNhanXuatVien[index] = editedBN;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: widget.danhSachBenhNhanXuatVien.where((BenhNhan) => BenhNhan.TrangThai == "Xuất viện").map((benhnhan) {
        return Card(
          child:Column(
            children:<Widget>[
              SizedBox(height: 15),
              Text(
                "Thông tin bệnh nhân",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
              ),
              SizedBox(height: 15),
              Container(
                padding: EdgeInsets.symmetric(vertical: 5),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black12,
                      blurRadius: 4,
                      spreadRadius: 2,
                    ),
                  ],
                ),
                child: SizedBox(
                  width: MediaQuery.of(context).size.width,
                  child: Column(
                    children: [
                      //Thong tin benh nhan//
                      Padding(
                        padding: const EdgeInsets.only(right:20.0, left: 20.0, top: 10.0, bottom: 10.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Mã số: ${benhnhan.ma}\n"
                                  "Tên bệnh nhân: ${benhnhan.hoVaTen}\n"
                                  "Ngày sinh: ${benhnhan.ngaySinh.day}/${benhnhan.ngaySinh.month}/${benhnhan.ngaySinh.year}\n"
                                  "Trạng thái: ${benhnhan.TrangThai}",
                              style: TextStyle(
                                fontSize: 16,
                                color: Colors.black54,
                              ),
                            ),
                            Padding(padding: EdgeInsets.all(5.0)),
                            CircleAvatar(
                              radius: 25.0,
                              backgroundImage: AssetImage("images/doctor1.jpg"),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 15),
                        child: Divider(
                          // color: Colors.black,
                          thickness: 1,
                          height: 20,
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Row(
                            children: [
                              Icon(
                                Icons.room_outlined,
                                color: Colors.black54,
                              ),
                              SizedBox(width: 5),
                              Text(
                                "Số phòng: ${benhnhan.soPhong}",
                                style: TextStyle(
                                  color: Colors.black54,
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Icon(
                                Icons.local_hospital,
                                color: Colors.black54,
                              ),
                              SizedBox(width: 5),
                              Text(
                                "Khoa: ${benhnhan.Khoa}",
                                style: TextStyle(
                                  color: Colors.black54,
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Icon(
                                Icons.file_copy,
                                color: Colors.black54,
                              ),
                              SizedBox(width: 5),
                              Text(
                                "Bệnh án: ${benhnhan.BenhAn}",
                                style: TextStyle(
                                  color: Colors.black54,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      SizedBox(height: 15),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          InkWell(
                            onTap: () {
                              _benhnhan(context,benhnhan);
                            },
                            child: Container(
                              width: 150,
                              padding: EdgeInsets.symmetric(vertical: 12),
                              decoration: BoxDecoration(
                                color: Color(0xFFF4F6FA),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Center(
                                child: Text(
                                  "Chỉnh sửa",
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.black54,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              widget.onDelete(widget.danhSachBenhNhanXuatVien.indexOf(benhnhan));
                            },
                            child: Container(
                              width: 150,
                              padding: EdgeInsets.symmetric(vertical: 12),
                              decoration: BoxDecoration(
                                color: Color(0xFF7165D6),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Center(
                                child: Text(
                                  "Xóa",
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 10),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 20),
            ],
          ),
        );

      }).toList(),
    );
  }
}

