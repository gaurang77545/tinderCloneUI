import 'package:flutter/material.dart';
import 'package:tinder/main.dart';

class ProfileScreen extends StatelessWidget {
  static const routeName = './ProfileScreen';
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        centerTitle: true,
        leading: new IconButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) =>
                      MyHomePage(title: 'Flutter Demo Home Page')),
            );
          },
          icon: Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
        ),
        title: new Text(
          "PROFILE",
          style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
          textAlign: TextAlign.center,
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Container(
              width: double.infinity,
              height: size.height / 5,
              child: Container(
                alignment: Alignment(0.0, 2.5),
                child: CircleAvatar(
                  backgroundImage: NetworkImage("img1.jpg"),
                  radius: 60.0,
                ),
              ),
            ),
            SizedBox(
              height: 40,
            ),
            Text(
              "Karthik, 20",
              style: TextStyle(
                  fontSize: 25.0,
                  color: Colors.black,
                  letterSpacing: 2.0,
                  fontWeight: FontWeight.w700),
            ),
            SizedBox(
              height: 10,
            ),
            /* Text(
              "Maharashtra, India",
              style: TextStyle(
                  fontSize: 18.0,
                  color: Colors.black45,
                  letterSpacing: 2.0,
                  fontWeight: FontWeight.w300),
            ),*/
            /* SizedBox(
              height: 10,
            ),
            Text(
              "BIO",
              style: TextStyle(
                  fontSize: 15.0,
                  color: Colors.black45,
                  letterSpacing: 2.0,
                  fontWeight: FontWeight.w300),
            ),*/
            /*SizedBox(
              height: 10,
            ),*/
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  RoundIconButton.small(
                    onPressed: () {},
/*
                    bgColor: Colors.white,
*/
                    icon: Icons.settings,
                    iconColor: Colors.blueGrey,
/*
                    info: 'SETTINGS',
*/
                  ),
                  RoundIconButton.large(
                    icon: Icons.camera_alt_outlined,
                    iconColor: Colors.white,
                    /*   bgColor: Colors.redAccent,
                    info: 'ADD MEDIA',*/
                  ),
                  RoundIconButton.small(
/*
                    bgColor: Colors.white,
*/
                    icon: Icons.edit,
                    iconColor: Colors.blueGrey,
/*
                    info: 'EDIT INFO',
*/
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
