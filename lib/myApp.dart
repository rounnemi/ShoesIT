import 'package:e_commerce_api/pages/home_page.dart';
import 'package:e_commerce_api/pages/login_page.dart';
import 'package:e_commerce_api/pages/register_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      themeMode: ThemeMode.light,
      initialRoute: '/Login',
      routes: {
        '/': (context) => HomePage(),
        '/Login': (context) => LoginPage(),
        '/Register' :(context) => RegisterPage(),
        '/HomePage': (context) => HomePage(),
      },
      onGenerateRoute: (settings) {
        if (settings.name == '/HomePage') {
          // Récupérez le token transmis en tant qu'argument
          final String? token = settings.arguments as String?;
          return MaterialPageRoute(
            builder: (context) => HomePage(token: token),
          );
        }
      },
    );
  }
}
