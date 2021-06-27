import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tinder/Screens/Profile/profile.dart';

class EditProfilePage extends StatefulWidget {
  static const routeName = './EditScreen';
  @override
  _EditProfilePageState createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  TextEditingController _nameController = TextEditingController();
  TextEditingController _ageController = TextEditingController();
  TextEditingController _locationController = TextEditingController();
  TextEditingController _bioController = TextEditingController();
  String gender;

  bool showPassword = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        elevation: 1,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Colors.green,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(
          "Edit Profile",
        ),
        centerTitle: true,
      ),
      body: Container(
        padding: EdgeInsets.only(left: 16, top: 25, right: 16),
        child: GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
          },
          child: ListView(
            children: [
              SizedBox(
                height: 15,
              ),
              Center(
                child: Stack(
                  children: [
                    Container(
                      width: 130,
                      height: 130,
                      decoration: BoxDecoration(
                          border: Border.all(
                              width: 4,
                              color: Theme.of(context).scaffoldBackgroundColor),
                          boxShadow: [
                            BoxShadow(
                                spreadRadius: 2,
                                blurRadius: 10,
                                color: Colors.black.withOpacity(0.1),
                                offset: Offset(0, 10))
                          ],
                          shape: BoxShape.circle,
                          image: DecorationImage(
                              fit: BoxFit.cover,
                              image: AssetImage(
                                "1.jpg",
                              ))),
                    ),
                    Positioned(
                        bottom: 0,
                        right: 0,
                        child: Container(
                          height: 40,
                          width: 40,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(
                              width: 4,
                              color: Theme.of(context).scaffoldBackgroundColor,
                            ),
                            color: Colors.green,
                          ),
                          child: Icon(
                            Icons.edit,
                            color: Colors.white,
                          ),
                        )),
                  ],
                ),
              ),
              SizedBox(
                height: 35,
              ),
              buildTextField("Full Name", 'Karthik', false, _nameController, 1),
              buildTextField("Age", '20', false, _ageController, 1),
              buildTextField(
                  "Location", 'Hyderabad', false, _locationController, 1),
              buildTextField(
                  "Bio", 'I am very expressive', false, _bioController, 3),
              AppDropdownInput(
                hintText: "Gender",
                options: ["Male", "Female"],
                value: gender,
                onChanged: (String value) {
                  setState(() {
                    gender = value;
                  });
                },
                getLabel: (String value) => value,
              ),
              SizedBox(
                height: 35,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  OutlineButton(
                    padding: EdgeInsets.symmetric(horizontal: 50),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)),
                    onPressed: () {
                      _nameController.clear();
                      _ageController.clear();
                      _locationController.clear();
                      _bioController.clear();
                    },
                    child: Text("CANCEL",
                        style: TextStyle(
                            fontSize: 14,
                            letterSpacing: 2.2,
                            color: Colors.black)),
                  ),
                  RaisedButton(
                    onPressed: () {
                      Navigator.pop(context);
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          content: Text(
                        'Successfully Edited',
                        textAlign: TextAlign.center,
                      )));
                    },
                    color: Colors.green,
                    padding: EdgeInsets.symmetric(horizontal: 50),
                    elevation: 2,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)),
                    child: Text(
                      "SAVE",
                      style: TextStyle(
                          fontSize: 14,
                          letterSpacing: 2.2,
                          color: Colors.white),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget buildTextField(String labelText, String hintText,
      bool isPasswordTextField, TextEditingController cont, int maxLn) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 25.0),
      child: TextField(
        maxLines: maxLn,
        controller: cont,
        obscureText: isPasswordTextField ? showPassword : false,
        decoration: InputDecoration(
            contentPadding: EdgeInsets.only(bottom: 3),
            //labelText: labelText,
            helperText: labelText, //Display users info before tap.
            floatingLabelBehavior: FloatingLabelBehavior.always,
            hintText: hintText,
            hintStyle: TextStyle(
              fontSize: 16,
              color: Colors.black,
            )),
      ),
    );
  }
}

class AppDropdownInput<T> extends StatelessWidget {
  final String hintText;
  final List<T> options;
  final T value;
  final String Function(T) getLabel;
  final void Function(T) onChanged;

  AppDropdownInput({
    this.hintText = 'Please select an Option',
    this.options = const [],
    this.getLabel,
    this.value,
    this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 25),
      child: FormField<T>(
        builder: (FormFieldState<T> state) {
          return InputDecorator(
            decoration: InputDecoration(
              hintText: "Male",
              hintStyle: TextStyle(
                fontSize: 16,
                color: Colors.black,
              ),
              contentPadding: EdgeInsets.only(bottom: 3),
              floatingLabelBehavior: FloatingLabelBehavior.always,
              helperText: hintText,
/*
              labelText: hintText,
*/
              /*border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(5.0)),*/
            ),
            isEmpty: value == null || value == '',
            child: DropdownButtonHideUnderline(
              child: DropdownButton<T>(
                value: value,
                isDense: true,
                onChanged: onChanged,
                items: options.map((T value) {
                  return DropdownMenuItem<T>(
                    value: value,
                    child: Text(getLabel(value)),
                  );
                }).toList(),
              ),
            ),
          );
        },
      ),
    );
  }
}
