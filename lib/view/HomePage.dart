import 'package:flutter/material.dart';

import '../Controller/controller.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  CounterBloc counterBloc = CounterBloc();
  @override
  Widget build(BuildContext context) {
    print("build refresh");
    return Scaffold(
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          FloatingActionButton(
              onPressed: () {
                counterBloc.eventSink.add(CounterEvent.Increment);
              },
              tooltip: "Increment",
              child: Icon(Icons.add)),
          FloatingActionButton(
            onPressed: () {
              counterBloc.eventSink.add(CounterEvent.Decrement);
            },
            tooltip: "Decrement",
            child: Icon(Icons.remove),
          ),
          FloatingActionButton(
            onPressed: () {
              counterBloc.eventSink.add(CounterEvent.Reset);
            },
            tooltip: "Reset",
            child: Icon(Icons.refresh),
          )
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            StreamBuilder(
              stream: counterBloc.counterStream,
              initialData: 0,
              builder: (context, snapshot) => Text(
                "${snapshot.data}",
                style: TextStyle(fontSize: 25),
              ),
            )
          ],
        ),
      ),
    );
  }
}
