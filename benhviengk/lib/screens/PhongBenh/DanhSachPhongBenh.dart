import 'package:benhviengk/screens/PhongBenh/CustomBottomSheet.dart';
import 'package:benhviengk/screens/PhongBenh/edit_phong.dart';
import 'package:flutter/material.dart';
import '../../models/phongbenh.dart';
import 'package:confirm_dialog/confirm_dialog.dart';
class DanhSachPhongBenh extends StatefulWidget {
  @override
  State<DanhSachPhongBenh> createState() => _DanhSachPhongBenhState();
}

class _DanhSachPhongBenhState extends State<DanhSachPhongBenh> {

  // const ListRoom({super.key});
  final List<PhongBenh> danhSachPhongBenh = [
    PhongBenh(
      SoPhong: 1,
      Khoa: "Khoa nội",
      SoLuong: 6,
      TrangThai: "Còn trống",
    ),
    PhongBenh(
      SoPhong: 2,
      Khoa: "Khoa ngoại",
      SoLuong: 6,
      TrangThai: "Còn trống",
    ),
    PhongBenh(
      SoPhong: 3,
      Khoa: "Khoa thần kinh",
      SoLuong: 6,
      TrangThai: "Còn trống",
    ),
    PhongBenh(
      SoPhong: 4,
      Khoa: "Khoa tim mạch",
      SoLuong: 6,
      TrangThai: "Còn trống",
    ),
    PhongBenh(
      SoPhong: 5,
      Khoa: "Khoa điều trị",
      SoLuong: 6,
      TrangThai: "Còn trống",
    ),
    PhongBenh(
      SoPhong: 6,
      Khoa: "Khoa sản nhi",
      SoLuong: 6,
      TrangThai: "Còn trống",
    ),
  ];

  final soPhongController = TextEditingController();

  final khoaController = TextEditingController();

  final soLuongController = TextEditingController();

  final trangThaiController = TextEditingController();

   void handleAdd(int SoPhong, String Khoa, int SoLuong, String TrangThai) {
    final newPhongBenh = PhongBenh(SoPhong: SoPhong, Khoa: Khoa, SoLuong: SoLuong, TrangThai: TrangThai);
    setState(() {
      danhSachPhongBenh.add(newPhongBenh);
    });
  }
  void handleDelete(int soPhong){
    setState(() {
      danhSachPhongBenh.removeWhere((item) => item.SoPhong == soPhong);
    });
  }
  void _editPhong(BuildContext context, PhongBenh phong) {
    // Chuyển sang màn hình chỉnh sửa và đợi kết quả trả về
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => edit_phong(phong),
      ),
    ).then((editedPhong) {
      if (editedPhong != null) {
        // Nếu có thông tin nhân viên chỉnh sửa, cập nhật lại danh sách
        int index = danhSachPhongBenh.indexOf(phong);
        setState(() {
          danhSachPhongBenh[index] = editedPhong;
        });
      }
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Danh sách Phòng Bệnh',
          style: TextStyle(
            color: Colors.black,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Colors.white,
        centerTitle: true,
      ),
      body: NestedScrollView(
        headerSliverBuilder: (context, innerBoxIsScrolled) {
          return [
            SliverToBoxAdapter(
              child: SizedBox(height: 20), // Khoảng cách giữa Appbar và danh sách
            ),
          ];
        },
        body: ListView.builder(
          itemCount: danhSachPhongBenh.length,
          itemBuilder: (BuildContext context, int index) {
            var pb = danhSachPhongBenh[index];

            return Container(
              margin: EdgeInsets.only(bottom: 20),
              decoration: BoxDecoration(
                color: Colors.white54,
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black12,
                    blurRadius: 6,
                    spreadRadius: 4,
                  ),
                ],
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: Stack(
                  alignment: Alignment.centerRight,
                  children: <Widget>[
                    Column(
                      children: <Widget>[
                        Row(
                          children: <Widget>[
                            Container(
                              margin: EdgeInsets.symmetric(
                                vertical: 10,
                                horizontal: 25,
                              ),
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: Color.fromRGBO(112, 109, 219, 2),
                                  width: 3,
                                ),
                              ),
                              padding: EdgeInsets.all(15),
                              child: Text(
                                pb.SoPhong.toString(),
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 25,
                                  color: Color.fromRGBO(112, 109, 219, 2),
                                ),
                              ),
                            ),

                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(height: 15),
                                Text(
                                  pb.Khoa.toString(),
                                  style: TextStyle(
                                    fontSize: 25,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                SizedBox(height: 5),
                                Text(
                                  'Số lượng người: ' + pb.SoLuong.toString(),
                                  style: TextStyle(
                                      fontSize: 18
                                  ),
                                ),
                                Text(
                                  'Trạng thái: ' + pb.TrangThai,
                                  style: TextStyle(
                                      fontSize: 18
                                  ),
                                ),
                                SizedBox(height: 15),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        IconButton(
                          icon: Icon(Icons.edit_outlined),
                          onPressed: () {
                            _editPhong(context,pb);
                          },
                        ),
                        SizedBox(width: 0),
                        InkWell(
                          child: IconButton(
                            icon: Icon(
                              Icons.delete_outline,
                              color: Colors.red,
                            ),
                            onPressed: () async {
                              if (await confirm(context)) {
                              handleDelete(pb.SoPhong);
                              }
                              return print('pressedCancel');
                            },
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          showModalBottomSheet(
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.vertical(top: Radius.circular(20))),
              isScrollControlled: true ,
              context: context,
              builder: (BuildContext context ){
                return CustomBottomSheet(addTask : handleAdd);
            },
          );
        },
        backgroundColor: Color.fromRGBO(112, 109, 219, 2),
         child: Icon(Icons.add, size: 45, color: Colors.white),
      ),
    );
  }
}