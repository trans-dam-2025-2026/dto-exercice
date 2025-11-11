import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:push_data_firestore/screens/home.dart';
import 'package:push_data_firestore/styles/colors.dart';
import 'package:push_data_firestore/styles/fonts.dart';
import 'package:push_data_firestore/styles/spacings.dart';

import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await FirebaseAuth.instance.setLanguageCode("fr");
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        floatingActionButtonTheme: const FloatingActionButtonThemeData(
          backgroundColor: kMainColor,
          foregroundColor: kBackgroundColor,
        ),
        colorScheme: const ColorScheme(
          primary: kMainColor,
          secondary: kSecondaryColor,
          surface: kBackgroundColor,
          error: kErrorColor,
          onPrimary: kBackgroundColor,
          onSecondary: kBackgroundColor,
          onSurface: kMainColor,
          onError: kMainColor,
          brightness: Brightness.dark,
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ButtonStyle(
            backgroundColor: WidgetStateProperty.all(kMainColor),
            foregroundColor: WidgetStateProperty.all(kBackgroundColor),
            textStyle: WidgetStateProperty.all(kButtonStyle),
            padding: WidgetStateProperty.all(
              const EdgeInsets.symmetric(
                horizontal: kHorizontalPadding,
                vertical: kVerticalPaddingS,
              ),
            ),
          ),
        ),
        useMaterial3: true,
      ),
      home: const Home(title: 'Initialiser les données'),
    );
  }
}
