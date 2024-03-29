import 'dart:convert';
// import 'dart:js';

import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:kasakai/pages/home.dart';
import '/components/my_button.dart';
import '/components/my_textfield.dart';
import '/components/square_tile.dart';
import 'package:http/http.dart' as http;

class Response {
  String? accessToken;
  String? refreshToken;
  User? user;

  Response({this.accessToken, this.refreshToken, this.user});

  Response.fromJson(Map<String, dynamic> json) {
    accessToken = json['access_token'];
    refreshToken = json['refresh_token'];
    user = json['user'] != null ? User.fromJson(json['user']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['access_token'] = accessToken;
    data['refresh_token'] = refreshToken;
    if (user != null) {
      data['user'] = user!.toJson();
    }
    return data;
  }
}

class User {
  int? pk;
  String? email;
  String? firstName;
  String? lastName;

  User({this.pk, this.email, this.firstName, this.lastName});

  User.fromJson(Map<String, dynamic> json) {
    pk = json['pk'];
    email = json['email'];
    firstName = json['first_name'];
    lastName = json['last_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['pk'] = pk;
    data['email'] = email;
    data['first_name'] = firstName;
    data['last_name'] = lastName;
    return data;
  }
}

class LoginPage extends StatelessWidget {
  LoginPage({super.key});

  // text editing controllers
  // final usernameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  // sign user in method
  // void signUserIn() async {
  //   print("yes");
  //   try {
  //     bool check;
  //     var response = await http.post(
  //         Uri.parse("https://www.kkmapi.online/api/v1/auth/login/"),
  //         body: {
  //           "username": "Username",
  //           "email": emailController.text,
  //           "password": passwordController.text,
  //         });
  //     print(response.body);
  //     Response res = Response.fromJson(jsonDecode(response.body));
  //     if (res.accessToken != null) {
  //       check = true;
  //       return check;
  //     }
  //   } catch (e) {
  //     print(e);
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(height: 50),

                // logo
                Image.asset(
                  'assets/logo.png',
                  width: 100,
                ),

                const SizedBox(height: 50),

                // welcome back, you've been missed!
                Text(
                  'Welcome User!',
                  style: TextStyle(
                    color: Colors.grey[700],
                    fontSize: 16,
                  ),
                ),

                const SizedBox(height: 25),

                // username textfield
                // MyTextField(
                //   controller: usernameController,
                //   hintText: 'Username',
                //   obscureText: false,
                // ),

                // const SizedBox(height: 10),

                // username textfield
                MyTextField(
                  controller: emailController,
                  hintText: 'Email',
                  obscureText: false,
                ),
                const SizedBox(height: 10),

                // password textfield
                MyTextField(
                  controller: passwordController,
                  hintText: 'Password',
                  obscureText: true,
                ),

                const SizedBox(height: 10),

                // forgot password?
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        'Forgot Password?',
                        style: TextStyle(color: Colors.grey[600]),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 25),

                // sign in button
                MyButton(
                  onTap: () async {
                    print("yes");
                    try {
                      var response = await http.post(
                          Uri.parse(
                              "https://www.kkmapi.online/api/v1/auth/login/"),
                          body: {
                            "username": "Username",
                            "email": emailController.text,
                            "password": passwordController.text,
                          });
                      print(response.body);
                      Response res =
                          Response.fromJson(jsonDecode(response.body));
                      // Storing the token
                      const storage = FlutterSecureStorage();
                      await storage.write(
                          key: 'auth_token', value: res.accessToken);
                      if (res.accessToken != null) {
                        // ignore: use_build_context_synchronously
                        Navigator.of(context).push(
                            MaterialPageRoute(builder: (context) => Home()));
                      }
                    } catch (e) {
                      print(e);
                    }
                  },
                ),

                const SizedBox(height: 50),

                // or continue with
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: Row(
                    children: [
                      Expanded(
                        child: Divider(
                          thickness: 0.5,
                          color: Colors.grey[400],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10.0),
                        child: Text(
                          'Or continue with',
                          style: TextStyle(color: Colors.grey[700]),
                        ),
                      ),
                      Expanded(
                        child: Divider(
                          thickness: 0.5,
                          color: Colors.grey[400],
                        ),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 50),

                // google + apple sign in buttons
                const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // google button
                    SquareTile(imagePath: 'assets/google.png'),

                    SizedBox(width: 25),

                    // apple button
                    SquareTile(imagePath: 'assets/apple.png')
                  ],
                ),

                const SizedBox(height: 50),

                // not a member? register now
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Not a member?',
                      style: TextStyle(color: Colors.grey[700]),
                    ),
                    const SizedBox(width: 4),
                    const Text(
                      'Register now',
                      style: TextStyle(
                        color: Colors.blue,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
