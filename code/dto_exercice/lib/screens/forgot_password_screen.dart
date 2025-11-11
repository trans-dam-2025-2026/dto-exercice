import 'package:dto_exercice/screens/login_screen.dart';
import 'package:dto_exercice/styles/colors.dart';
import 'package:dto_exercice/styles/font.dart';
import 'package:dto_exercice/styles/spacings.dart';
import 'package:dto_exercice/widgets/text_input.dart';
import 'package:dto_exercice/widgets/w_button.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({super.key});

  static const String routeName = '/forgot-password';

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  final formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
  }

  Future resetPassword(mail) async {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Mot de passe oublié', style: kMainTitlePage),
        backgroundColor: kMainColor,
      ),
      body: Padding(
        padding: const EdgeInsets.all(kHorizontalPadding),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'Entrez votre adresse e-mail pour récupérer votre mot de passe.',
              style: kLabelStyle,
            ),
            const SizedBox(height: kHorizontalPadding),
            TextInput(
              controller: _emailController,
              keyboardType: TextInputType.emailAddress,
              hintText: 'exemple@domaine.com',
              labelText: 'Adresse e-mail',
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Vous n\'avez saisi aucun mot de passe';
                }
                return null;
              },
            ),
            const SizedBox(height: kHorizontalPadding),
            WButton(
              title: 'Réinitialiser le mot de passe',
              ontap: () async {
                await FirebaseAuth.instance
                    .sendPasswordResetEmail(email: _emailController.text.trim())
                    .then(
                      (value) => {
                        showDialog<void>(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              title: const Text('Succès'),
                              content: const Text(
                                'Un e-mail de réinitialisation a été envoyé à votre adresse.',
                              ),
                              actions: <Widget>[
                                TextButton(
                                  onPressed: () {
                                    Navigator.of(
                                      context,
                                    ).pushNamed(LoginScreen.routeName);
                                  },
                                  child: const Text('Se connecter'),
                                ),
                              ],
                            );
                          },
                        ),
                      },
                    );
              },
            ),
          ],
        ),
      ),
    );
  }
}
