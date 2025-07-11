import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import '../utils/dimensions.dart';
import 'manage_users.dart';

class AddUser extends StatefulWidget {
  const AddUser({super.key});

  @override
  State<AddUser> createState() => _AddUserState();
}

class _AddUserState extends State<AddUser> {
  bool second = false;
  TextEditingController pass = TextEditingController();
  TextEditingController user_name = TextEditingController();
  String access = "";

  Map<String, Color> accessButtonsColor = {
    "view": Colors.grey,
    "edit name": Colors.grey,
    "edit code": Colors.grey,
    "edit amount": Colors.grey,
    "add": Colors.grey,
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        centerTitle: true,
        title: const Text("افزودن کاربر"),
      ),
      body: Column(
        children: [
          SizedBox(height: Dimensions.phsize(5)),
          Padding(
            padding: EdgeInsets.only(
                left: Dimensions.pwsize(5), right: Dimensions.pwsize(5)),
            child: Row(
              children: [
                SizedBox(
                  width: Dimensions.pwsize(68),
                  child: TextField(
                    controller: user_name,
                  ),
                ),
                SizedBox(width: Dimensions.pwsize(4)),
                const Text(": نام کاربری  "),
              ],
            ),
          ),
          SizedBox(height: Dimensions.phsize(4)),
          Padding(
            padding: EdgeInsets.only(
                left: Dimensions.pwsize(5), right: Dimensions.pwsize(5)),
            child: Row(
              children: [
                SizedBox(
                  width: Dimensions.pwsize(70),
                  child: TextField(
                    controller: pass,
                  ),
                ),
                SizedBox(width: Dimensions.pwsize(4)),
                const Text(": رمز عبور "),
              ],
            ),
          ),
          SizedBox(height: Dimensions.phsize(7)),
          SizedBox(height: Dimensions.phsize(7)),
          // Row(
          //   mainAxisAlignment: MainAxisAlignment.spaceAround,
          //   children: [
          //     Card(
          //       elevation: 10,
          //       shape: RoundedRectangleBorder(
          //           borderRadius: BorderRadius.circular(Dimensions.hsize(15))),
          //       child: InkWell(
          //         borderRadius: BorderRadius.circular(Dimensions.hsize(15)),
          //         onTap: () async {
          //           // AccessList.category = "nakh";
          //           // AccessList.pass = pass.text;
          //           // Navigator.of(context).push(
          //           //     MaterialPageRoute(builder: (context) => AccessList()));
          //           debugPrint("nakh tapped");
          //         },
          //         child: Container(
          //           height: Dimensions.hsize(200),
          //           decoration: BoxDecoration(
          //             borderRadius: BorderRadius.circular(Dimensions.hsize(15)),
          //           ),
          //           child: Column(
          //             children: [
          //               SizedBox(height: Dimensions.hsize(5)),
          //               Container(
          //                 height: Dimensions.hsize(140),
          //                 width: Dimensions.wsize(170),
          //                 decoration: const BoxDecoration(
          //                   image: DecorationImage(
          //                       image: AssetImage("assets/images/thread.png"),
          //                       fit: BoxFit.contain),
          //                 ),
          //               ),
          //               SizedBox(height: Dimensions.hsize(15)),
          //               Text(
          //                 "نخ",
          //                 style: TextStyle(fontSize: Dimensions.hsize(18)),
          //               ),
          //             ],
          //           ),
          //         ),
          //       ),
          //     ),
          //     Card(
          //       elevation: 10,
          //       shape: RoundedRectangleBorder(
          //           borderRadius: BorderRadius.circular(Dimensions.hsize(15))),
          //       child: InkWell(
          //         borderRadius: BorderRadius.circular(Dimensions.hsize(15)),
          //         onTap: () async {
          //           // AccessList.category = "socks";
          //           // AccessList.pass = pass.text;
          //           // Navigator.of(context).push(
          //           //     MaterialPageRoute(builder: (context) => AccessList()));
          //           debugPrint("sport tapped");
          //         },
          //         child: Container(
          //           height: Dimensions.hsize(200),
          //           decoration: BoxDecoration(
          //             borderRadius: BorderRadius.circular(Dimensions.hsize(15)),
          //           ),
          //           child: Column(
          //             children: [
          //               SizedBox(height: Dimensions.hsize(5)),
          //               Container(
          //                 height: Dimensions.hsize(140),
          //                 width: Dimensions.wsize(170),
          //                 decoration: const BoxDecoration(
          //                   image: DecorationImage(
          //                       image: AssetImage("assets/images/socks.png"),
          //                       fit: BoxFit.contain),
          //                 ),
          //               ),
          //               SizedBox(height: Dimensions.hsize(15)),
          //               Text(
          //                 "جوراب",
          //                 style: TextStyle(fontSize: Dimensions.hsize(18)),
          //               ),
          //             ],
          //           ),
          //         ),
          //       ),
          //     ),
          //   ],
          // ),

          SizedBox(height: Dimensions.phsize(7)),

          SizedBox(height: Dimensions.phsize(15)),
          ElevatedButton(onPressed: save, child: const Text("ذخیره"))
        ],
      ),
    );
  }

  Future save() async {
    //if (access != "") {
    if (user_name.text.isNotEmpty && pass.text.isNotEmpty) {
      final response = await http.post(
          Uri.parse("https://alirm.ir/mojoodi/insertdatausers.php"),
          body: {
            "user_name": user_name.text,
            "pass": pass.text,
            "accessibility": access,
          });
      Navigator.of(context).pop();
      Navigator.of(context).pop();
      Navigator.of(context)
          .push(MaterialPageRoute(builder: (context) => const ManageUsers()));
    } else {
      Fluttertoast.showToast(msg: "فرم را کامل پر نکردید");
    }
    // } else {
    // if (second) {
    //   access = " ";
    //   save();
    // } else {
    //   Fluttertoast.showToast(
    //     toastLength: Toast.LENGTH_LONG,
    //     msg: """هیچ دسترسی به کاربر داده نشد
    //         برای ساخت کاربر بدون دسترسی دوباره دکمه ذخیره را فشار دهید""",
    //   );
    //   second = true;
    // }
    //}
  }
}
