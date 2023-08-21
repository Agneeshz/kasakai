import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:kasakai/pages/turf.dart';
import 'package:carousel_slider/carousel_slider.dart';

final List<String> imgList = [
  'assets/1.png',
  'assets/2.png',
  'assets/3.png',
  'assets/4.png',
  'assets/5.png',
  'assets/6.png',
];

final List<Widget> imageSliders = imgList
    .map((item) => Container(
          margin: const EdgeInsets.all(5.0),
          child: ClipRRect(
              borderRadius: const BorderRadius.all(Radius.circular(5.0)),
              child: Stack(
                children: <Widget>[
                  Image.asset(item, fit: BoxFit.cover, width: 1000.0),
                  Positioned(
                    bottom: 0.0,
                    left: 0.0,
                    right: 0.0,
                    child: Container(
                      decoration: const BoxDecoration(
                        gradient: LinearGradient(
                          colors: [
                            Color.fromARGB(200, 0, 0, 0),
                            Color.fromARGB(0, 0, 0, 0)
                          ],
                          begin: Alignment.bottomCenter,
                          end: Alignment.topCenter,
                        ),
                      ),
                      padding: const EdgeInsets.symmetric(
                          vertical: 10.0, horizontal: 20.0),
                      // child: Text(
                      //   'No. ${imgList.indexOf(item)} image',
                      //   style: const TextStyle(
                      //     color: Colors.white,
                      //     fontSize: 20.0,
                      //     fontWeight: FontWeight.bold,
                      //   ),
                      // ),
                    ),
                  ),
                ],
              )),
        ))
    .toList();

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
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
          color: Colors.black,
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
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => const Home()));
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
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => const Turf()));
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
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => const Turf()));
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
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => const Turf()));
                },
              ),
            ],
          ),
        ),
      ),
      body: Column(children: [
        // const Text('R E C E N T  E V E N T S'),
        CarouselSlider(
          options: CarouselOptions(
            autoPlay: true,
            aspectRatio: 2.0,
            enlargeCenterPage: true,
          ),
          items: imageSliders,
        ),
      ]),
    );
  }
}
