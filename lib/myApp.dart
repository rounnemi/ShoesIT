import 'package:e_commerce_api/pages/home_page.dart';
import 'package:e_commerce_api/pages/login_page.dart';
import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      themeMode: ThemeMode.light,
      initialRoute: '/Login',
      routes: {
        '/': (context) => HomePage(),
        '/Login': (context) => LoginPage(),
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
