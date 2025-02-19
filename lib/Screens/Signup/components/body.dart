import 'package:flutter/material.dart';
import 'package:tinder/constants.dart';
import 'package:tinder/controllers/Logincontroller.dart';
import 'package:tinder/controllers/SignUpController.dart';
import '/Screens/Login/login_screen.dart';
import '/Screens/Signup/components/background.dart';
import '/Screens/Signup/components/or_divider.dart';
import '/Screens/Signup/components/social_icon.dart';
import '/components/already_have_an_account_acheck.dart';
import '/components/rounded_button.dart';
import '/components/rounded_input_field.dart';
import '/components/rounded_password_field.dart';
import 'package:flutter_svg/svg.dart';
import '/main.dart';
import 'package:outline_material_icons/outline_material_icons.dart';
import 'package:get/get.dart';

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  String email;
  String username;
  String fName;
  String lName;
  String gender;
  String location;
  String bio;
  String pass;
  int number;
  int age;
  final _formKey = GlobalKey<FormState>();
  List<bool> isSelected = [false, false, false];
  List<String> genderOptions = ['Male', 'Female', 'Others'];
  SignupController myController = Get.put(SignupController());
  MyControllerLogin myControllerLogin = Get.put(MyControllerLogin());
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Background(
      child: SafeArea(
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  "SIGNUP",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                SizedBox(height: size.height * 0.03),
                SvgPicture.asset(
                  "assets/icons/signup.svg",
                  height: size.height * 0.35,
                ),
                RoundedInputField(
                  icon: Icons.person,
                  //controller: _emailField;
                  hintText: "First Name",
                  onChanged: (value) {
                    fName = '$value';
                  },
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Please enter your first name';
                    }
                    return null;
                  },
                ),
                RoundedInputField(
                  icon: Icons.person,
                  //controller: _emailField;
                  hintText: "Last Name",
                  onChanged: (value) {
                    lName = '$value';
                  },
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Please enter your last name';
                    }
                    return null;
                  },
                ),
                RoundedInputField(
                  icon: Icons.account_circle,
                  //controller: _emailField;
                  hintText: "Username",
                  onChanged: (value) {
                    username = '$value';
                  },
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Please enter a username';
                    }
                    return null;
                  },
                ),
                RoundedInputField(
                  type: TextInputType.number,
                  icon: Icons.phone,
                  //controller: _emailField;
                  hintText: "Mobile Number",
                  onChanged: (value) {
                    number = int.tryParse(value);
                  },
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Please enter your mobile number';
                    }
                    if (value.length != 10) {
                      return 'Mobile Number must be of 10 digit';
                    }
                    return null;
                  },
                ),
                RoundedInputField(
                  type: TextInputType.number,
                  icon: Icons.format_list_numbered_outlined,
                  //controller: _emailField;
                  hintText: "Age",
                  onChanged: (value) {
                    age = int.tryParse(value);
                  },
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Please enter your age';
                    }
                    return null;
                  },
                ),
                RoundedInputField(
                  icon: OMIcons.person,
                  //controller: _emailField;
                  hintText: "Gender",
                  onChanged: (value) {
                    gender = '$value';
                  },
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Please enter your Gender';
                    }
                    return null;
                  },
                ),
                RoundedInputField(
                  icon: Icons.location_on,
                  //controller: _emailField;
                  hintText: "Location",
                  onChanged: (value) {
                    location = '$value';
                  },
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Please enter your location';
                    }
                    return null;
                  },
                ),
                RoundedInputField(
                  icon: Icons.info_outline,
                  //controller: _emailField;
                  hintText: "Tell us about yourself",
                  onChanged: (value) {
                    bio = '$value';
                  },
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Please enter your Bio';
                    }
                    return null;
                  },
                ),
                RoundedInputField(
                  //controller: _emailField;
                  icon: Icons.email_outlined,
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
                RoundedPasswordField(
                  // icon:Icons.password_outlined,
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
                GenderSelector(
                  genderOptions: genderOptions,
                  isSelected: isSelected,
                ),
                RoundedButton(
                  text: "SIGNUP",
                  press: () {
                    if (_formKey.currentState.validate()) {
                      myController.setData(email, username, fName, lName,
                          gender, location, bio, pass, number, age);
                      print(myController.getData());
                      myControllerLogin.setEmailAndPassword(email, pass);
                      Get.to(MyHomePage(title: 'Flutter Demo Home Page'));
                    } else {
                      return;
                    }
                  },
                ),
                SizedBox(height: size.height * 0.03),
                AlreadyHaveAnAccountCheck(
                  login: false,
                  press: () {
                    _formKey.currentState.save();

                    Get.to(LoginScreen());
                  },
                ),
                OrDivider(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    SocalIcon(
                      colour: Color(0xFF256BB3),
                      iconSrc: "assets/icons/facebook.svg",
                      press: () {},
                    ),
                    SocalIcon(
                      colour: Color(0xFF40BBF4),
                      iconSrc: "assets/icons/twitter.svg",
                      press: () {},
                    ),
                    SocalIcon(
                      colour: Color(0xFFDD4D3F),
                      iconSrc: "assets/icons/google-plus.svg",
                      press: () {},
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class GenderSelector extends StatefulWidget {
  final List<bool> isSelected;
  final List<String> genderOptions;
  //final Function initiateSignup;
  GenderSelector({this.isSelected, this.genderOptions});
  @override
  _GenderSelectorState createState() => _GenderSelectorState();
}

class _GenderSelectorState extends State<GenderSelector> {
  String messi;
  @override
  Widget build(BuildContext context) {
    //print(messi);
    return Column(
      children: [
        ToggleButtons(
          borderRadius: BorderRadius.circular(10),
          color: kPrimaryColor,
          disabledColor: kPrimaryColor,
          children: <Widget>[Text('Male'), Text('Female'), Text('Others')],
          isSelected: widget.isSelected,
          onPressed: (int index) {
            setState(() {
              for (int indexBtn = 0;
                  indexBtn < widget.isSelected.length;
                  indexBtn++) {
                if (indexBtn == index) {
                  widget.isSelected[indexBtn] = true;
                  print(widget.genderOptions.elementAt(index));
                  setState(() {
                    messi = widget.genderOptions.elementAt(index);
                  });
                } else {
                  widget.isSelected[indexBtn] = false;
                }
              }
              for (int indexBtn = widget.isSelected.length - 1;
                  indexBtn >= 0;
                  indexBtn--) {
                if (indexBtn == index) {
                  widget.isSelected[indexBtn] = true;

                  setState(() {
                    messi = widget.genderOptions.elementAt(index);
                  });
                } else {
                  widget.isSelected[indexBtn] = false;
                }
              }
            });
          },
        ),
      ],
    );
  }
}
