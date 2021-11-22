import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:newsapp/profile_page/profile_page.dart';

import 'package:newsapp/services/api/news.dart';
import 'package:newsapp/services/article_model.dart';
import 'package:newsapp/news_section.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    Widget divider() {
      return const Divider(
        indent: 8,
        endIndent: 8,
        thickness: 1,
        color: Colors.grey,
      );
    }

    return DefaultTabController(
      length: 8,
      child: Scaffold(
          appBar: AppBar(
            bottom: const TabBar(
              isScrollable: true,
              indicatorColor: Colors.white,
              indicatorPadding: EdgeInsets.all(10),
              tabs: [
                Tab(
                  text: "For you",
                ),
                Tab(text: "Trending"),
                Tab(text: "Sports"),
                Tab(text: "International"),
                Tab(text: "Cricket"),
                Tab(text: "Football"),
                Tab(text: "Technology"),
                Tab(text: "Politics"),
              ],
            ),
            title: Text(
              "Tink NEWS",
              style: GoogleFonts.lobsterTwo(
                  fontSize: 28,
                  fontWeight: FontWeight.w300,
                  color: Colors.white),
            ),
            backgroundColor: Color.fromARGB(255, 36, 45, 60),
            elevation: 0,
            centerTitle: true,
            leading: IconButton(
              icon: const CircleAvatar(
                backgroundImage: AssetImage(
                  "assets/Asif.jpg",
                ),
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Profile_Page()),
                );
              },
            ),
            actions: [
              IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.share,
                  color: Colors.white,
                ),
              )
            ],
          ),
          body: CustomNewsTile()),
    );
  }
}
