import 'package:flutter/material.dart';
import 'package:kasakai/pages/contact.dart';
import 'package:kasakai/pages/home.dart';
import 'package:kasakai/pages/merchandise.dart';
import 'package:kasakai/pages/open_mic.dart';

class Turf extends StatefulWidget {
  const Turf({super.key});

  @override
  State<Turf> createState() => _TurfState();
}

class _TurfState extends State<Turf> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // backgroundColor: Colors.green,
        appBar: AppBar(
          backgroundColor: Colors.green,
          elevation: 0,
          title: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            const Text('K A S A K A I       ', style: TextStyle(fontSize: 20)),
            Image.asset(
              "assets/logo.png",
              width: 40,
            ),
          ]),
          titleSpacing: 10,
          centerTitle: true,
          // leading: IconButton(
          //   onPressed: () {
          //     Drawer(
          //       child: Container(
          //         color: Colors.black,
          //         child: ListView(
          //           children: [],
          //         ),
          //       ),
          //     );
          //   },
          //   icon: const Icon(Icons.menu),
          // ),
          actions: [
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.search),
            ),
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.account_circle),
            ),
          ],
        ),
        drawer: Drawer(
          child: Container(
            color: Colors.green,
            child: ListView(
              children: [
                const DrawerHeader(
                  child: Center(
                    child: Text(
                      'M E N U',
                      style: TextStyle(fontSize: 35, color: Colors.white),
                    ),
                  ),
                ),
                ListTile(
                  leading: const Icon(
                    Icons.home,
                    color: Colors.white,
                  ),
                  title: const Text(
                    'H O M E',
                    style: TextStyle(fontSize: 17, color: Colors.white),
                  ),
                  onTap: () {
                    Navigator.of(context)
                        .push(MaterialPageRoute(builder: (context) => Home()));
                  },
                ),
                ListTile(
                  leading: const Icon(
                    Icons.sports_soccer,
                    color: Colors.white,
                  ),
                  title: const Text(
                    'T U R F  M E E T S',
                    style: TextStyle(fontSize: 17, color: Colors.white),
                  ),
                  onTap: () {
                    Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => const Turf()));
                  },
                ),
                ListTile(
                  leading: const Icon(
                    Icons.mic_external_on,
                    color: Colors.white,
                  ),
                  title: const Text(
                    'O P E N  M I C S',
                    style: TextStyle(fontSize: 17, color: Colors.white),
                  ),
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const OpenMic()));
                  },
                ),
                ListTile(
                  leading: const Icon(
                    Icons.shopping_bag_outlined,
                    color: Colors.white,
                  ),
                  title: const Text(
                    'M E R C H A N D I S E',
                    style: TextStyle(fontSize: 17, color: Colors.white),
                  ),
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const Merchandise()));
                  },
                ),
                ListTile(
                  leading: const Icon(
                    Icons.contact_support,
                    color: Colors.white,
                  ),
                  title: const Text(
                    'C O N T A C T  U S',
                    style: TextStyle(fontSize: 17, color: Colors.white),
                  ),
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const Contact()));
                  },
                ),
              ],
            ),
          ),
        ),
        body: const Column(children: [
          Text('\n    T U R F  M E E T S', style: TextStyle(fontSize: 17)),
        ]));
  }
}
