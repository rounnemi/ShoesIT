import 'package:flutter/material.dart';
import 'package:otp_text_field_v2/otp_field_v2.dart';
import '../Models/Register_request_Model.dart';
import 'package:get/get.dart';
import '../Services/Auth_Services.dart';
import '../Widget/otp_txt_field.dart';
import 'login_page.dart';

class RegisterPage extends StatefulWidget {
  RegisterPage({Key? key}) : super(key: key);

  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final OtpFieldControllerV2 otpController = OtpFieldControllerV2();

  int? otpEntered;
  int? otpSended;

  void registerHandler() async {
    if (otpEntered != null && otpSended != null && otpEntered == otpSended){

     String? token = await ApiService.Register(
         RegisterModel(username: usernameController.text, password: passwordController.text)
     );
     if (token != null) {
       Get.snackbar('Welcome', 'Spend a good time !  ',
           colorText: Colors.green);
       ApiService.OTPfield =false;
       setState(() {

       });
       Navigator.pushReplacementNamed(context, '/HomePage', arguments: token);

     }
  }
    else {
      Get.snackbar('Error', 'Please Verify the Validation Code  ',
          colorText: Colors.red);
    }
  }

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
    return Scaffold(
      appBar: AppBar(
        title: Text("Register"),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding:  EdgeInsets.only(left:  width *  0.1 , top: height*0.15 , right:  width *  0.1),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Center(
                child :Text(
                'Create Your Account ! ',
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                  color: Colors.deepPurple,
                ),
              ),),
              const SizedBox(height: 15),
              TextField(
                controller: usernameController,
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  prefixIcon: const Icon(Icons.person),
                  labelText: 'Your Name',
                  hintText: 'Your Name',
                ),
              ),
              const SizedBox(height: 15),
              TextField(
                controller: passwordController,
                keyboardType: TextInputType.visiblePassword,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  prefixIcon: const Icon(Icons.phone_iphone),
                  labelText: 'Your Password',
                  hintText: '**********',
                ),
              ),
              const SizedBox(height: 15),
              Visibility(
                visible: ApiService.OTPfield,
                child: Column(
                  children: [
                    const SizedBox(height: 15),
                    OtpTextField(
                      otpController: otpController,
                      visible: ApiService.OTPfield,
                      onComplete: (otp) {
                        setState(() {
                          otpEntered = int.tryParse(otp!);
                        });
                      },
                    ),
                    const SizedBox(height: 15),
                  ],
                ),
              ),
              const SizedBox(height: 15),

              ElevatedButton(
                onPressed: () async {
                  if (ApiService.OTPfield) {
                    registerHandler();
                  } else {
                    if(usernameController.text.isEmpty) {
                      Get.snackbar('Error', 'Please enter your information ',
                          colorText: Colors.red);
                    }
                    else
                      {
                        int? otpResponse = await ApiService.SendOtp(usernameController.text);
                        otpSended = otpResponse;
                        setState(() {
                        });
                      }
                    }
                },
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.white,
                  backgroundColor: Colors.deepPurple,
                ),
                child: Text(ApiService.OTPfield ? "Register" : "Send Verification Code"),
              ),
              const SizedBox(height: 15),
              TextButton(
                onPressed: () {
                  ApiService.OTPfield=false;
                  setState(() {

                  });
                  Get.to(LoginPage());
                },
                child: const Text("Login"),
              )
            ],
          ),
        ),
      ),
    );
  }
}
