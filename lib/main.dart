import 'package:flutter/material.dart';
import 'package:planner/screens/home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Planner',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white,
        textTheme: TextTheme(
          bodyText1: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold
          ),
          bodyText2: TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w500,
          )
        )
      ),
      home: const Home(),
    );
  }
}