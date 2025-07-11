import 'package:flutter/material.dart';
import 'package:mojoodi/pages/manage_users.dart';
import 'package:mojoodi/pages/user_details.dart';
import 'package:http/http.dart' as http;

import '../utils/dimensions.dart';

class AccessList extends StatefulWidget {
  static String category = "";
  static String pass = "";
  const AccessList({super.key});

  @override
  State<AccessList> createState() => _AccessListState();
}

class _AccessListState extends State<AccessList> {
  String access = UserDetails.touchedUser.access;
  bool view = false;
  int greenCounter = 0;
  List<String> accessList = [
    "view name",
    "view code",
    "view amount",
    "edit name",
    "edit code",
    "edit amount",
    "add",
    "delete",
    "filter"
  ];
  Map<String, Color> accessButtonsColor = {};
  /*{
    "view name": UserDetails.touchedUser.access
            .split("|")
            .contains("view name ${AccessList.category}")
        ? Colors.green
        : Colors.grey,
    "view code": UserDetails.touchedUser.access
            .split("|")
            .contains("view code ${AccessList.category}")
        ? Colors.green
        : Colors.grey,
    "view amount": UserDetails.touchedUser.access
            .split("|")
            .contains("view amount ${AccessList.category}")
        ? Colors.green
        : Colors.grey,
    "edit name": UserDetails.touchedUser.access
            .split("|")
            .contains("edit name ${AccessList.category}")
        ? Colors.green
        : Colors.grey,
    "edit code": UserDetails.touchedUser.access
            .split("|")
            .contains("edit code ${AccessList.category}")
        ? Colors.green
        : Colors.grey,
    "edit amount": UserDetails.touchedUser.access
            .split("|")
            .contains("edit amount ${AccessList.category}")
        ? Colors.green
        : Colors.grey,
    "add": UserDetails.touchedUser.access
            .split("|")
            .contains("add ${AccessList.category}")
        ? Colors.green
        : Colors.grey,
    "delete": UserDetails.touchedUser.access
            .split("|")
            .contains("delete ${AccessList.category}")
        ? Colors.green
        : Colors.grey,
  };*/

