import 'package:flutter/material.dart';
import 'package:giphy_task/app/View/giphy_view.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: "Time Tracker",
        theme: ThemeData(
          primarySwatch: Colors.indigo,
        ),
        home: GiffBlock());
  }
}
