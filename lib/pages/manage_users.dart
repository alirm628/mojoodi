import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:mojoodi/pages/add_user.dart';
import 'package:mojoodi/pages/user_details.dart';
import 'package:mojoodi/utils/dimensions.dart';
import 'package:mojoodi/utils/user.dart';


class ManageUsers extends StatefulWidget {
  const ManageUsers({super.key});

  @override
  State<ManageUsers> createState() => _ManageUsersState();
}

class _ManageUsersState extends State<ManageUsers> {
  bool loaded = false;
  List<User> users = [];
  List<User> dontouchusers = [];

  @override
  void initState() {
    getData();
  }

  @override
  Widget build(BuildContext context) {
    while (!loaded) {
      return Scaffold(
        appBar: AppBar(
          title: const Text("مدیریت کابر ها"),
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
        centerTitle: true,
        title: const Text("مدیریت کاربر ها"),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const AddUser()));
              },
              icon: const Icon(Icons.add))
        ],
      ),
      body: ListView(
        children: List.generate(users.length, (index) {
          return Padding(
            padding: EdgeInsets.only(
              top: index == 0 ? Dimensions.phsize(3) : Dimensions.phsize(1),
              bottom: Dimensions.phsize(1),
              left: Dimensions.pwsize(2.5),
              right: Dimensions.pwsize(2.5),
            ),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(Dimensions.hsize(25)),
                color: Colors.grey[300],
              ),
              height: Dimensions.phsize(10),
              child: InkWell(
                //splashColor: Colors.red,
                onTap: () {
                  UserDetails.touchedUser = users[index];
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const UserDetails(),
                      ));
                },
                child: Center(
                  child: Text(
                    users[index].user_name,
                    style: TextStyle(fontSize: Dimensions.font20),
                  ),
                ),
              ),
            ),
          );
        }),
      ),
    );
  }

  Future getData() async {
    var url = 'https://alirm.ir/mojoodi/getDataUsers.php';
    http.Response response = await http.get(Uri.parse(url));
    var data = jsonDecode(response.body) as List;
    data.removeAt(0);
    for (var prod in data) {
      debugPrint(prod.toString());
      var p = User(
        int.parse(prod['id']),
        prod['user_name'],
        prod['pass'],
        prod['accessibility'],
      );
      users.add(p);
    }
    setState(() {
      loaded = true;
      dontouchusers = users;
    });
  }
}
