import 'package:flutter/material.dart';
import 'package:tinder/Screens/Login/login_screen.dart';
import 'package:tinder/Screens/Message/IndvChat/chat.dart';
import 'package:tinder/Screens/Signup/signup_screen.dart';
import 'package:tinder/Screens/Welcome/welcome_screen.dart';
import './cards.dart';
import './matches.dart';
import './profiles.dart';
import 'Screens/Message/message.dart';
import 'Screens/Profile/profile.dart';
import 'Screens/Splash_screen/splash.dart';
import 'Screens/myhomepage.dart';
//Files Imported
void main() => runApp(MyApp());

final MatchEngine matchEngine = new MatchEngine(
    matches: demoProfiles.map((Profile profile) {
  return Match(profile: profile);
}).toList());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primaryColorBrightness: Brightness.light,
        primarySwatch: Colors.blue,
      ),
      home: SplashScreen(),
      routes: {

        LoginScreen.routeName: (ctx) => LoginScreen(),
        SignUpScreen.routeName: (ctx) => SignUpScreen(),
        MyHomePage.routeName: (ctx) => MyHomePage(),
        ProfileScreen.routeName: (ctx) => ProfileScreen(),
        Chatpage.routeName: (ctx) => Chatpage(name: 'CHATS')
      },
    );
  }
}

