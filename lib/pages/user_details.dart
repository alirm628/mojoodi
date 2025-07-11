import 'package:flutter/material.dart';
import 'package:mojoodi/pages/access.dart';
import 'package:mojoodi/pages/manage_users.dart';
import 'package:mojoodi/utils/dimensions.dart';
import 'package:http/http.dart' as http;

import '../utils/user.dart';

class UserDetails extends StatefulWidget {
  static User touchedUser = User(0, "", "", "");
  static List accessList = touchedUser.access.split("|");
  const UserDetails({super.key});

  @override
  State<UserDetails> createState() => _UserDetailsState();
}

class _UserDetailsState extends State<UserDetails> {
  TextEditingController pass = TextEditingController();
  TextEditingController name = TextEditingController();
  User touchedUser = UserDetails.touchedUser;
  String access = UserDetails.touchedUser.access;

  Map<String, Color> accessButtonsColor = {
    "view":
        UserDetails.accessList.contains("view") ? Colors.green : Colors.grey,
    "edit name": UserDetails.accessList.contains("edit name")
        ? Colors.green
        : Colors.grey,
    "edit code": UserDetails.accessList.contains("edit code")
        ? Colors.green
        : Colors.grey,
    "edit amount": UserDetails.accessList.contains("edit amount")
        ? Colors.green
        : Colors.grey,
    "add": UserDetails.accessList.contains("add") ? Colors.green : Colors.grey,
    "delete":
        UserDetails.accessList.contains("add") ? Colors.green : Colors.grey,
  };

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    pass.text = touchedUser.pass;
    name.text = touchedUser.user_name;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        centerTitle: true,
        title: TextField(
          controller: name,
        ),
      ),
      body: Column(
        children: [
          SizedBox(height: Dimensions.phsize(8)),
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
          SizedBox(height: Dimensions.phsize(10)),
          Padding(
            padding: EdgeInsets.only(
                left: Dimensions.wsize(10),
                right: Dimensions.wsize(10),
                top: Dimensions.hsize(50),
                bottom: Dimensions.hsize(50)),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Card(
                      elevation: 10,
                      shape: RoundedRectangleBorder(
                          borderRadius:
                              BorderRadius.circular(Dimensions.hsize(15))),
                      child: InkWell(
                        borderRadius:
                            BorderRadius.circular(Dimensions.hsize(15)),
                        onTap: () async {
                          AccessList.category = "nakh";
                          AccessList.pass = pass.text;
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => const AccessList()));
                          debugPrint("nakh tapped");
                        },
                        child: Container(
                          height: Dimensions.hsize(200),
                          decoration: BoxDecoration(
                            borderRadius:
                                BorderRadius.circular(Dimensions.hsize(15)),
                          ),
                          child: Column(
                            children: [
                              SizedBox(height: Dimensions.hsize(5)),
                              Container(
                                height: Dimensions.hsize(140),
                                width: Dimensions.wsize(170),
                                decoration: const BoxDecoration(
                                  image: DecorationImage(
                                      image: AssetImage(
                                          "assets/images/thread.png"),
                                      fit: BoxFit.contain),
                                ),
                              ),
                              SizedBox(height: Dimensions.hsize(15)),
                              Text(
                                "نخ",
                                style:
                                    TextStyle(fontSize: Dimensions.hsize(18)),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Card(
                      elevation: 10,
                      shape: RoundedRectangleBorder(
                          borderRadius:
                              BorderRadius.circular(Dimensions.hsize(15))),
                      child: InkWell(
                        borderRadius:
                            BorderRadius.circular(Dimensions.hsize(15)),
                        onTap: () async {
                          AccessList.category = "socks";
                          AccessList.pass = pass.text;
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => const AccessList()));
                          debugPrint("sport tapped");
                        },
                        child: Container(
                          height: Dimensions.hsize(200),
                          decoration: BoxDecoration(
                            borderRadius:
                                BorderRadius.circular(Dimensions.hsize(15)),
                          ),
                          child: Column(
                            children: [
                              SizedBox(height: Dimensions.hsize(5)),
                              Container(
                                height: Dimensions.hsize(140),
                                width: Dimensions.wsize(170),
                                decoration: const BoxDecoration(
                                  image: DecorationImage(
                                      image:
                                          AssetImage("assets/images/socks.png"),
                                      fit: BoxFit.contain),
                                ),
                              ),
                              SizedBox(height: Dimensions.hsize(15)),
                              Text(
                                "جوراب",
                                style:
                                    TextStyle(fontSize: Dimensions.hsize(18)),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          SizedBox(height: Dimensions.phsize(20)),
          ElevatedButton(onPressed: save, child: const Text("ذخیره"))
        ],
      ),
    );
  }

  Future save() async {
    final response = await http
        .post(Uri.parse("https://alirm.ir/mojoodi/updateUsers.php"), body: {
      "id": touchedUser.id.toString(),
      "user_name": name.text,
      "pass": pass.text,
      "accessibility": access,
    });
    Navigator.of(context).pop();
    Navigator.of(context).pop();
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => const ManageUsers()));
  }
}
