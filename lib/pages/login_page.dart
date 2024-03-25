import 'package:e_commerce_api/pages/register_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import '../Models/login_request_Model.dart';

import '../Services/Auth_Services.dart';

class LoginPage extends StatelessWidget {
   LoginPage({super.key});

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery
        .of(context)
        .size
        .width;
    double height = MediaQuery
        .of(context)
        .size
        .height;

    loginHandler() async {
      String? token = await ApiService.login(
          LoginModel(username: emailController.text, password: passwordController.text)
      );
      print(token);
      if (token != null) {
        Navigator.pushReplacementNamed(context, '/HomePage', arguments: token);
      } else {
      }
    }


    return Scaffold(
        appBar: AppBar(
          title: Text("Login"),
        ),
      body:
      SingleChildScrollView(
        child: Padding(
        padding:  EdgeInsets.only(left:  width *  0.1 , top: height*0.15 , right:  width *  0.1),
           child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,

            children: [
              const Text(
                'Welcome Back',
                style:  TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    color: Colors.deepPurple
                ),
              ),
              const SizedBox(height: 20) ,
              TextField(
                controller: emailController,
                keyboardType:  TextInputType.emailAddress,
                decoration:InputDecoration(
                    border: OutlineInputBorder (
                        borderRadius: BorderRadius.circular(12)
                    ),
                    prefixIcon: const Icon(Icons.person),
                    labelText: 'name@gmail.com',
                    hintText: 'name@gmail.com'
                ),
              ),
              const SizedBox(height: 20,),
              TextField(
                controller: passwordController,
                keyboardType:  TextInputType.visiblePassword,
                decoration:InputDecoration(
                    border: OutlineInputBorder (
                        borderRadius: BorderRadius.circular(12)
                    ),
                    prefixIcon: const Icon(Icons.password),
                    labelText: 'Password',
                    hintText: 'Password'
                ),
              ),
              const SizedBox(height: 30,),
              ElevatedButton(
                  onPressed :()
                  {
                    loginHandler();
                  },
                  style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.white,
                      backgroundColor: Colors.deepPurple
                  ),
                  child : const Text('Login')),
              const SizedBox(height: 10,),
              TextButton(
                onPressed: () {
                  Get.to(RegisterPage());
                },
                child: const Text("Register"),
              )
            ],

          ),
        ),
      )
    );
  }
}
