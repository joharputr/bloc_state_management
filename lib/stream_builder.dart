import 'package:flutter/material.dart';

class StreamBuilder1 extends StatefulWidget {
  const StreamBuilder1({Key key}) : super(key: key);

  @override
  _StreamBuilderState createState() => _StreamBuilderState();
}

class _StreamBuilderState extends State<StreamBuilder1> {
  bool _running = true;

  Stream<String> _clock() async* {
    // This loop will run forever because _running is always true
    while (_running) {
      await Future<void>.delayed(Duration(seconds: 1));
      DateTime _now = DateTime.now();
      // This will be displayed on the screen as current time
      yield "${_now.hour} : ${_now.minute} : ${_now.second}";
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: StreamBuilder(
            //if use futureBuilder will not loop
            stream: _clock(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return CircularProgressIndicator();
              }
              return Text(
                snapshot.data,
                style: TextStyle(fontSize: 50, color: Colors.blue),
              );
            },
          ),
        ),
      ),
    );
  }
}
