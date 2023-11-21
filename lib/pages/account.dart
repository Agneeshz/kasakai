import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;

class Account {
  int? statusCode;
  Profile? profile;

  Account({this.statusCode, this.profile});

  Account.fromJson(Map<String, dynamic> json) {
    statusCode = json['status_code'];
    profile =
        json['profile'] != null ? new Profile.fromJson(json['profile']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status_code'] = this.statusCode;
    if (this.profile != null) {
      data['profile'] = this.profile!.toJson();
    }
    return data;
  }
}

class Profile {
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

  Profile(
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

  Profile.fromJson(Map<String, dynamic> json) {
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

Account pf = Account();

void main() {
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.dark));
  runApp(const User());
}

class User extends StatelessWidget {
  const User({super.key});

  void fetchProfile() async {
    const storage = FlutterSecureStorage();
    final token = await storage.read(key: 'auth_token');
    print("artic");
    try {
      var response = await http.get(
        Uri.parse('https://www.kkmapi.online/api/v1/profiles/me/'),
        headers: {
          'Authorization': 'Bearer $token',
        },
      );
      print(response.body);
      pf = Account.fromJson(jsonDecode(response.body));
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Account page',
      theme: ThemeData(
        primarySwatch: Colors.deepOrange,
      ),
      home: const ProfileScreen(),
    );
  }
}

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            const SizedBox(height: 40),
            CircleAvatar(
              radius: 70,
              backgroundImage: AssetImage('assets/Agneesh_Dasgupta'),
            ),
            const SizedBox(height: 20),
            itemProfile(
                'Name', pf.profile?.fullName ?? "", CupertinoIcons.person),
            const SizedBox(height: 10),
            itemProfile(
                'Phone', pf.profile?.fullName ?? "", CupertinoIcons.phone),
            const SizedBox(height: 10),
            itemProfile(
                'Address', pf.profile?.city ?? "", CupertinoIcons.location),
            const SizedBox(height: 10),
            itemProfile('Email', pf.profile?.email ?? "", CupertinoIcons.mail),
            const SizedBox(
              height: 20,
            ),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.all(15),
                  ),
                  child: const Text('Edit Profile')),
            )
          ],
        ),
      ),
    );
  }

  itemProfile(String title, String subtitle, IconData iconData) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
                offset: Offset(0, 5),
                color: Colors.deepOrange.withOpacity(.2),
                spreadRadius: 2,
                blurRadius: 10)
          ]),
      child: ListTile(
        title: Text(title),
        subtitle: Text(subtitle),
        leading: Icon(iconData),
        trailing: Icon(Icons.arrow_forward, color: Colors.grey.shade400),
        tileColor: Colors.white,
      ),
    );
  }
}
