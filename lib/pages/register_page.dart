import 'package:flutter/material.dart';
import '../Models/Register_request_Model.dart';

import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../Services/Auth_Services.dart';
import 'login_page.dart';

class RegisterPage extends StatelessWidget {
   RegisterPage({super.key});
  final TextEditingController usernameController = new TextEditingController();
  final TextEditingController passwordController = new TextEditingController();



   @override
  Widget build(BuildContext context) {
     RegisterHander() async {
       String? token = await ApiService().Register(
           RegisterModel(username: usernameController.text, password: passwordController.text)
       );
       if (token != null) {
         Navigator.pushReplacementNamed(context, '/HomePage', arguments: token);
       } else {
       }
     }
    double width = MediaQuery
        .of(context)
        .size
        .width;
    double height = MediaQuery
        .of(context)
        .size
        .height;

      return Scaffold(
          appBar: AppBar(title: Text("Register"),),

          body: Container(
            margin: EdgeInsets.only(top: height * 0.1),
            padding: EdgeInsets.only(left: width * 0.1),
            width: width * 0.9,
            child: Column(
              children: [
                const Text('Create Your Account ! ',
                  style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      color: Colors.deepPurple
                  ),),
                const SizedBox(height: 15),
                TextField(
                  controller: usernameController,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12)
                      ),
                      prefixIcon: const Icon(Icons.person),
                      labelText: 'Your Name',
                      hintText: 'Your Name'),

                ),
                const SizedBox(height: 15),
                TextField(
                  controller: passwordController,
                  keyboardType: TextInputType.visiblePassword,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12)
                      ),
                      prefixIcon: const Icon(Icons.phone_iphone),
                      labelText: 'Your Password',
                      hintText: '**********'),

                ),
                const SizedBox(height: 15),

                TextButton(onPressed: RegisterHander,
                    child: const Text("Verify Email")
                ),
                SizedBox(height: 15,),
                OtpTextField(otpController: logic.otpController ,
                  visible: logic.otpFieldShow,
                  onComplete: (otp)
                  {
                    logic.otpEntred=int.tryParse(otp!);
                  },),
                SizedBox(height: 15,),
                ElevatedButton(onPressed: () {
                  if(logic.otpFieldShow)
                    logic.register();
                  else
                    logic.sendOtp();


                },
                    style: ElevatedButton.styleFrom(
                        foregroundColor: Colors.white,
                        backgroundColor: Colors.deepPurple
                    ),
                    child: Text(logic.otpFieldShow ? "Register ": "send OTP")
                ),

                const SizedBox(height: 15),

                TextButton(onPressed: () {
                  Get.to(LoginPage());
                },
                    child: const Text("Login"))
              ],
            ),

          )
      );

  }
}
