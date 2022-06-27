import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movies_api/lib/screens/homescrreen.dart';
import 'package:page_transition/page_transition.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';

void main() {
  runApp(ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Movies',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(

        textTheme: GoogleFonts.robotoTextTheme(
        ),
        primarySwatch: Colors.blue,
      ),
      home:  AnimatedSplashScreen(
        duration: 4000,
        splash: Image.asset('images/netflix-intro.gif',fit: BoxFit.cover,filterQuality: FilterQuality.high,),
        splashIconSize: double.infinity,
        nextScreen: homescreen(),
        splashTransition: SplashTransition.fadeTransition,
        pageTransitionType: PageTransitionType.bottomToTop,
        backgroundColor: Colors.white,

      ),
    );
  }
}