import 'package:flutter/material.dart';
import 'package:mojoodi/pages/socks.dart';
import 'package:http/http.dart' as http;
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

  @override
  void initState() {
    super.initState();

    controller = TextEditingController(text: widget.value);
  }

  @override
  Widget build(BuildContext context) => AlertDialog(
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
                Socks.updated = true;
                updatedata();
                Navigator.of(context).pop();
              })
        ],
      );

  Future updatedata() async {
    if (widget.type == "name") {
      final response = await http
          .post(Uri.parse("https://alirm.ir/mojoodi/updateSocks.php"), body: {
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
          .post(Uri.parse("https://alirm.ir/mojoodi/updateSocks.php"), body: {
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
                "تغییر کد کالای ${widget.prod.name} از  ${widget.prod.code} به ${controller.text}",
          });
      print("\n // \n // \n // ${response.body} // \n // \n // \n //");
    }

    if (widget.type == "amount") {
      final response = await http
          .post(Uri.parse("https://alirm.ir/mojoodi/updateSocks.php"), body: {
        "id": widget.prod.id,
        "name": widget.prod.name,
        "code": widget.prod.code,
        "amount": controller.text,
      });
      final addHistory = await http.post(
          Uri.parse("https://alirm.ir/mojoodi/insertdatahistory.php"),
          body: {
            "user_name": MyApp.curruser!.user_name,
            "action":
                "تغییر موجودی کالای ${widget.prod.name} با کد ${widget.prod.code} از ${widget.prod.amount} به ${controller.text}",
          });
      print("\n // \n // \n // ${response.body} // \n // \n // \n //");
    }
  }
}
