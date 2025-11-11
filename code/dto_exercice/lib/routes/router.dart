import 'package:dto_exercice/screens/forgot_password_screen.dart';
import 'package:dto_exercice/screens/forms/add_category_screen.dart';
import 'package:dto_exercice/screens/forms/add_product_screen.dart';
import 'package:dto_exercice/screens/home_screen.dart';
import 'package:dto_exercice/screens/login_screen.dart';
import 'package:dto_exercice/screens/single_category_screen.dart';
import 'package:dto_exercice/screens/single_product_screen.dart';
import 'package:flutter/material.dart';

Map<String, WidgetBuilder> router = {
  HomeScreen.routeName: (context) => const HomeScreen(),
  LoginScreen.routeName: (context) => const LoginScreen(),
  ForgotPasswordScreen.routeName: (context) => const ForgotPasswordScreen(),
  AddCategoryScreen.routeName: (context) => const AddCategoryScreen(),
  AddProductScreen.routeName: (context) => const AddProductScreen(),
  SingleProductScreen.routeName: (context) => const SingleProductScreen(),
  SingleCategoryScreen.routeName: (context) => const SingleCategoryScreen(),
};