import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:mojoodi/utils/dimensions.dart';
import 'package:mojoodi/utils/user.dart';
import 'package:shamsi_date/shamsi_date.dart';

class History extends StatefulWidget {
  const History({super.key});

  @override
  State<History> createState() => _HistoryState();
}

class _HistoryState extends State<History> {
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
          title: const Text("سابقه تغییرات"),
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
        title: const Text("سابقه تغییرات"),
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
                borderRadius: BorderRadius.circular(Dimensions.hsize(0)),
                color: Colors.grey[200],
              ),
              height: Dimensions.phsize(12),
              child: Column(
                children: [
                  SizedBox(height: Dimensions.phsize(1)),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text(
                        users[index].user_name,
                        style: TextStyle(fontSize: Dimensions.hsize(16)),
                      ),
                      Text(
                        users[index].access,
                        style: TextStyle(fontSize: Dimensions.hsize(16)),
                      ),
                    ],
                  ),
                  Expanded(
                    child: Align(
                      alignment: Alignment.bottomCenter,
                      child: Padding(
                        padding: EdgeInsets.only(bottom: Dimensions.phsize(1)),
                        child: Text(
                          users[index].pass,
                          style: TextStyle(fontSize: Dimensions.hsize(14)),
                          textDirection: TextDirection.rtl,
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        }),
      ),
    );
  }

  Future getData() async {
    var url = 'https://alirm.ir/mojoodi/getDataHistory.php';
    http.Response response = await http.get(Uri.parse(url));
    var data = jsonDecode(response.body) as List;
    for (var prod in data) {
      //debugPrint(prod.toString());
      var p = User(
        int.parse(prod['id']),
        prod['user_name'],
        prod['action'],
        format(DateTime.parse(prod['date']).toJalali()),
      );
      users.add(p);
    }
    debugPrint("date is${users[0].access}r");
    setState(() {
      loaded = true;
      dontouchusers = users;
    });
  }

  String format(Date d) {
    final f = d.formatter;

    return "${f.wN}  ${f.yyyy}/${f.mm}/${f.dd}  ${d.hour}:${d.minute}:${d.second}";
  }
}
