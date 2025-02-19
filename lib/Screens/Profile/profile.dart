import 'package:flutter/material.dart';
import 'package:tinder/controllers/SignUpController.dart';
import 'package:tinder/main.dart';
import 'editProfile/edit.dart';
import 'package:get/get.dart';
import '../../constants.dart';
import 'package:get/get.dart';

class ProfileScreen extends StatelessWidget {
  static const routeName = './ProfileScreen';
  SignupController myController = Get.put(SignupController());
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
            Get.back();
            Get.to(MyHomePage(title: 'Flutter Demo Home Page'));
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
      body: Padding(
        padding: EdgeInsets.only(bottom: 220),
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: double.infinity,
                height: size.height / 5,
                child: Container(
                  alignment: Alignment(0.0, 2.5),
                  child: CircleAvatar(
                    backgroundImage: NetworkImage(
                        "https://randomuser.me/api/portraits/women/50.jpg"),
                    radius: 60.0,
                  ),
                ),
              ),
              SizedBox(
                height: 40,
              ),
              Obx(
                () => Text(
                  "${myController.signup.value.fName}, ${myController.signup.value.age}",
                  style: TextStyle(
                      fontSize: 25.0,
                      color: Colors.black,
                      letterSpacing: 2.0,
                      fontWeight: FontWeight.w700),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Column(
                      children: [
                        RoundIconButton.small(
                          onPressed: () {},
                          icon: Icons.settings,
                          iconColor: Colors.blueGrey,
                        ),
                        IconTextInfo(
                          text: 'SETTINGS',
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        RoundIconButton.large(
                          icon: Icons.camera_alt_outlined,
                          iconColor: Colors.white,
                          bgColor: Colors.redAccent,
                        ),
                        IconTextInfo(
                          text: 'ADD MEDIA',
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        RoundIconButton.small(
                          icon: Icons.edit,
                          iconColor: Colors.blueGrey,
                          onPressed: () {
                            Get.to(EditProfilePage());
                          },
                        ),
                        IconTextInfo(
                          text: 'EDIT INFO',
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class IconTextInfo extends StatelessWidget {
  final String text;

  const IconTextInfo({Key key, this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: kIconInfoTextStyle,
    );
  }
}
