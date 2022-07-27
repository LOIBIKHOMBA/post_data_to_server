import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
import 'package:fuel/repository/servicesapi.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text('form'),
        ),
        body: const FuelRecord(),
      ),
    );
  }
}

Widget _buildAge() {
  var format;
  return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Flexible(flex: 1, child: Container(color: Colors.red)),
        Padding(
          padding: const EdgeInsets.only(top: 10),
          child: Row(
            children: [
              Icon(
                Icons.calendar_month_rounded,
                color: Colors.deepPurpleAccent,
                size: 25,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 16),
                child: Text("Date of Birth ",
                    style: TextStyle(color: Colors.black, fontSize: 16)),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 42, bottom: 10),
          child: DateTimeField(
            format: format,
            onShowPicker: (context, currentValue) {
              return showDatePicker(
                  context: context,
                  initialDate: currentValue ?? DateTime.now(),
                  firstDate: DateTime(2010),
                  lastDate: DateTime(2025),
                  helpText: "SELECT DATE OF BIRTH",
                  cancelText: "CANCEL",
                  confirmText: "OK",
                  fieldHintText: "DATE/MONTH/YEAR",
                  fieldLabelText: "ENTER YOUR DATE OF BIRTH",
                  errorFormatText: "Enter a Valid Date",
                  errorInvalidText: "Date Out of Range");
            },
          ),
        ),
      ]);
}

class FuelRecord extends StatefulWidget {
  const FuelRecord({Key? key}) : super(key: key);

  @override
  State<FuelRecord> createState() => _FuelRecordState();
}

class _FuelRecordState extends State<FuelRecord> {
  TextEditingController _petrolprice = TextEditingController();
  TextEditingController _dieselprice = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Fuel"),
      ),
      body: ListView.builder(itemBuilder: (c, i) {
        return Text(" ");
      }),
      floatingActionButton: FloatingActionButton(
          onPressed: () {
            showDialog(
                context: context,
                builder: (c) {
                  return AlertDialog(
                    title: const Text("Add new data"),
                    content: Column(
                      children: [
                        TextField(
                          // obscureText: true,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'Enter Date',
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        TextField(
                          controller: _petrolprice,
                          // obscureText: true,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'Enter Petrol price',
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        TextField(
                          controller: _dieselprice,
                          // obscureText: true,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'Enter Diesel price',
                          ),
                        ),
                      ],
                    ),
                    actions: [
                      TextButton(
                          onPressed: () {
                            log("data");
                            ServiceApi()
                                .postData(_petrolprice.text, _dieselprice.text);
                            Navigator.pop(context);
                          },
                          child: const Text("Summit"))
                    ],
                  );
                });
          },
          child: const Icon(Icons.add)),
    );
  }
}
