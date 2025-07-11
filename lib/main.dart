import 'package:flutter/material.dart';
import 'package:mojoodi/pages/category.dart';
import 'package:mojoodi/pages/login.dart';
import 'package:get/get.dart';
import 'package:mojoodi/utils/user.dart';
import 'package:mojoodi/utils/user_pref.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  static User? curruser;

  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool set = false;

  setUser() async {
    MyApp.curruser = await RememberUserPrefs.getUser();
    setState(() {
      set = true;
    });
  }

  @override
  @override
  Widget build(BuildContext context) {
    debugPrint("wsrtghs");

    //print(MyApp.curruser!.user_name);
    if (!set) {
      setUser();
    }

    // print(_thisUser.user.user_name);

    // return GetBuilder(
    //   init: CurrUser(),
    //   initState: (currentState) {
    //     _thisUser.getUserInfo();
    //   },
    //   builder: (controller) {
    //     return Scaffold();
    //   },
    // );
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyApp.curruser != null ? const category() : const Login(),
    );
  }
}
