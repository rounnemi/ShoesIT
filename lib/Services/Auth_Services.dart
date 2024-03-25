import 'package:e_commerce_api/Global/ApiConstants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

import '../Models/Register_request_Model.dart';
import '../Models/login_request_Model.dart';
class ApiService {


  static bool OTPfield = false;

  static Future<String?> login(LoginModel loginModel) async {
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
        Get.snackbar('Error', 'Enter Verify You Credentials !',
            colorText: Colors.red);      }
    } catch (e) {
      Get.snackbar('Error', 'It Occurs Errors please Retry !',
          colorText: Colors.red);    }
  }


  static Future<String?> Register(RegisterModel registerModel) async {
    if(registerModel.username.isEmpty|| registerModel.password.isEmpty) {
      Get.snackbar('Error', 'Please enter your information ',
          colorText: Colors.red);
    }
    else
      {
        var url = Uri.parse(ApiConstants.baseUrl + ApiConstants.registerUri);
        print(registerModel.toJson());
        try {
          var response = await http.post(url,
            body: registerModel.toJson(),
          );
          if (response.statusCode == 201) {
            Map<String, dynamic> jsonResponse = json.decode(response.body);
            // Vérifiez si le token est présent dans la réponse
            if (jsonResponse.containsKey('token')) {
              SharedPreferences prefs = await SharedPreferences.getInstance();
              prefs.setString('token', jsonResponse['token']);
              return jsonResponse['token'];
            }
          }
        } catch (e) {
          Get.snackbar('Error', 'It Occurs Errors please Retry !',
              colorText: Colors.red);
        }
      }
  }


  static Future<int?> SendOtp(String email) async {

    var url = Uri.parse(ApiConstants.baseUrl + ApiConstants.verifyMail);
    var verifymail = await http.post(url, body: {'email': email});
    if(verifymail.body == "false")
      {

        try {
          url = Uri.parse(ApiConstants.baseUrl + ApiConstants.sendOtp);
          var response = await http.post(url, body: {'email': email});
       OTPfield = true;
          if (response.statusCode == 201) {
            return int.parse(response.body);
          } else {
            return null;
          }
        } catch (e) {
          print(e);
          return null;
        }
      }
   else
  {
    Get.snackbar('Error', 'Enter a non-used email !',
        colorText: Colors.red);
  }

  }

}

