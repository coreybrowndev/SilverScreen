import 'dart:ui';
import 'package:final_project_ss_app/pages/focused_page_title.dart';
import 'package:final_project_ss_app/pages/explore_page.dart';
import 'package:final_project_ss_app/pages/liked_page.dart';
import 'package:final_project_ss_app/pages/suggestion_page.dart';
import 'package:final_project_ss_app/pages/watch_later_page.dart';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  //set default tab to suggestion page
  int _currentIndex = 2;

  final tabs = [
    //Movies saved by user
    const WatchLaterPage(),

    //Trending List
    const ExplorePage(),

    //Suggestion from popular movies
    const SuggestionPage(),

    //Liked by user
    const LikedPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          fit: BoxFit.cover,
          image: NetworkImage(
              'https://sweetclipart.com/multisite/sweetclipart/files/circles_pattern_black_white.png'),
        ),
      ),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 16, sigmaY: 16),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          //Logo and page title
          appBar: AppBar(
            centerTitle: false,
            titleSpacing: 25,
            titleTextStyle: const TextStyle(
              color: Colors.white,
              fontSize: 48,
              fontStyle: FontStyle.italic,
              fontWeight: FontWeight.w600,
            ),
            elevation: 0,
            backgroundColor: Colors.transparent,
            title: Text(
              PageTitle().createPageTitle(_currentIndex),
            ),
          ),

          body: tabs[_currentIndex],

          //Navigation Bar
          bottomNavigationBar: Container(
            color: Colors.black,
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 15.0, vertical: 28.0),
              child: GNav(
                selectedIndex: _currentIndex,
                onTabChange: (index) {
                  setState(() {
                    _currentIndex = index;
                  });
                },
                tabBorderRadius: 25,
                backgroundColor: Colors.black,
                color: const Color.fromRGBO(237, 237, 237, 80),
                activeColor: Colors.white,
                tabBackgroundColor: Colors.grey.shade800,
                gap: 8,
                padding: EdgeInsets.all(
                  MediaQuery.of(context).size.width * .03,
                ),
                tabs: const [
                  GButton(icon: Icons.airplay, text: "Saved"),
                  GButton(icon: Icons.bolt_outlined, text: "Explore"),
                  GButton(icon: Icons.lightbulb_outline, text: "For You"),
                  GButton(icon: Icons.favorite_border, text: "Liked"),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
