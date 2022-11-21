import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:page_transition/page_transition.dart';
import 'package:flutter/material.dart';

import 'home_page.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
      splash: const Splash(),
      nextScreen: const HomePage(),
      splashTransition: SplashTransition.slideTransition,
      pageTransitionType: PageTransitionType.topToBottom,
      backgroundColor: Colors.black,
    );
  }
}

class Splash extends StatefulWidget {
  const Splash({Key? key}) : super(key: key);

  @override
  SplashState createState() => SplashState();
}

class SplashState extends State<Splash> {
  @override
  void initState() {
    super.initState();
    _navigateToHome();
  }

  _navigateToHome() async {
    await Future.delayed(const Duration(seconds: 30));
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).devicePixelRatio,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          buildLogo(),
          buildTmdb(),
          buildLoadingStatus(),
        ],
      ),
    );
  }

  Widget buildLogo() => const SizedBox(
        height: 50,
        child: Text(
          "Silver Screen",
          style: TextStyle(
              fontSize: 40,
              fontWeight: FontWeight.w500,
              fontStyle: FontStyle.italic,
              color: Colors.white),
        ),
      );

  Widget buildTmdb() => SizedBox(
        height: 100,
        child: Row(
          children: [
            const SizedBox(
              height: 20,
              child: Text(
                "Power By",
                style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.normal,
                    color: Colors.white),
              ),
            ),
            Container(
              height: 20,
              width: 150,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.contain,
                  image: NetworkImage(
                      'https://www.themoviedb.org/assets/2/v4/logos/v2/blue_long_2-9665a76b1ae401a510ec1e0ca40ddcb3b0cfe45f1d51b77a308fea0845885648.svg'),
                ),
              ),
            ),
          ],
        ),
      );

  Widget buildLoadingStatus() => const SizedBox(
        height: 8,
        width: 300,
        child: LinearProgressIndicator(
          color: Colors.white,
          backgroundColor: Colors.black,
          minHeight: 1,
        ),
      );
}
