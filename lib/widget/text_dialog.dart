import 'package:flutter/material.dart';
import 'package:mojoodi/pages/thread.dart';
import 'package:http/http.dart' as http;
import 'package:mojoodi/utils/dimensions.dart';
import 'package:mojoodi/utils/product.dart';

import '../main.dart';

Future<T?> showTextDialog<T>(
  BuildContext context, {
  required String title,
  required String value,
  required String type,
  required product prod,
}) =>
    showDialog<T>(
      context: context,
      builder: (context) => TextDialogWidget(
        title: title,
        value: value,
        type: type,
        prod: prod,
      ),
    );

class TextDialogWidget extends StatefulWidget {
  final String title;
  final String value;
  final String type;
  final product prod;

  const TextDialogWidget({
    Key? key,
    required this.title,
    required this.value,
    required this.type,
    required this.prod,
  }) : super(key: key);

  @override
  _TextDialogWidgetState createState() => _TextDialogWidgetState();
}

class _TextDialogWidgetState extends State<TextDialogWidget> {
  late TextEditingController controller;
  late TextEditingController dook;
  late TextEditingController weight;
  double amountResult = 0.0;

  @override
  void initState() {
    super.initState();

    controller = TextEditingController(text: widget.value);
    dook = TextEditingController();
    weight = TextEditingController();
  }

  @override
  Widget build(BuildContext context) => (widget.type == "amount")
      ? AlertDialog(
          title: Text(widget.title),
          content: SizedBox(
            height: Dimensions.phsize(30),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(widget.value),
                TextField(
                  keyboardType: TextInputType.number,
                  controller: weight,
                  decoration: const InputDecoration(
                    hintTextDirection: TextDirection.rtl,
                    hintText: "عدد ترازو",
                    border: OutlineInputBorder(),
                  ),
                  onChanged: (value) {
                    setState(() {});
                  },
                ),
                TextField(
                  keyboardType: TextInputType.number,
                  controller: dook,
                  decoration: const InputDecoration(
                    hintTextDirection: TextDirection.rtl,
                    hintText: "تعداد دوک",
                    border: OutlineInputBorder(),
                  ),
                  onChanged: (value) {
                    setState(() {});
                  },
                ),
              ],
            ),
          ),
          actions: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ElevatedButton(
                    style: ButtonStyle(
                        backgroundColor:
                            ((weight.text.isNotEmpty && dook.text.isNotEmpty) &&
                                    (double.parse(weight.text) -
                                            (int.parse(dook.text) * 0.025) <=
                                        double.parse(widget.value)))
                                ? MaterialStateColor.resolveWith(
                                    (states) => Colors.red)
                                : MaterialStateColor.resolveWith(
                                    (states) => Colors.grey)),
                    onPressed:
                        ((weight.text.isNotEmpty && dook.text.isNotEmpty) &&
                                (double.parse(weight.text) -
                                        (int.parse(dook.text) * 0.025) <=
                                    double.parse(widget.value)))
                            ? () {
                                Thread.updated = true;
                                amountResult = double.parse(widget.value) -
                                    (double.parse(weight.text) -
                                        (int.parse(dook.text) * 0.025));
                                updatedata();
                                Navigator.of(context).pop();
                              }
                            : null,
                    child: const Text('خروج از انبار')),
                ElevatedButton(
                    style: ButtonStyle(
                        backgroundColor:
                            (weight.text.isNotEmpty && dook.text.isNotEmpty)
                                ? MaterialStateColor.resolveWith(
                                    (states) => Colors.green)
                                : MaterialStateColor.resolveWith(
                                    (states) => Colors.grey)),
                    onPressed: (weight.text.isNotEmpty && dook.text.isNotEmpty)
                        ? () {
                            Thread.updated = true;
                            amountResult = double.parse(widget.value) +
                                double.parse(weight.text) -
                                (int.parse(dook.text) * 0.025);
                            updatedata();
                            Navigator.of(context).pop();
                          }
                        : null,
                    child: const Text('ورود به انبار')),
              ],
            )
          ],
        )
      : AlertDialog(
          title: Text(widget.title),
          content: TextField(
            keyboardType: widget.type == "amount"
                ? TextInputType.number
                : TextInputType.text,
            controller: controller,
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
            ),
          ),
          actions: [
            ElevatedButton(
                child: const Text('Done'),
                onPressed: () {
                  Thread.updated = true;
                  updatedata();
                  Navigator.of(context).pop();
                })
          ],
        );

  Future updatedata() async {
    if (widget.type == "name") {
      final response = await http
          .post(Uri.parse("https://alirm.ir/mojoodi/update.php"), body: {
        "id": widget.prod.id,
        "name": controller.text,
        "code": widget.prod.code,
        "amount": widget.prod.amount,
      });
      final addHistory = await http.post(
          Uri.parse("https://alirm.ir/mojoodi/insertdatahistory.php"),
          body: {
            "user_name": MyApp.curruser!.user_name,
            "action":
                "تغییر نام کالای ${widget.prod.name} با کد ${widget.prod.code} به ${controller.text}",
          });
      print("\n // \n // \n // ${response.body} // \n // \n // \n //");
    }

    if (widget.type == "code") {
      final response = await http
          .post(Uri.parse("https://alirm.ir/mojoodi/update.php"), body: {
        "id": widget.prod.id,
        "name": widget.prod.name,
        "code": controller.text,
        "amount": widget.prod.amount,
      });
      final addHistory = await http.post(
          Uri.parse("https://alirm.ir/mojoodi/insertdatahistory.php"),
          body: {
            "user_name": MyApp.curruser!.user_name,
            "action":
                "تغییر کد کالای ${widget.prod.name} از کد ${widget.prod.code} به ${controller.text}",
          });
      print("\n // \n // \n // ${response.body} // \n // \n // \n //");
    }

    if (widget.type == "amount") {
      final response = await http
          .post(Uri.parse("https://alirm.ir/mojoodi/update.php"), body: {
        "id": widget.prod.id,
        "name": widget.prod.name,
        "code": widget.prod.code,
        "amount": amountResult.toString(),
      });
      final addHistory = await http.post(
          Uri.parse("https://alirm.ir/mojoodi/insertdatahistory.php"),
          body: {
            "user_name": MyApp.curruser!.user_name,
            "action":
                "تغییر موجودی کالای ${widget.prod.name} با کد ${widget.prod.code} از ${widget.prod.amount} به ${amountResult.toString()}",
          });
      print("\n // \n // \n // ${response.body} // \n // \n // \n //");
      print("\n // \n // \n // ${addHistory.body} // \n // \n // \n //");
    }
  }
}
