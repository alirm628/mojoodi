import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:mojoodi/main.dart';
import 'package:mojoodi/utils/dimensions.dart';
import 'package:mojoodi/utils/modelbuilder.dart';
import 'package:mojoodi/utils/product.dart';
import 'package:mojoodi/widget/search_widget.dart';

import '../widget/text_dialog.dart';

class Thread extends StatefulWidget {
  static bool updated = false;

  const Thread({super.key});

  @override
  State<Thread> createState() => _ThreadState();
}

class _ThreadState extends State<Thread> {
  List<String> access = MyApp.curruser!.access.split("|");
  final _search = TextEditingController();
  String query = "";
  IconData ico = Icons.add;
  TextEditingController name = TextEditingController();
  TextEditingController code = TextEditingController();
  TextEditingController amount = TextEditingController();
  int count = 0;
  bool loaded = false;
  bool show = false;
  List<product> prods = [];
  List<product> dontouchprods = [];
  int MIN = 15;
  double searchWidth = 100;
  TextEditingController filter = TextEditingController();
  @override
  void initState() {
    getData();
  }

  @override
  Widget build(BuildContext context) {
    debugPrint(access.toString());
    while (!loaded) {
      return Scaffold(
        appBar: AppBar(
          title: const Text("موجودی نخ"),
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
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        actions: [
          checkAccess("filter nakh")
              ? IconButton(
                  onPressed: searchWidth > 90
                      ? () => setState(() => searchWidth = 80)
                      : () => setState(() => searchWidth = 100),
                  icon: const Icon(Icons.filter_alt))
              : const SizedBox(),
          IconButton(
              onPressed: () {
                Navigator.of(context).pop();
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => const Thread(),
                ));
              },
              icon: const Icon(Icons.refresh)),
          checkAccess("add")
              ? IconButton(
                  icon: Icon(ico),
                  onPressed: () {
                    setState(() {
                      if (!show) {
                        show = true;
                        ico = Icons.cancel_outlined;
                      } else {
                        ico = Icons.add;
                        show = false;
                      }
                    });
                  },
                )
              : const SizedBox(),
        ],
        title: const Text("موجودی نخ"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            access.contains("view nakh") || access.contains("admin")
                ? Row(
                    children: [
                      AnimatedContainer(
                        duration: const Duration(milliseconds: 400),
                        width: Dimensions.pwsize(searchWidth),
                        child: buildSearch(),
                      ),
                      AnimatedContainer(
                        duration: const Duration(milliseconds: 400),
                        width: Dimensions.pwsize(searchWidth > 90 ? 0 : 15),
                        child: TextField(
                          controller: filter,
                          keyboardType: TextInputType.number,
                          onChanged: (value) {
                            setState(() {
                              MIN = value != "" ? int.parse(value) : 0;
                            });
                          },
                        ),
                      ),
                    ],
                  )
                : const SizedBox(),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Column(
                children: [
                  if (show)
                    DataTable(
                        columns: getColumns(
                            ['موجودی', 'کد کالا', 'نام کالا', 'شماره']),
                        rows: [
                          DataRow(cells: [
                            DataCell(TextField(
                              controller: amount,
                              keyboardType: TextInputType.number,
                              textInputAction: TextInputAction.done,
                              onSubmitted: (value) {
                                senddata();
                              },
                            )),
                            DataCell(TextField(
                              controller: code,
                              textInputAction: TextInputAction.previous,
                            )),
                            DataCell(TextField(
                              controller: name,
                              textInputAction: TextInputAction.previous,
                            )),
                            const DataCell(Text("0")),
                          ])
                        ]),
                  access.contains("view nakh") || access.contains("admin")
                      ? buildDataTable()
                      : const Center(
                          child: Text("شماره دسترسی به این محتوا ندارید")),

                  // Table(
                  //   columnWidths: {
                  //     0: FlexColumnWidth(15),
                  //     1: FlexColumnWidth(15),
                  //     2: FlexColumnWidth(30),
                  //     3: FlexColumnWidth(30),
                  //     4: FlexColumnWidth(10),
                  //   },
                  //   border: TableBorder.all(),
                  //   children: [
                  //     buildRow([
                  //       'انتقال',
                  //       'موجودی ',
                  //       'کد کالا',
                  //       'نام کالا',
                  //       'شماره'
                  //     ], isHeader: true),
                  //   ],
                  // ),
                  // if (show)
                  //   Table(
                  //     columnWidths: {
                  //       0: FlexColumnWidth(15),
                  //       1: FlexColumnWidth(15),
                  //       2: FlexColumnWidth(30),
                  //       3: FlexColumnWidth(30),
                  //       4: FlexColumnWidth(10),
                  //     },
                  //     border: TableBorder.all(),
                  //     children: [
                  //       buildRow([
                  //         "",
                  //         TextField(
                  //           controller: amount,
                  //           textInputAction: TextInputAction.done,
                  //           keyboardType: TextInputType.number,
                  //           onSubmitted: (value) {
                  //             senddata();
                  //           },
                  //         ),
                  //         TextField(
                  //           controller: code,
                  //           textInputAction: TextInputAction.previous,
                  //         ),
                  //         TextField(
                  //           controller: name,
                  //           textInputAction: TextInputAction.previous,
                  //           autofocus: true,
                  //         ),
                  //         Text("0"),
                  //       ], isHeader: true),
                  //     ],
                  //   ),
                  // Table(
                  //   defaultVerticalAlignment:
                  //       TableCellVerticalAlignment.middle,
                  //   columnWidths: {
                  //     0: FlexColumnWidth(15),
                  //     1: FlexColumnWidth(15),
                  //     2: FlexColumnWidth(30),
                  //     3: FlexColumnWidth(30),
                  //     4: FlexColumnWidth(10),
                  //   },
                  //   border: TableBorder.all(),
                  //   children: List.generate(
                  //     prods.length,
                  //     (index) => buildRow(
                  //       [
                  //         TextField(
                  //           keyboardType: TextInputType.number,
                  //           textAlign: TextAlign.center,
                  //           key: ValueKey(int.parse(prods[index].id)),
                  //           onChanged: (value) {
                  //             print("key is : ${Key}");
                  //           },
                  //         ),
                  //         prods[index].amount,
                  //         prods[index].code,
                  //         prods[index].name,
                  //         prods[index].id
                  //       ],
                  //     ),
                  //   ),
                  // ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future getData() async {
    var url = 'https://alirm.ir/mojoodi/getData.php';
    http.Response response = await http.get(Uri.parse(url));
    var data = jsonDecode(response.body) as List;
    for (var prod in data) {
      debugPrint(prod.toString());
      var p = product(
        prod['id'],
        prod['name'],
        prod['code'],
        prod['amount'],
      );
      prods.add(p);
    }
    setState(() {
      loaded = true;
      dontouchprods = prods;
    });
  }

  TableRow buildRow(List cells, {bool isHeader = false}) => TableRow(
        children: cells.map((cell) {
          final style = TextStyle(
            fontWeight: isHeader ? FontWeight.bold : FontWeight.normal,
            fontSize: 14.346,
          );
          if (cell.runtimeType == String) {
            return Center(
              child: Text(
                cell,
                style: style,
              ),
            );
          } else {
            return Center(child: cell);
          }
        }).toList(),
      );

  Widget buildDataTable() {
    //final columns = ['موجودی', 'کد کالا', 'نام کالا', 'شماره'];
    List<String> columns = [];
    if (checkAccess("view amount nakh")) columns.add('موجودی کالا');
    if (checkAccess("view code nakh")) columns.add('کد کالا');
    if (checkAccess("view name nakh")) columns.add('نام کالا');
    if (columns.isNotEmpty) columns.add('شماره');
    final reversedcolumns = ['شماره', 'نام کالا', 'کد کالا', 'موجودی'];

    return DataTable(
      columns: getColumns(columns),
      rows: getRow(prods),
    );
  }

  List<DataColumn> getColumns(List<String> columns) => columns
      .map((String column) => DataColumn(
            label: Text(column),
          ))
      .toList();

  List<DataRow> getRow(List<product> products) => products.map((product prod) {
        //final cells = [prod.amount, prod.code, prod.name, prod.id];
        List cells = [];
        if (checkAccess("view amount nakh")) cells.add(prod.amount);
        if (checkAccess("view code nakh")) cells.add(prod.code);
        if (checkAccess("view name nakh")) cells.add(prod.name);
        if (cells.isNotEmpty) cells.add(prod.id);
        return DataRow(
          color: checkAccess("filter nakh")
              ? MaterialStateProperty.resolveWith<Color?>(
                  (Set<MaterialState> states) {
                  // if (prod.amount.length >= 2) {
                  //   if (int.parse(prod.amount.substring(0, 2)) <= MIN)
                  //     return Colors.red[200];
                  // } else {
                  //   if (int.parse(prod.amount.substring(0, 1)) <= MIN)
                  //     return Colors.red[200];
                  // }
                  if (double.parse(prod.amount) <= MIN) return Colors.red[200];
                  return null;
                })
              : null,
          onLongPress: () {
            access.contains("delete nakh") || access.contains("admin")
                ? deletedata(prod)
                : Fluttertoast.showToast(msg: "شما دسترسی ندارید");
          },
          cells: Utils.modelBuilder(cells, (index, cell) {
            final showEditIcon = index == 1 || index == 2 || index == 3;
            return DataCell(
              // showEditIcon: showEditIcon,
              Text(' | $cell  |'),
              onLongPress: () {
                showDialog(
                  context: context,
                  builder: (ctx) => AlertDialog(
                    title: const Text("Alert"),
                    content:
                        const Text("are you sure you want to delete data?"),
                    actions: <Widget>[
                      TextButton(
                        onPressed: () {
                          Navigator.of(ctx).pop();
                        },
                        child: Container(
                          color: Colors.blue[900],
                          padding: const EdgeInsets.all(14),
                          child: const Text(
                            "no",
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ), //
                      TextButton(
                        onPressed: () {
                          if (access.contains("delete nakh") ||
                              access.contains("admin")) {
                            deletedata(prod);
                            Navigator.of(ctx).pop();
                          }
                        },
                        child: Container(
                          color: Colors.blue[900],
                          padding: const EdgeInsets.all(14),
                          child: const Text(
                            "yes",
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              },
              onTap: () {
                switch (index) {
                  case 2:
                    access.contains("edit name nakh") ||
                            access.contains("admin")
                        ? editName(prod)
                        : Fluttertoast.showToast(msg: "شما دسترسی ندارید");
                    break;
                  case 1:
                    checkAccess("edit code nakh")
                        ? editcode(prod)
                        : Fluttertoast.showToast(msg: "شما دسترسی ندارید");
                    break;
                  case 0:
                    checkAccess("edit amount nakh")
                        ? editamount(prod)
                        : Fluttertoast.showToast(msg: "شما دسترسی ندارید");
                    break;
                }
              },
            );
          }),
        );
      }).toList();

  Future editName(product editprod) async {
    final name = await showTextDialog(
      context,
      title: 'نام جدید را وارد کنید',
      value: editprod.name,
      type: "name",
      prod: editprod,
    );

    if (Thread.updated) {
      Thread.updated = false;
      Navigator.of(context).pop();
      Navigator.of(context)
          .push(MaterialPageRoute(builder: (context) => const Thread()));
    }
  }

  Future editcode(product editprod) async {
    final code = await showTextDialog(
      context,
      title: 'کد جدید را وارد کنید',
      value: editprod.code,
      type: "code",
      prod: editprod,
    );

    if (Thread.updated) {
      Thread.updated = false;
      Navigator.of(context).pop();
      Navigator.of(context)
          .push(MaterialPageRoute(builder: (context) => const Thread()));
    }
  }

  Future editamount(product editprod) async {
    final amount = await showTextDialog(
      context,
      title: 'موجودی جدید را وارد کنید',
      value: editprod.amount,
      type: "amount",
      prod: editprod,
    );

    if (Thread.updated) {
      Thread.updated = false;
      Navigator.of(context).pop();
      Navigator.of(context)
          .push(MaterialPageRoute(builder: (context) => const Thread()));
      /*
          Navigator.of(context).pop();
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => const Thread(),
                ));
           */
    }
  }

  Future senddata() async {
    if (amount.text != "" && name.text != "" && code.text != "") {
      if (show) {
        setState(() {
          show = false;
          print("done");
        });
        final response = await http
            .post(Uri.parse("https://alirm.ir/mojoodi/insertdata.php"), body: {
          "name": name.text,
          "code": code.text,
          "amount": amount.text,
        });
        final addHistory = await http.post(
            Uri.parse("https://alirm.ir/mojoodi/insertdatahistory.php"),
            body: {
              "user_name": MyApp.curruser!.user_name,
              "action": "افزودن کالای ${name.text}",
            });
        Navigator.of(context).pop();
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => const Thread()));
      }
    }
  }

  Future deletedata(product produ) async {
    final response = await http
        .post(Uri.parse("https://alirm.ir/mojoodi/delete.php"), body: {
      "id": produ.id,
    });
    final addHistory = await http.post(
        Uri.parse("https://alirm.ir/mojoodi/insertdatahistory.php"),
        body: {
          "user_name": MyApp.curruser!.user_name,
          "action": "حذف کالای ${produ.name}",
        });
    Navigator.of(context).pop();
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => const Thread()));
  }

  Future updatedata() async {
    if (show) {
      setState(() {
        show = false;
        print("done");
      });
      final response = await http
          .post(Uri.parse("https://alirm.ir/mojoodi/insertdata.php"), body: {
        "name": name.text,
        "code": code.text,
        "amount": amount.text,
      });
      final addHistory = await http.post(
          Uri.parse("https://alirm.ir/mojoodi/insertdatahistory.php"),
          body: {
            "user_name": MyApp.curruser!.user_name,
            "action": "افزودن کالای ${name.text}",
          });
      Navigator.of(context).pop();
      Navigator.of(context)
          .push(MaterialPageRoute(builder: (context) => const Thread()));
    }
  }

  Widget buildSearch() => SearchWidget(
        text: query,
        hintText: "نام کالا یا کد کالا",
        onChanged: search,
      );

  void search(String query) async {
    prods = dontouchprods;
    final prod1 = prods.where((prodd) {
      final title = prodd.name.toLowerCase();
      final search = query.toLowerCase();

      return title.contains(search);
    }).toList();
    final prod2 = prods.where((prodd) {
      final title = prodd.code.toLowerCase();
      final search = query.toLowerCase();

      return title.contains(search);
    }).toList();
    List<product> prod = [];

    for (var p in prod1) {
      prod.add(p);
    }
    for (var p in prod2) {
      if (!prod.contains(p)) prod.add(p);
    }
    setState(() {
      //print("Clubs : ${Clubs.length} & clubs : ${clubs.length}");
      this.query = query;
      prods = prod;
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
