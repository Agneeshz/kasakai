import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';

class OpenMic extends StatefulWidget {
  const OpenMic({super.key});

  @override
  State<OpenMic> createState() => _OpenMicState();
}

class _OpenMicState extends State<OpenMic> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        backgroundColor: Colors.purple,
        body: Center(
          child: Text('O P E N  M I C'),
        ));
  }
}
