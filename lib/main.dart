import 'package:flutter/material.dart';
import 'package:superapp/home_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Super App',
      debugShowCheckedModeBanner:
          false, // Set this to false to turn off the debug banner
      home: HomePage(),
      routes: {
        "/home": (context) => HomePage(),
      },
    );
  }
}