  @override
  Widget build(BuildContext context) {
    greenCounter = 0;
    for (var acss in accessList) {
      accessButtonsColor[acss] = checkAccess("$acss ${AccessList.category}");
    }
    debugPrint("counter $greenCounter");
    //debugPrint(accessButtonsColor.toString());
    // print(UserDetails.touchedUser.access.split("|"));
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: AccessList.category == "nakh"
            ? const Text("مدیریت دسترسی های بخش نخ")
            : const Text("مدیریت دسترسی های بخش جوراب"),
      ),
      body: Column(
        children: [
          SizedBox(height: Dimensions.phsize(7)),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              ElevatedButton(
                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(
                        accessButtonsColor["view code"])),
                onPressed: () {
                  setState(() {
                    if (accessButtonsColor["view code"] == Colors.grey) {
                      accessButtonsColor["view code"] = Colors.green;
                      access = "${access}view code ${AccessList.category}|";
                    } else {
                      accessButtonsColor["view code"] = Colors.grey;
                      access = access.replaceAll(
                          'view code ${AccessList.category}|', '');
                      debugPrint("counter decreased");
                      greenCounter--;
                    }
                    debugPrint(access);
                  });
                },
                child: const Center(child: Text("دیدن ستون کد")),
              ),
              ElevatedButton(
                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(
                        accessButtonsColor["view amount"])),
                onPressed: () {
                  setState(() {
                    if (accessButtonsColor["view amount"] == Colors.grey) {
                      accessButtonsColor["view amount"] = Colors.green;
                      access = "${access}view amount ${AccessList.category}|";
                    } else {
                      accessButtonsColor["view amount"] = Colors.grey;
                      access = access.replaceAll(
                          'view amount ${AccessList.category}|', '');
                      debugPrint("counter decreased");
                      greenCounter--;
                    }
                    debugPrint(access);
                  });
                },
                child: const Center(child: Text("دیدن ستون موجودی")),
              ),
            ],
          ),
          SizedBox(height: Dimensions.phsize(7)),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              ElevatedButton(
                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(
                        accessButtonsColor["view name"])),
                onPressed: () {
                  setState(() {
                    if (accessButtonsColor["view name"] == Colors.grey) {
                      accessButtonsColor["view name"] = Colors.green;
                      access = "${access}view name ${AccessList.category}|";
                    } else {
                      accessButtonsColor["view name"] = Colors.grey;
                      access = access.replaceAll(
                          'view name ${AccessList.category}|', '');
                      debugPrint("counter decreased");
                      greenCounter--;
                    }
                    debugPrint(access);
                  });
                },
                child: const Center(child: Text("دیدن ستون نام")),
              ),
              ElevatedButton(
                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(
                        accessButtonsColor["edit name"])),
                onPressed: () {
                  setState(() {
                    if (accessButtonsColor["edit name"] == Colors.grey) {
                      accessButtonsColor["edit name"] = Colors.green;
                      access = "${access}edit name ${AccessList.category}|";
                    } else {
                      accessButtonsColor["edit name"] = Colors.grey;
                      access = access.replaceAll(
                          'edit name ${AccessList.category}|', '');
                      debugPrint("counter decreased");
                      greenCounter--;
                    }
                    debugPrint(access);
                  });
                },
                child: const Center(child: Text("تغییر نام کالا")),
              ),
            ],
          ),
          SizedBox(height: Dimensions.phsize(7)),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              ElevatedButton(
                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(
                        accessButtonsColor["edit code"])),
                onPressed: () {
                  setState(() {
                    if (accessButtonsColor["edit code"] == Colors.grey) {
                      accessButtonsColor["edit code"] = Colors.green;
                      access = "${access}edit code ${AccessList.category}|";
                    } else {
                      accessButtonsColor["edit code"] = Colors.grey;
                      access = access.replaceAll(
                          'edit code ${AccessList.category}|', '');
                      debugPrint("counter decreased");
                      greenCounter--;
                    }
                    debugPrint(access);
                  });
                },
                child: const Center(child: Text("تغییر کد کالا")),
              ),
              ElevatedButton(
                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(
                        accessButtonsColor["edit amount"])),
                onPressed: () {
                  setState(() {
                    if (accessButtonsColor["edit amount"] == Colors.grey) {
                      accessButtonsColor["edit amount"] = Colors.green;
                      access = "${access}edit amount ${AccessList.category}|";
                    } else {
                      accessButtonsColor["edit amount"] = Colors.grey;
                      access = access.replaceAll(
                          'edit amount ${AccessList.category}|', '');
                      debugPrint("counter decreased");
                      greenCounter--;
                    }
                    debugPrint(access);
                  });
                },
                child: const Center(child: Text("تغییر موجودی")),
              ),
            ],
          ),
          SizedBox(height: Dimensions.phsize(7)),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              ElevatedButton(
                style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all(accessButtonsColor["add"])),
                onPressed: () {
                  setState(() {
                    if (accessButtonsColor["add"] == Colors.grey) {
                      accessButtonsColor["add"] = Colors.green;
                      access = "${access}add ${AccessList.category}|";
                    } else {
                      accessButtonsColor["add"] = Colors.grey;
                      access =
                          access.replaceAll('add ${AccessList.category}|', '');
                      debugPrint("counter decreased");
                      greenCounter--;
                    }
                    debugPrint(access);
                  });
                },
                child: const Center(child: Text("افزودن کالا")),
              ),
              ElevatedButton(
                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(
                        accessButtonsColor["delete"])),
                onPressed: () {
                  setState(() {
                    if (accessButtonsColor["delete"] == Colors.grey) {
                      accessButtonsColor["delete"] = Colors.green;
                      access = "${access}delete ${AccessList.category}|";
                    } else {
                      accessButtonsColor["delete"] = Colors.grey;
                      access = access.replaceAll(
                          'delete ${AccessList.category}|', '');
                      debugPrint("counter decreased");
                      greenCounter--;
                    }
                    debugPrint(access);
                  });
                },
                child: const Center(child: Text("حذف کالا")),
              ),
            ],
          ),
          SizedBox(height: Dimensions.phsize(7)),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              ElevatedButton(
                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(
                        accessButtonsColor["filter"])),
                onPressed: () {
                  setState(() {
                    if (accessButtonsColor["filter"] == Colors.grey) {
                      accessButtonsColor["filter"] = Colors.green;
                      access = "${access}filter ${AccessList.category}|";
                    } else {
                      accessButtonsColor["filter"] = Colors.grey;
                      access = access.replaceAll(
                          'filter ${AccessList.category}|', '');
                      debugPrint("counter decreased");
                      greenCounter--;
                    }
                    debugPrint(access);
                  });
                },
                child: const Center(child: Text("فیلتر")),
              ),
            ],
          ),
          SizedBox(height: Dimensions.phsize(14)),
          ElevatedButton(onPressed: save, child: const Text("ذخیره"))
        ],
      ),
    );
  }

  Future save() async {
    debugPrint("green counter : $greenCounter");
    // if (access.contains(AccessList.category) &&
    //     !access.contains("view " + AccessList.category)) {
    //   access = access + "view ${AccessList.category}|";
    // } else if (access.contains(AccessList.category) &&
    //     access.contains("view " + AccessList.category + "|")) {
    //   access = access.replaceAll("view " + AccessList.category + "|", '');
    // }
    if (greenCounter != 0) {
      access = "${access}view ${AccessList.category}|";
    } else {
      access = access.replaceAll("view ${AccessList.category}|", '');
    }
    debugPrint("====================\n$access\n=================");
    final response = await http
        .post(Uri.parse("https://alirm.ir/mojoodi/updateUsers.php"), body: {
      "id": UserDetails.touchedUser.id.toString(),
      "user_name": UserDetails.touchedUser.user_name,
      "pass": AccessList.pass,
      "accessibility": access,
    });
    Navigator.of(context).pop();
    Navigator.of(context).pop();
    Navigator.of(context).pop();
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => const ManageUsers()));
  }

  Color checkAccess(String neededAccessibility) {
    List<String> splitedNeededAccessibility = neededAccessibility.split("|");
    for (var accessibility in splitedNeededAccessibility) {
      if (access.contains(accessibility) || access.contains("admin")) {
        greenCounter++;

        return Colors.green;
      }
    }

    return Colors.grey;
  }
}
