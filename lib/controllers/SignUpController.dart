import 'package:get/get.dart';
import 'package:tinder/models/signup.dart';

class SignupController extends GetxController {
  var signup = SignUp().obs;
  void setData(
      String email,
      String username,
      String fName,
      String lName,
      String gender,
      String location,
      String bio,
      String pass,
      int number,
      int age) {
    signup.update((signup) {
      signup.username = username;
      signup.age = age;
      signup.bio = bio;
      signup.email = email;
      signup.fName = fName;
      signup.gender = gender;
      signup.lName = lName;
      signup.number = number;
      signup.location = location;
      signup.number = number;
    });
  }

  Map<String, Object> getData() {
    Map<String, Object> data = {
      'email': signup.value.email,
      'password': signup.value.pass,
      'age': signup.value.age,
      'bio': signup.value.bio,
      'fName': signup.value.fName,
      'gender': signup.value.gender,
      'number': signup.value.number,
      'location': signup.value.location,
      'username': signup.value.username
    };
    return data;
  }
}
