import 'package:flutter/material.dart';
import 'home.dart';

class DetailScreen extends StatefulWidget {
  var index;
  DetailScreen({super.key, required this.index});

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                Hero(
                  tag: "blogImage",
                  child: Image.asset(
                    "assets/1.png",
                    height: 400.0,
                    width: 500.0,
                    fit: BoxFit.cover,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    top: 64.0,
                    bottom: 0.0,
                    left: 24.0,
                    right: 24.0,
                  ), // EdgeInsets.only
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        height: 40.0,
                        width: 40.0,
                        child: GestureDetector(
                          onTap: () => Navigator.of(context).pop(),
                          child: Icon(
                            Icons.arrow_back_ios_new_rounded,
                            color: Colors.white,
                          ),
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
            Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 16.0,
                horizontal: 24.0,
              ),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Container(
                          width: 200.0,
                          child: Text(
                            post.articles!.results?[widget.index].title ?? '',
                            style: TextStyle(
                                fontSize: 24.0,
                                color: kDefaultIconDarkColor,
                                fontWeight: FontWeight.bold),
                          )),
                      Hero(
                        tag: "likes",
                        child: Container(
                          height: 34.0,
                          width: 68.0,
                          decoration: BoxDecoration(
                            color: kDefaultIconDarkColor.withOpacity(0.3),
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
                                post.articles!.results?[widget.index].clapsCount
                                        .toString() ??
                                    '',
                                style: TextStyle(
                                  fontSize: 13.0,
                                  color:
                                      kDefaultIconDarkColor.withOpacity(0.75),
                                  fontFamily: "Mulish-SemiBold",
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  Divider(
                    thickness: 1.0,
                    color: kDefaultIconDarkColor.withOpacity(0.08),
                    height: 32.0,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                          post.articles?.results?[2].authorInfo!.fullName ?? '',
                          style: TextStyle(
                            fontSize: 15.0,
                            color: kDefaultIconDarkColor.withOpacity(0.8),
                            fontFamily: "Mulish-SemiBold",
                          ),
                        ),
                      ),
                      Text.rich(
                        TextSpan(
                          children: [
                            WidgetSpan(
                              alignment: PlaceholderAlignment.middle,
                              child: Icon(
                                Icons.add_rounded,
                              ),
                            ),
                            TextSpan(text: "   "),
                            TextSpan(
                              text: "Follow",
                              style: TextStyle(
                                fontSize: 15.0,
                                color: kDefaultIconDarkColor.withOpacity(0.8),
                                fontFamily: "Mulish-SemiBold",
                              ),
                            ),
                          ],
                        ),
                      ),
                      // Text(
                      //   post.articles?.results?[2].updatedAt
                      //           ?.substring(1, 10) ??
                      //       '',
                      //   style: TextStyle(
                      //     fontSize: 15.0,
                      //     color: kDefaultIconDarkColor.withOpacity(0.8),
                      //     fontFamily: "Mulish-SemiBold",
                      //   ),
                      // ),
                    ],
                  ),
                  Divider(
                    thickness: 1.0,
                    color: kDefaultIconDarkColor.withOpacity(0.08),
                    height: 32.0,
                  ),
                  Text(
                    post.articles!.results?[2].body ?? '',
                    style: TextStyle(
                      fontSize: 15.0,
                      color: kDefaultIconDarkColor,
                      fontFamily: "Mulish-SemiBold",
                    ),
                  ),
                  Container(
                    height: 64.0,
                    width: 400.0,
                    margin: EdgeInsets.only(top: 16.0),
                    padding: EdgeInsets.symmetric(horizontal: 16.0),
                    decoration: BoxDecoration(
                      color: kDefaultIconLightColor,
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                    child: Row(
                      children: [
                        Container(
                          height: 32.0,
                          width: 32.0,
                          padding: EdgeInsets.all(9.0),
                          margin: EdgeInsets.only(right: 16.0),
                          decoration: BoxDecoration(
                            color: kDefaultIconLightColor,
                            borderRadius: BorderRadius.circular(32.0),
                          ),
                          child: Icon(
                            Icons.edit,
                            size: 18.0,
                          ),
                        ),
                        Expanded(
                          child: TextField(
                            decoration: InputDecoration(
                                hintStyle: TextStyle(
                                    color: kDefaultIconDarkColor,
                                    fontFamily: "Mulish-SemiBold",
                                    fontSize: 15.0),
                                border: InputBorder.none,
                                hintText: "Write a comment ... "),
                          ),
                        ),
                        Container(
                          height: 32.0,
                          width: 32.0,
                          padding: EdgeInsets.all(9.0),
                          decoration: BoxDecoration(
                            color: kDefaultIconLightColor,
                            borderRadius: BorderRadius.circular(32.0),
                          ),
                          child: Icon(Icons.send),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
