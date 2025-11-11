import 'package:dto_exercice/styles/colors.dart';
import 'package:dto_exercice/widgets/login_form.dart';
import 'package:dto_exercice/widgets/register_form.dart';
import 'package:dto_exercice/widgets/separate_form.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  static final String routeName = '/login';

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kMainColor,
        title: Text('MyFruitz'),
      ),
      body: Center(
        child: SizedBox(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                LoginForm(),
                SeparatorForm(),
                RegisterForm(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
