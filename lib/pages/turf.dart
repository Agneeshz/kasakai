import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';

class Turf extends StatefulWidget {
  const Turf({super.key});

  @override
  State<Turf> createState() => _TurfState();
}

class _TurfState extends State<Turf> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        backgroundColor: Colors.green,
        body: Center(
          child: Text('T U R F  F O O T B A L L'),
        ));
  }
}
