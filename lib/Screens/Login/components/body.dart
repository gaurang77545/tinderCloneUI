import 'package:flutter/material.dart';
import 'package:tinder/controllers/Logincontroller.dart';
import '/Screens/Login/components/background.dart';
import '/Screens/Signup/signup_screen.dart';
import '/components/already_have_an_account_acheck.dart';
import '/components/rounded_button.dart';
import '/components/rounded_input_field.dart';
import '/components/rounded_password_field.dart';
import 'package:flutter_svg/svg.dart';
import '/main.dart';
import 'package:get/get.dart';

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  var email = '';

  var pass = '';

  MyControllerLogin myController = Get.put(MyControllerLogin());

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Background(
      child: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                "LOGIN",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              SizedBox(height: size.height * 0.03),
              SvgPicture.asset(
                "assets/icons/login.svg",
                height: size.height * 0.35,
              ),
              SizedBox(height: size.height * 0.03),
              Obx(
                () => RoundedInputField(
                  icon: Icons.email,
                  hintText: "Your Email",
                  onChanged: (value) {
                    email = '$value';
                  },
                  validator: (value) {
                    if (RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                            .hasMatch(value) ==
                        false) {
                      return 'Enter a valid email';
                    }
                    email = value;
                    return null;
                  },
                ),
              ),
              RoundedPasswordField(
                onChanged: (value) {
                  pass = '$value';
                },
                validator: (passwordValue) {
                  if (passwordValue.isEmpty) {
                    return 'Please enter some text';
                  }
                  return null;
                },
              ),
              RoundedButton(
                  text: "LOGIN",
                  press: () {
                    if (_formKey.currentState.validate()) {
                      myController.setEmailAndPassword(email, pass);
                      Navigator.popAndPushNamed(
                        context,
                        MyHomePage.routeName,
                      );
                      Get.back();
                      Get.to(MyHomePage());
                    }
                  }),
              SizedBox(height: size.height * 0.03),
              AlreadyHaveAnAccountCheck(
                press: () {
                  Get.to(SignUpScreen());
                },
              ),
              SizedBox(
                height: 10,
              )
            ],
          ),
        ),
      ),
    );
  }
}
