import 'package:flutter/material.dart';

class DetailScreen extends StatefulWidget {
  const DetailScreen({super.key});

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Image.asset(
            "assets/1.png",
            width: 350.0,
            fit: BoxFit.cover,
          ),
          Padding(
            padding: const EdgeInsets.only(
              top: 64.0,
              bottom: 0.0,
              left: 24.0,
              right: 24.0,
            ), // EdgeInsets.only
            child: Row(
              children: [
                Container(
                  height: 40.0,
                  width: 40.0,
                  child: Icon(
                    Icons.arrow_back_ios_new_rounded,
                    color: Colors.white,
                  ),
                ),
                Icon(
                  Icons.bookmark_outline,
                  color: Colors.white,
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
