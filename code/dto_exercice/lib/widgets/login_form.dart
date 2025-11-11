import 'package:dto_exercice/screens/forgot_password_screen.dart';
import 'package:dto_exercice/screens/home_screen.dart';
import 'package:dto_exercice/styles/font.dart';
import 'package:dto_exercice/styles/spacings.dart';
import 'package:dto_exercice/widgets/text_input.dart';
import 'package:dto_exercice/widgets/w_button.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final _formKey = GlobalKey<FormState>();
  final _auth = FirebaseAuth.instance;
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  static bool passwordVisible = false;

  String? emailError;
  String? passwordError;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Padding(
        padding: const EdgeInsets.only(
            right: kHorizontalPadding,
            left: kHorizontalPadding,
            top: kVerticalPadding),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: kVerticalPaddingS),
                child: Text(
                  'CONNEXION',
                  style: kTitleForm,
                ),
              ),
            ),
            TextInput(
              controller: emailController,
              hintText: 'exemple@mail.com',
              labelText: 'Adresse mail',
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Veuillez saisir une adresse mail.';
                }
                return null;
              },
            ),
            TextInput(
                controller: passwordController,
                hintText: '*******',
                labelText: 'Mot de passe',
                obscureText: passwordVisible,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Vous n\'avez saisi aucun mot de passe';
                  }
                  return null;
                }),
            Align(
              alignment: Alignment.centerLeft,
              child: GestureDetector(
                behavior: HitTestBehavior.opaque,
                onTap: (){
                  Navigator.pushNamed(context, ForgotPasswordScreen.routeName);
                },
                child: const Padding(
                  padding: EdgeInsets.only(top: kVerticalPaddingS),
                  child: Text(
                    'Mot de passe oublié ?',
                    style: kSmallFormText,
                  ),
                ),
              ),
            ),
            Padding(
              padding:
              const EdgeInsets.symmetric(vertical: kVerticalPaddingS * 2),
              child: Align(
                alignment: Alignment.centerRight,
                child: WButton(
                  title: 'JE ME CONNECTE',
                  ontap: () async {
                    if (_formKey.currentState!.validate()) {
                      String email = emailController.text;
                      String password = passwordController.text;
                      try {
                        await _auth.signInWithEmailAndPassword(
                          email: email,
                          password: password,
                        ).then((value) {
                          ScaffoldMessenger.of(context)
                              .showSnackBar(
                            const SnackBar(
                              content: Text('Vous vous êtes connecté avec succès!'),
                              duration: Duration(seconds: 2),
                            ),
                          );

                          Navigator.pushNamed(context, HomeScreen.routeName);
                        });
                      } catch (e) {
                        if (context.mounted) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text('Erreur de connexion : $e'),
                            ),
                          );
                        }
                      }
                    }
                  },
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
