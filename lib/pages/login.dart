import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:mojoodi/main.dart';
import 'package:mojoodi/pages/category.dart';
import 'package:mojoodi/utils/dimensions.dart';
import 'package:http/http.dart' as http;
import 'package:mojoodi/utils/user.dart';
import 'package:mojoodi/utils/user_pref.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController userName = TextEditingController();
  TextEditingController pass = TextEditingController();
  bool buttonenable = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: const Text("صفحه ورود"),
        centerTitle: true,
      ),
      body: Column(
        children: [
          SizedBox(height: Dimensions.phsize(20)),
          Padding(
            padding: EdgeInsets.only(
                left: Dimensions.pwsize(5), right: Dimensions.pwsize(5)),
            child: SizedBox(
                width: Dimensions.pwsize(90),
                child: TextField(
                    textInputAction: TextInputAction.next,
                    onChanged: (value) {
                      setState(() {});
                    },
                    controller: userName,
                    textDirection: TextDirection.ltr,
                    decoration: const InputDecoration(
                        hintText: "   نام کاربری",
                        hintTextDirection: TextDirection.ltr))),
          ),
          SizedBox(height: Dimensions.phsize(10)),
          Padding(
            padding: EdgeInsets.only(
                left: Dimensions.pwsize(5), right: Dimensions.pwsize(5)),
            child: SizedBox(
                width: Dimensions.pwsize(90),
                child: TextField(
                    onChanged: (value) {
                      setState(() {});
                    },
                    controller: pass,
                    textDirection: TextDirection.ltr,
                    decoration: const InputDecoration(
                        hintText: "   رمز ",
                        hintTextDirection: TextDirection.ltr))),
          ),
          SizedBox(height: Dimensions.phsize(30)),
          ElevatedButton(
            onPressed: userName.text != "" && pass.text != "" ? login : null,
            child: const Text("ورود"),
          )
        ],
      ),
    );
  }

  login() async {
    Fluttertoast.showToast(
        msg: "در حال بررسی اطلاعات",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.grey,
        textColor: Colors.white,
        fontSize: 16.0);
    var res =
        await http.post(Uri.parse("https://alirm.ir/mojoodi/login.php"), body: {
      "user_name": userName.text.trim(),
      "pass": pass.text.trim(),
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

        setState(() {
          userName.clear();
          pass.clear();
        });

        //Navigator.pop(context);
        Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (context) => const category()),
            (route) => false);
      } else {
        print("failed");
        Fluttertoast.cancel();
        Fluttertoast.showToast(
            msg: "اطلاعات وارد شده صحیح نمی باشد",
            toastLength: Toast.LENGTH_LONG,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.red,
            textColor: Colors.white,
            fontSize: 16.0);
      }
    }
  }
}
