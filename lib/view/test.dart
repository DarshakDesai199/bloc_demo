import 'package:flutter/material.dart';

class Test extends StatefulWidget {
  const Test({Key? key}) : super(key: key);

  @override
  State<Test> createState() => _TestState();
}

class _TestState extends State<Test> {
  int _counter = 0;

  @override
  Widget build(BuildContext context) {
    print("build");
    return Scaffold(
      floatingActionButton: FloatingActionButton(
          onPressed: () {
            setState(() {
              _counter++;
            });
          },
          child: Icon(Icons.add)),
      body: Center(
          child: Text(
        "$_counter",
        textScaleFactor: 3,
      )),
    );
  }
}
