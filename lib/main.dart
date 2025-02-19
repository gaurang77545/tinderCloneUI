import 'package:flutter/material.dart';
import 'package:tinder/Screens/Login/login_screen.dart';
import 'package:tinder/Screens/Message/IndvChat/chat.dart';
import 'package:tinder/Screens/Signup/signup_screen.dart';
import 'package:tinder/Screens/Splash_screen/splash.dart';
import 'package:tinder/Screens/Welcome/welcome_screen.dart';
import './cards.dart';
import './matches.dart';
import './profiles.dart';
import 'Screens/Message/message.dart';
import 'Screens/Profile/profile.dart';
import 'Screens/Profile/editProfile/edit.dart';
import 'package:get/get.dart';

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
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primaryColorBrightness: Brightness.light,
        primarySwatch: Colors.blue,
      ),
      home: SplashScreen(),
      getPages: [
        GetPage(name: '/', page: () => SplashScreen()),
        GetPage(name: WelcomeScreen.routeName, page: () => WelcomeScreen()),
        GetPage(name: LoginScreen.routeName, page: () => LoginScreen()),
        GetPage(name: SignUpScreen.routeName, page: () => SignUpScreen()),
        GetPage(name: MyHomePage.routeName, page: () => MyHomePage()),
        GetPage(name: ProfileScreen.routeName, page: () => ProfileScreen()),
        GetPage(name: Chatpage.routeName, page: () => Chatpage(name: 'CHATS')),
        GetPage(name: EditProfilePage.routeName, page: () => EditProfilePage()),
      ],
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;
  static const routeName = './HomePage';

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Match match = new Match();

  Widget _buildAppBar() {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0.0,
      centerTitle: true,
      leading: new IconButton(
        icon: new Icon(
          Icons.person,
          color: Colors.grey,
          size: 40.0,
        ),
        onPressed: () {
          Get.back();
          Get.to(ProfileScreen());
        },
      ),
      actions: <Widget>[
        new IconButton(
          icon: new Icon(
            Icons.chat_bubble,
            color: Colors.grey,
            size: 40.0,
          ),
          onPressed: () {
            Get.back();
            Get.to(MessageScreen());
          },
        ),
      ],
    );
  }

  Widget _buildBottomBar() {
    return BottomAppBar(
        color: Colors.transparent,
        elevation: 0.0,
        child: new Padding(
          padding: const EdgeInsets.all(16.0),
          child: new Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              new RoundIconButton.small(
                icon: Icons.refresh,
                iconColor: Colors.orange,
                onPressed: () {},
              ),
              new RoundIconButton.large(
                icon: Icons.clear,
                iconColor: Colors.red,
                onPressed: () {
                  matchEngine.currentMatch.nope();
                  matchEngine.cycleMatch();
                },
              ),
              new RoundIconButton.small(
                icon: Icons.star,
                iconColor: Colors.blue,
                onPressed: () {
                  matchEngine.currentMatch.superLike();
                  matchEngine.cycleMatch();
                },
              ),
              new RoundIconButton.large(
                icon: Icons.favorite,
                iconColor: Colors.green,
                onPressed: () {
                  matchEngine.currentMatch.like();
                  matchEngine.cycleMatch();
                },
              ),
              new RoundIconButton.small(
                icon: Icons.lock,
                iconColor: Colors.purple,
                onPressed: () {},
              ),
            ],
          ),
        ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: new CardStack(
        matchEngine: matchEngine,
      ),
      bottomNavigationBar: _buildBottomBar(),
    );
  }
}

class RoundIconButton extends StatelessWidget {
  final IconData icon;
  final Color iconColor;
  final double size;
  final VoidCallback onPressed;
  final Color bgColor;

  RoundIconButton.large({
    this.icon,
    this.iconColor,
    this.onPressed,
    this.bgColor = Colors.white,
  }) : size = 70.0;

  RoundIconButton.small({
    this.icon,
    this.iconColor,
    this.onPressed,
    this.bgColor = Colors.white,
  }) : size = 60.0;

  RoundIconButton({
    this.icon,
    this.iconColor,
    this.size,
    this.onPressed,
    this.bgColor = Colors.white,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration:
          new BoxDecoration(shape: BoxShape.circle, color: bgColor, boxShadow: [
        new BoxShadow(color: const Color(0x11000000), blurRadius: 10.0),
      ]),
      child: new RawMaterialButton(
        shape: new CircleBorder(),
        elevation: 0.0,
        child: new Icon(
          icon,
          color: iconColor,
        ),
        onPressed: onPressed,
      ),
    );
  }
}
