import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:kasakai/pages/account.dart';
import 'package:kasakai/pages/contact.dart';
import 'package:kasakai/pages/detail.dart';
// import 'package:kasakai/pages/detail.dart';
import 'package:kasakai/pages/merchandise.dart';
import 'package:kasakai/pages/open_mic.dart';
import 'package:kasakai/pages/turf.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

final List<String> imgList = [
  'assets/1.png',
  'assets/2.png',
  'assets/3.png',
  'assets/4.png',
  'assets/5.png',
  'assets/6.png',
];

class Article {
  int? statusCode;
  Articles? articles;

  Article({this.statusCode, this.articles});

  Article.fromJson(Map<String, dynamic> json) {
    statusCode = json['status_code'];
    articles = json['articles'] != null
        ? new Articles.fromJson(json['articles'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status_code'] = this.statusCode;
    if (this.articles != null) {
      data['articles'] = this.articles!.toJson();
    }
    return data;
  }
}

class Articles {
  int? count;
  // Null? next;
  // Null? previous;
  List<Results>? results;

  Articles({this.count, this.results});

  Articles.fromJson(Map<String, dynamic> json) {
    count = json['count'];
    // next = json['next'];
    // previous = json['previous'];
    if (json['results'] != null) {
      results = <Results>[];
      json['results'].forEach((v) {
        results!.add(new Results.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['count'] = this.count;
    // data['next'] = this.next;
    // data['previous'] = this.previous;
    if (this.results != null) {
      data['results'] = this.results!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Results {
  String? id;
  String? title;
  String? slug;
  List<String>? tags;
  int? estimatedReadingTime;
  AuthorInfo? authorInfo;
  int? views;
  String? description;
  String? body;
  String? bannerImage;
  double? averageRating;
  int? bookmarksCount;
  List<Bookmarks>? bookmarks;
  int? clapsCount;
  List<Responses>? responses;
  int? responsesCount;
  String? createdAt;
  String? updatedAt;

  Results(
      {this.id,
      this.title,
      this.slug,
      this.tags,
      this.estimatedReadingTime,
      this.authorInfo,
      this.views,
      this.description,
      this.body,
      this.bannerImage,
      this.averageRating,
      this.bookmarksCount,
      this.bookmarks,
      this.clapsCount,
      this.responses,
      this.responsesCount,
      this.createdAt,
      this.updatedAt});

  Results.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    slug = json['slug'];
    tags = json['tags'].cast<String>();
    estimatedReadingTime = json['estimated_reading_time'];
    authorInfo = json['author_info'] != null
        ? new AuthorInfo.fromJson(json['author_info'])
        : null;
    views = json['views'];
    description = json['description'];
    body = json['body'];
    bannerImage = json['banner_image'];
    averageRating = json['average_rating'];
    bookmarksCount = json['bookmarks_count'];
    if (json['bookmarks'] != null) {
      bookmarks = <Bookmarks>[];
      json['bookmarks'].forEach((v) {
        bookmarks!.add(new Bookmarks.fromJson(v));
      });
    }
    clapsCount = json['claps_count'];
    if (json['responses'] != null) {
      responses = <Responses>[];
      json['responses'].forEach((v) {
        responses!.add(new Responses.fromJson(v));
      });
    }
    responsesCount = json['responses_count'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['slug'] = this.slug;
    data['tags'] = this.tags;
    data['estimated_reading_time'] = this.estimatedReadingTime;
    if (this.authorInfo != null) {
      data['author_info'] = this.authorInfo!.toJson();
    }
    data['views'] = this.views;
    data['description'] = this.description;
    data['body'] = this.body;
    data['banner_image'] = this.bannerImage;
    data['average_rating'] = this.averageRating;
    data['bookmarks_count'] = this.bookmarksCount;
    if (this.bookmarks != null) {
      data['bookmarks'] = this.bookmarks!.map((v) => v.toJson()).toList();
    }
    data['claps_count'] = this.clapsCount;
    if (this.responses != null) {
      data['responses'] = this.responses!.map((v) => v.toJson()).toList();
    }
    data['responses_count'] = this.responsesCount;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}

class AuthorInfo {
  String? firstName;
  String? lastName;
  String? fullName;
  String? email;
  String? id;
  String? profilePhoto;
  String? phoneNumber;
  String? aboutMe;
  String? gender;
  String? country;
  String? city;
  String? interests;
  bool? following;

  AuthorInfo(
      {this.firstName,
      this.lastName,
      this.fullName,
      this.email,
      this.id,
      this.profilePhoto,
      this.phoneNumber,
      this.aboutMe,
      this.gender,
      this.country,
      this.city,
      this.interests,
      this.following});

  AuthorInfo.fromJson(Map<String, dynamic> json) {
    firstName = json['first_name'];
    lastName = json['last_name'];
    fullName = json['full_name'];
    email = json['email'];
    id = json['id'];
    profilePhoto = json['profile_photo'];
    phoneNumber = json['phone_number'];
    aboutMe = json['about_me'];
    gender = json['gender'];
    country = json['country'];
    city = json['city'];
    interests = json['interests'];
    following = json['following'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['first_name'] = this.firstName;
    data['last_name'] = this.lastName;
    data['full_name'] = this.fullName;
    data['email'] = this.email;
    data['id'] = this.id;
    data['profile_photo'] = this.profilePhoto;
    data['phone_number'] = this.phoneNumber;
    data['about_me'] = this.aboutMe;
    data['gender'] = this.gender;
    data['country'] = this.country;
    data['city'] = this.city;
    data['interests'] = this.interests;
    data['following'] = this.following;
    return data;
  }
}

class Bookmarks {
  int? id;
  String? userFirstName;
  String? articleTitle;
  String? createdAt;

  Bookmarks({this.id, this.userFirstName, this.articleTitle, this.createdAt});

  Bookmarks.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userFirstName = json['user_first_name'];
    articleTitle = json['article_title'];
    createdAt = json['created_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['user_first_name'] = this.userFirstName;
    data['article_title'] = this.articleTitle;
    data['created_at'] = this.createdAt;
    return data;
  }
}

class Responses {
  String? id;
  String? userFirstName;
  String? articleTitle;
  int? parentResponse;
  String? content;
  String? createdAt;

  Responses(
      {this.id,
      this.userFirstName,
      this.articleTitle,
      this.parentResponse,
      this.content,
      this.createdAt});

  Responses.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userFirstName = json['user_first_name'];
    articleTitle = json['article_title'];
    parentResponse = json['parent_response'];
    content = json['content'];
    createdAt = json['created_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['user_first_name'] = this.userFirstName;
    data['article_title'] = this.articleTitle;
    data['parent_response'] = this.parentResponse;
    data['content'] = this.content;
    data['created_at'] = this.createdAt;
    return data;
  }
}

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
                      //   'No. ${imgList.2Of(item)} image',
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

Article post = Article();

class Home extends StatefulWidget {
  Home({super.key}) {
    // loadUser();
  }

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  void triggerHotReload() {
    // Programmatically trigger a hot reload
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    fetchPost();
  }

  bool isLoading = true;

  void fetchPost() async {
    setState(() {
      isLoading = true;
    });
    const storage = FlutterSecureStorage();
    final token = await storage.read(key: 'auth_token');
    print("artic");
    try {
      var response = await http.get(
        Uri.parse('https://www.kkmapi.online/api/v1/articles/'),
        headers: {
          'Authorization': 'Bearer $token',
        },
      );
      print(response.body);
      post = Article.fromJson(jsonDecode(response.body));
    } catch (e) {
      print(e);
    }
  }

  int selectedIndex = 0;
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold, color: Colors.grey);
  static const List<Widget> _widgetOptions = <Widget>[
    Text(
      'Index 0: Home',
      style: optionStyle,
    ),
    Text(
      'Index 1: My Events',
      style: optionStyle,
    ),
    Text(
      'Index 2: Notification',
      style: optionStyle,
    ),
    Text(
      'Index 3: Profile',
      style: optionStyle,
    ),
  ];

  void _onItemTapped(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    // Size size = MediaQuery.of(context).size;
    if (post != Null) {
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
              onPressed: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) => User()));
              },
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
        body: Column(
          children: [
            // isLoading ? CircularProgressIndicator() : Text('Data Loaded!'),
            // const Text('R E C E N T  E V E N T S'),
            CarouselSlider(
              options: CarouselOptions(
                autoPlay: true,
                aspectRatio: 2.0,
                enlargeCenterPage: true,
              ),
              items: imageSliders,
            ),
            const SizedBox(
              width: double.infinity,
              child: Text(
                "    TRENDING ARTICLES:",
                style: TextStyle(
                  fontSize: 26,
                  color: kDefaultIconDarkColor,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.left,
              ),
            ),
            const SizedBox(height: 24.0),
            Expanded(
              child: Container(
                child: ListView.builder(
                  itemCount: post.articles?.count,
                  itemBuilder: (context, index) {
                    return Container(
                      margin: const EdgeInsets.symmetric(vertical: 10),
                      child: GestureDetector(
                        onTap: () =>
                            Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => DetailScreen(
                            index: index,
                          ),
                        )),
                        child: Stack(
                          alignment: AlignmentDirectional.center,
                          children: [
                            Hero(
                              tag: "blogImage",
                              child: Container(
                                height: 300.0,
                                width: 400.0,
                                decoration: BoxDecoration(
                                    color: kDefaultIconDarkColor,
                                    borderRadius: BorderRadius.circular(24.0),
                                    image: const DecorationImage(
                                      image: AssetImage("assets/6.png"),
                                      // post.articles!.results[0].bannerImage
                                      fit: BoxFit.cover,
                                    )),
                              ),
                            ),
                            Positioned(
                              top: 24.0,
                              right: 24.0,
                              child: Hero(
                                tag: "likes",
                                child: Container(
                                  height: 34.0,
                                  width: 68.0,
                                  decoration: BoxDecoration(
                                    color:
                                        kDefaultIconDarkColor.withOpacity(0.3),
                                    borderRadius: BorderRadius.circular(50.0),
                                  ),
                                  child: Row(
                                    children: [
                                      const SizedBox(width: 6.0),
                                      Image.asset(
                                        "assets/heart.png",
                                        height: 16.0,
                                        width: 16.0,
                                      ),
                                      const SizedBox(width: 6.0),
                                      Text(
                                        post.articles?.results?[2].clapsCount
                                                .toString() ??
                                            '',
                                        style: TextStyle(
                                          fontSize: 13.0,
                                          color: kDefaultIconLightColor
                                              .withOpacity(0.75),
                                          fontFamily: "Mulish-SemiBold",
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            Positioned(
                              bottom: 0.0,
                              left: 0.0,
                              right: 0.0,
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                  vertical: 16.0,
                                  horizontal: 24.0,
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      post.articles?.results?[index].title ??
                                          '',
                                      style: const TextStyle(
                                        fontSize: 20.0,
                                        color: kDefaultIconDarkColor,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    SizedBox(height: 10.0),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Hero(
                                          tag: "BlogUserProfile",
                                          child: Image.asset(
                                            "assets/Agneesh_Dasgupta.jpg",
                                            // post.articles!.results?[0].authorInfo.profilePhoto
                                            height: 40.0,
                                            width: 40.0,
                                          ),
                                        ),
                                        SizedBox(width: 12.0),
                                        Expanded(
                                          child: Text(
                                            post.articles?.results?[index]
                                                    .authorInfo!.fullName ??
                                                '',
                                            style: TextStyle(
                                              fontSize: 15.0,
                                              color: kDefaultIconDarkColor
                                                  .withOpacity(0.8),
                                              fontFamily: "Mulish-SemiBold",
                                            ),
                                          ),
                                        ),
                                        Text(
                                          post.articles?.results?[index]
                                                  .updatedAt
                                                  ?.substring(1, 10) ??
                                              '',
                                          style: TextStyle(
                                            fontSize: 15.0,
                                            color: kDefaultIconDarkColor
                                                .withOpacity(0.8),
                                            fontFamily: "Mulish-SemiBold",
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
        bottomNavigationBar: BottomNavigationBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.event),
              label: 'My Events',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.notifications),
              label: 'Notification',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.account_circle),
              label: 'Profile',
            ),
          ],
          currentIndex: selectedIndex,
          selectedItemColor: Colors.black,
          unselectedItemColor: Colors.grey,
          onTap: _onItemTapped,
        ),
      );
      // ],
      // ),
      // SizedBox(height: 24.0),
    } else {
      triggerHotReload();
      return Text("loading...");
    }
  }
}
