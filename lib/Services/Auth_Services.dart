import 'package:e_commerce_api/Global/ApiConstants.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

import '../Models/login_request_Model.dart'; // Pour utiliser json.decode

class ApiService {

  Future<String?> login(LoginModel loginModel) async {
    var url = Uri.parse(ApiConstants.baseUrl + ApiConstants.loginUri);
    try {
      var response = await http.post(url,
        body: loginModel.toJson(),
      );
      if (response.statusCode == 201) {

        Map<String, dynamic> jsonResponse = json.decode(response.body);
        // Vérifiez si le token est présent dans la réponse
        if (jsonResponse.containsKey('token')) {
          SharedPreferences prefs = await SharedPreferences.getInstance();
          prefs.setString('token', jsonResponse['token']);
          return jsonResponse['token'];
        } else {
          // Si le token est manquant dans la réponse, lancez une exception ou retournez null selon vos besoins
          throw Exception('Token missing in response');
        }
      } else {
        print('Request failed with status: ${response.statusCode}.');
      }
    } catch (e) {
      print(e.toString());
    }
  }



  Future<String?> Register(RegisterModel registerModel) async {
    var url = Uri.parse(ApiConstants.baseUrl + ApiConstants.loginUri);
    try {
      var response = await http.post(url,
        body: RegisterModel.toJson(),
      );
      if (response.statusCode == 201) {

        Map<String, dynamic> jsonResponse = json.decode(response.body);
        // Vérifiez si le token est présent dans la réponse
        if (jsonResponse.containsKey('token')) {
          SharedPreferences prefs = await SharedPreferences.getInstance();
          prefs.setString('token', jsonResponse['token']);
          return jsonResponse['token'];
        } else {
          // Si le token est manquant dans la réponse, lancez une exception ou retournez null selon vos besoins
          throw Exception('Token missing in response');
        }
      } else {
        print('Request failed with status: ${response.statusCode}.');
      }
    } catch (e) {
      print(e.toString());
    }
  }
}
