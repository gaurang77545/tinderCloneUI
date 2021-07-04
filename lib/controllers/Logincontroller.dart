import 'package:get/get.dart';
import 'package:tinder/models/login.dart';

class MyControllerLogin extends GetxController {
  var login = Login(email: 'gaurangshah4@gmail.com', password: 'sdsdsd');
  void setEmailAndPassword(String email, String password) {
    login.email = email;
    login.password = password;
    update();
  }

  Map<String, Object> getEmailAndPassword() {
    Map<String, Object> emailPassword = {
      'email': login.email,
      'password': login.password
    };
    return emailPassword;
  }
}
