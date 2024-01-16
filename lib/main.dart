import 'package:flutter/material.dart';
import 'package:kasakai/pages/home.dart';
import 'package:kasakai/pages/login_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Kasakai Mumbai',
      home: LoginPage(),
      // home: CarouselDemo(),
    );
  }
}
