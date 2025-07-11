import 'dart:convert';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:mojoodi/main.dart';
import 'package:mojoodi/pages/history.dart';
import 'package:mojoodi/pages/login.dart';
import 'package:mojoodi/pages/manage_users.dart';
import 'package:mojoodi/pages/socks.dart';
import 'package:mojoodi/pages/thread.dart';
import 'package:mojoodi/utils/dimensions.dart';
import 'package:mojoodi/utils/user_pref.dart';
import 'package:http/http.dart' as http;

import '../utils/user.dart';

class category extends StatefulWidget {
  const category({super.key});

  @override
  State<category> createState() => _categoryState();
}

class _categoryState extends State<category> {
  String access = MyApp.curruser!.access;
  bool loaded = false;
  @override
  void initState() {
    // TODO: implement initState
    //super.initState();
    checkAccStatus();
  }

  @override
  Widget build(BuildContext context) {
    while (!loaded) {
      return Scaffold(
        appBar: AppBar(
          title: const Text("هوربافت"),
          centerTitle: true,
        ),
        body: Center(
          child: LoadingAnimationWidget.discreteCircle(
            color: Colors.yellow,
            size: 200,
          ),
        ),
      );
    }
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.logout),
          onPressed: () {
            RememberUserPrefs.deleteUser();
            Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (context) => const Login()),
                (route) => false);
          },
        ),
        actions: [
          if (MyApp.curruser!.access == "admin")
            IconButton(
              icon: const Icon(Icons.history_rounded),
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const History(),
                    ));
              },
            ),
          if (MyApp.curruser!.access == "admin")
            IconButton(
              icon: const Icon(Icons.person),
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const ManageUsers(),
                    ));
              },
            ),
        ],
        centerTitle: true,
        title: const Text("هوربافت"),
      ),
      body: Padding(
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
                  color: checkAccess("view nakh")
                      ? Colors.white
                      : const Color.fromARGB(136, 186, 181, 181),
                  elevation: checkAccess("view nakh") ? 25 : 0,
                  shape: RoundedRectangleBorder(
                      borderRadius:
                          BorderRadius.circular(Dimensions.hsize(15))),
                  child: InkWell(
                    borderRadius: BorderRadius.circular(Dimensions.hsize(15)),
                    onTap: checkAccess("view nakh")
                        ? () async {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => const Thread()));
                            debugPrint("nakh tapped");
                          }
                        : null,
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
                                  image: AssetImage("assets/images/thread.png"),
                                  fit: BoxFit.contain),
                            ),
                          ),
                          SizedBox(height: Dimensions.hsize(15)),
                          Text(
                            "نخ",
                            style: TextStyle(fontSize: Dimensions.hsize(18)),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Card(
                  elevation: checkAccess("view socks") ? 25 : 0,
                  color: checkAccess("view socks")
                      ? Colors.white
                      : const Color.fromARGB(136, 186, 181, 181),
                  shape: RoundedRectangleBorder(
                      borderRadius:
                          BorderRadius.circular(Dimensions.hsize(15))),
                  child: InkWell(
                    borderRadius: BorderRadius.circular(Dimensions.hsize(15)),
                    onTap: checkAccess("view socks")
                        ? () async {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => const Socks()));
                            debugPrint("socks tapped");
                          }
                        : null,
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
                                  image: AssetImage("assets/images/socks.png"),
                                  fit: BoxFit.contain),
                            ),
                          ),
                          SizedBox(height: Dimensions.hsize(15)),
                          Text(
                            "جوراب",
                            style: TextStyle(fontSize: Dimensions.hsize(18)),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
            // Row(
            //   mainAxisAlignment: MainAxisAlignment.spaceAround,
            //   children: [
            //     Container(
            //       height: Dimensions.hsize(100),
            //       width: Dimensions.wsize(100),
            //       color: Colors.yellow,
            //     ),
            //     Container(
            //       height: Dimensions.hsize(100),
            //       width: Dimensions.wsize(100),
            //       color: Colors.green,
            //     ),
            //   ],
            // ),
          ],
        ),
      ),
    );
  }

  checkAccStatus() async {
    var res =
        await http.post(Uri.parse("https://alirm.ir/mojoodi/login.php"), body: {
      "user_name": MyApp.curruser!.user_name,
      "pass": MyApp.curruser!.pass,
    });
    if (res.statusCode == 200) {
      var resBody = jsonDecode(res.body);
      if (resBody['success'] == true) {
        print("login");

        print(resBody);

        User userInfo = User.fromJson(resBody["userData"]);

        MyApp.curruser = userInfo;

        await RememberUserPrefs.saveUser(userInfo);
        Fluttertoast.cancel();
        Fluttertoast.showToast(
            msg: "با موفقیت وارد شدید",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.green,
            textColor: Colors.white,
            fontSize: 16.0);

        // Navigator.pushAndRemoveUntil(
        //     context,
        //     MaterialPageRoute(builder: (context) => category()),
        //     (route) => false);
        //Navigator.pop(context);

      } else {
        print("failed");
        Fluttertoast.cancel();
        Fluttertoast.showToast(
            msg: "حساب کاربری شما حذف شده",
            toastLength: Toast.LENGTH_LONG,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.red,
            textColor: Colors.white,
            fontSize: 16.0);
        Navigator.pushAndRemoveUntil(context,
            MaterialPageRoute(builder: (context) => const Login()), (route) => false);
      }
    }
    setState(() {
      loaded = true;
      access = MyApp.curruser!.access;
    });
  }

  bool checkAccess(String neededAccessibility) {
    List<String> splitedNeededAccessibility = neededAccessibility.split("|");
    for (var accessibility in splitedNeededAccessibility) {
      if (access.contains(accessibility) || access.contains("admin")) {
        return true;
      }
    }

    return false;
  }
}
