import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:trii_examen_ep/src/pages/home_page.dart';

import 'package:trii_examen_ep/src/pages/splash_screen.dart';
import 'package:trii_examen_ep/src/services/auth_service.dart';

import 'package:trii_examen_ep/src/services/login_form_provider.dart';
import 'package:trii_examen_ep/src/pages/login_page.dart';

import 'src/services/morty_service.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => mortyService()),
        ChangeNotifierProvider(create: (_) => AuthService()),
        ChangeNotifierProvider(create: (_) => LoginFormProvider()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: '/splashScreen',
        routes: {
          '/splashScreen': (BuildContext context) => const SplashScreen(),
          '/login': (BuildContext context) => const LoginPage(),
          '/home': (BuildContext context) => HomePage(),
        },
      ),
    );
  }
}
