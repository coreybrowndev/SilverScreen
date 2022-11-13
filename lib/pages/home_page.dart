import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
// import 'package:silver_screen/pages/suggestion_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 2;

  final tabs = [
    //Saved
    const Center(child: Text("Watch Later")),

    //Trending List
    // const TrendingList(),

    //Profile
    const Center(child: Text("Profile")),

    //Suggestion
    // const SuggestionPage(),

    //Likes
    const Center(child: Text("My List")),
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
            fit: BoxFit.cover,
            image: NetworkImage(
                'https://sweetclipart.com/multisite/sweetclipart/files/circles_pattern_black_white.png')),
      ),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 16, sigmaY: 16),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          //Logo and page title
          appBar: AppBar(
            elevation: 0,
            backgroundColor: Colors.transparent,
            title: buildTitle(),
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
                  GButton(icon: Icons.bolt_outlined, text: "Trending"),
                  GButton(icon: Icons.assignment_ind, text: "Profile"),
                  GButton(icon: Icons.lightbulb_outline, text: "For You"),
                  GButton(icon: Icons.favorite_border, text: "Likes"),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget buildTitle() => Row(
        children: const [
          SizedBox(width: 4),
          Text(
            "Silver Screen",
            style: TextStyle(
                fontSize: 35,
                fontWeight: FontWeight.w500,
                fontStyle: FontStyle.italic,
                color: Colors.white),
          ),
        ],
      );
}
