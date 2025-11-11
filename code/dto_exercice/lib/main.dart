import 'package:dto_exercice/routes/router.dart';
import 'package:dto_exercice/screens/home_screen.dart';
import 'package:dto_exercice/screens/login_screen.dart';
import 'package:dto_exercice/styles/colors.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'DTO Exercice',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: kMainColor),
      ),
      routes: router,
      initialRoute: FirebaseAuth.instance.currentUser != null ? HomeScreen.routeName : LoginScreen.routeName,
    );
  }
}
