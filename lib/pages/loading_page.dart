import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:page_transition/page_transition.dart';
import 'package:flutter/material.dart';
import 'package:final_project_ss_app/pages/home_page.dart';

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
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    super.initState();
    _returnToHome();
  }

  //Change this to call fetch movies method to see if delay will apply
  _returnToHome() async {
    await Future.delayed(const Duration(seconds: 30));
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        buildLogo(),
      ],
    );
  }

  Widget buildLogo() => Container(
        height: 48,
        child: const Text(
          "Silver Screen",
          style: TextStyle(
              fontSize: 40,
              fontWeight: FontWeight.w500,
              fontStyle: FontStyle.italic,
              color: Colors.white),
        ),
      );

  Widget buildTmdb() => Container(
        height: 20,
        child: const Text(
          'Powered by TMDB',
          style: TextStyle(
            fontSize: 14,
            color: Colors.white,
            fontStyle: FontStyle.normal,
          ),
        ),
      );

  Widget buildLoadingStatus() => const SizedBox(
        height: 20,
        width: 20,
        child: CircularProgressIndicator(
          color: Colors.white,
        ),
      );
}
