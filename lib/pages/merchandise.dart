import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';

class Merchandise extends StatefulWidget {
  const Merchandise({super.key});

  @override
  State<Merchandise> createState() => _MerchandiseState();
}

class _MerchandiseState extends State<Merchandise> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        backgroundColor: Colors.red,
        body: Center(
          child: Text('M E R C H'),
        ));
  }
}
