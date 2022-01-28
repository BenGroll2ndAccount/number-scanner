//@dart=2.13
import 'package:flutter/material.dart';
import 'static/strings.dart' as st;
import 'screens/homescreen.dart';
import 'service/api.dart' as api;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    //api.getSoapResponseTest(context);
    return MaterialApp(
      title: st.appname,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HOMESCREEN(),
    );
  }
}
