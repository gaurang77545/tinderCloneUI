import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class Network{
  final String _url = 'http://127.0.0.1:8000/api';
  //if you are using android studio emulator, change localhost to 10.0.2.2
  var token;


  _getToken() async {
    SharedPreferences localStorage = await SharedPreferences.getInstance();
    token = jsonDecode(localStorage.getString('token'))['token'];
  }

  authData(data, apiUrl) async {
    var fullUrl = _url + apiUrl;
    print(fullUrl);
    return await http.post(
        fullUrl,
        body: jsonEncode(data),
        headers: _setHeaders()
    );
  }

  getData(apiUrl) async {
    var fullUrl = _url + apiUrl;
    await _getToken();
    return await http.get(
        fullUrl,
        headers: _setHeaders()
    );
  }
  fetchChatData(data) async {
    var fullUrl = _url + '/chat/fetchchatdata';
    await _getToken();
    return await http.post(
        fullUrl,
        body:data,
        headers: _setHeaders()
    );
  }
  fetchMesasges(data) async {
    var fullUrl = _url + '/chat/fetchmessages';
    await _getToken();
    return await http.post(
        fullUrl,
        body:data,
        headers: _setHeaders()
    );
  }

  sendMessages(data) async {
    var fullUrl = _url + '/chat/sendmessage';
    await _getToken();
    return await http.post(
        fullUrl,
        body: jsonEncode(data),
        headers: _setHeaders()
    );
  }

  _setHeaders() => {
    'Content-type' : 'application/json',
    'Accept' : 'application/json',
    'Authorization' : 'Bearer $token'
  };

}