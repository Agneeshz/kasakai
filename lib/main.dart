import 'package:flutter/material.dart';
import 'package:kasakai/pages/carousel.dart';
import 'package:kasakai/pages/home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Kasakai Mumbai',
      home: Home(),
      // home: CarouselDemo(),
    );
  }
}
