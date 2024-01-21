import 'package:benhviengk/models/benhnhan.dart';
import 'package:benhviengk/screens/BenhNhan/nhapvien_benhnhan.dart';
import 'package:benhviengk/screens/BenhNhan/formthem_benhnhan.dart';
import 'package:benhviengk/screens/BenhNhan/xuatvien.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:benhviengk/screens/BenhNhan/danhsach_benhnhan.dart';
class DSBenhNhan extends StatefulWidget {
  @override
  State<DSBenhNhan> createState() => _DSBenhNhanState();
}

class _DSBenhNhanState extends State<DSBenhNhan> {
  final List<BenhNhan> danhSachBenhNhan = [
    BenhNhan(
      ma: 001, 
      hoVaTen: "Bùi Quốc Việt", 
      ngaySinh: DateTime(2003,11,1),
      soPhong: 001, 
      Khoa: "Khoa Mắt", 
      BenhAn: "Cận thị",
      TrangThai: "Nhập viện",
    ),
    BenhNhan(
      ma: 002, 
      hoVaTen: "Nguyễn Đức Anh Tuấn", 
      ngaySinh: DateTime(2003,11,1), 
      soPhong: 001, 
      Khoa: "Khoa Mắt", 
      BenhAn: "Cận thị",
      TrangThai: "Nhập viện",
    ),
    BenhNhan(
      ma: 003, 
      hoVaTen: "Nguyễn Đức Anh", 
      ngaySinh: DateTime(2003,11,1), 
      soPhong: 001, 
      Khoa: "Khoa Mắt", 
      BenhAn: "Cận thị",
      TrangThai: "Nhập viện",
    ),
    BenhNhan(
      ma: 4,
      hoVaTen: "Nguyễn Đức Anh Tuấn",
      ngaySinh: DateTime(2003,11,1),
      soPhong: 001,
      Khoa: "Khoa Mắt",
      BenhAn: "Cận thị",
      TrangThai: "Nhập viện",
    ),
    BenhNhan(
      ma: 4,
      hoVaTen: "Nguyễn Đức Anh T",
      ngaySinh: DateTime(2003,11,1),
      soPhong: 001,
      Khoa: "Khoa Mắt",
      BenhAn: "Cận thị",
      TrangThai: "Xuất viện",
    ),
    BenhNhan(
      ma: 4,
      hoVaTen: "Nguyễn T",
      ngaySinh: DateTime(2003,11,1),
      soPhong: 001,
      Khoa: "Khoa Mắt",
      BenhAn: "Cận thị",
      TrangThai: "Xuất viện",
    ),


  ];
  AddBenhNhan(int ma, String hoVaTen, DateTime ngaySinh, int soPhong, String Khoa, String BenhAn, String TrangThai){
    final newBenhNhan = BenhNhan(
      ma: ma,
      hoVaTen:hoVaTen,
      ngaySinh:ngaySinh,
      soPhong:soPhong,
      Khoa:Khoa,
      BenhAn:BenhAn,
      TrangThai:TrangThai,
    );
    setState(() {
      danhSachBenhNhan.add(newBenhNhan);
    }
    );
  }
  void deleteBenhNhan(int index) {
    setState(() {
      danhSachBenhNhan.removeAt(index);
    });
  }

  FormModelAddbenhnhan(BuildContext context){
    showModalBottomSheet(context: context,
      builder:(_){
        return GestureDetector(
          onTap: (){},
          child:  FormThemBenhNhan(AddBenhNhan),
          behavior: HitTestBehavior.opaque,
        );
      },
    );
  }

  int _buttonIndex = 0;
  Widget getBodyWidget (int currentIndex) {
    if (currentIndex == 0) {
      return SingleChildScrollView(
        child: Column(
          children: [
            danhsach(danhSachBenhNhan, onDelete: deleteBenhNhan)
          ],
        ),
      );
    }
    else if (currentIndex == 1){
      return SingleChildScrollView(
        child: Column(
          children: [
            danhsach_nhapvien(danhSachBenhNhan, onDelete: deleteBenhNhan)
          ],
        ),
      );
    }
      else if (currentIndex == 2){
      return SingleChildScrollView(
        child: Column(
          children: [
            danhsach_xuatvien(danhSachBenhNhan, onDelete: deleteBenhNhan)
          ],
        ),
      );
      }
    return Container();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 50),
          child: Text(
            "Danh sách Bệnh Nhân",
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Color.fromARGB(255, 0, 0, 0),
            ),
          ),
        ),
      ),
      body:SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric( horizontal: 5),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 20,),
              Container(
                padding: EdgeInsets.all(5),
                margin: EdgeInsets.symmetric(),
                decoration: BoxDecoration(
                  color: Color(0xFFF4F6FA),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    InkWell(
                      onTap: () {
                        setState(() {
                          _buttonIndex = 0;
                        });
                      },
                      child: Container(
                        padding: EdgeInsets.symmetric(
                          vertical: 12,
                          horizontal: 25,
                        ),
                        decoration: BoxDecoration(
                          color: _buttonIndex == 0 ? Color(0xff7165d6) : Colors.transparent,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Text(
                          "Thông tin chung",
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            color: _buttonIndex == 0 ? Colors.white : Colors.black38,
                          ),
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        setState(() {
                          _buttonIndex = 1;
                        });
                      },
                      child: Container(
                        padding: EdgeInsets.symmetric(
                          vertical: 12,
                          horizontal: 25,
                        ),
                        decoration: BoxDecoration(
                          color: _buttonIndex == 1 ? Color(0xff7165d6) : Colors.transparent,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Text(
                          "Nhập viện",
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            color: _buttonIndex == 1 ? Colors.white : Colors.black38,
                          ),
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        setState(() {
                          _buttonIndex = 2;
                        });
                      },
                      child: Container(
                        padding: EdgeInsets.symmetric(
                          vertical: 12,
                          horizontal: 25,
                        ),
                        decoration: BoxDecoration(
                          color: _buttonIndex == 2 ? Color(0xff7165d6) : Colors.transparent,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Text(
                          "Xuất viện",
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            color: _buttonIndex == 2 ? Colors.white : Colors.black38,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 30),
              getBodyWidget(_buttonIndex),
            ],
          ),
        ),
      ) ,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
            FormModelAddbenhnhan(context);
            print(danhSachBenhNhan.length);
        },
        child:Icon(Icons.add) ,
        ),
    );
  }
}



