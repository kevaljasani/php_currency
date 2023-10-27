import 'package:currency_picker/currency_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main()
{
  runApp(MaterialApp(home: first(),));
}

class first extends StatefulWidget {
  const first({super.key});

  @override
  State<first> createState() => _firstState();
}

class _firstState extends State<first> {


  TextEditingController t1=TextEditingController();
  TextEditingController t2=TextEditingController();
  TextEditingController t3=TextEditingController();
  String code="";

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(),

      body: Column(
        children: [
          TextField(
            controller: t1,
          ),

          TextField(

            onTap: () {
              showCurrencyPicker(
                context: context,
                showFlag: true,
                showCurrencyName: true,
                showCurrencyCode: true,
                onSelect: (Currency currency) {
                  t2.text=currency.code;
                  print('Select currency: ${currency.name}');
                },
              );
            },

            controller: t2,
          ),

          TextField(

            onTap: () {
              showCurrencyPicker(
                context: context,
                showFlag: true,
                showCurrencyName: true,
                showCurrencyCode: true,
                onSelect: (Currency currency) {
                  t3.text=currency.code;
                  print('Select currency: ${currency.name}');
                },
              );
            },

            controller: t3,
          ),
          
          ElevatedButton(onPressed: () async {

            String amount=t1.text;
            String from=t2.text;
            String to=t3.text;

            var url = Uri.parse('https://kevaljasani.000webhostapp.com/currency.php');
            var response = await http.post(url, body: {'amount': '${amount}', 'from': '$from', 'to': '$to'});
            print('Response status: ${response.statusCode}');
            print('Response body: ${response.body}');

          }, child: Text("Submit"))
        ],
      ),
    );
  }
}
