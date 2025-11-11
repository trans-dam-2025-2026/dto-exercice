import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dto/dto.dart';
import 'package:dto/models/user.dart';
import 'package:dto_exercice/screens/home_screen.dart';
import 'package:dto_exercice/styles/font.dart';
import 'package:dto_exercice/styles/spacings.dart';
import 'package:dto_exercice/widgets/text_input.dart';
import 'package:dto_exercice/widgets/w_button.dart';
import 'package:firebase_auth/firebase_auth.dart' hide User;
import 'package:flutter/material.dart';

class RegisterForm extends StatefulWidget {
  const RegisterForm({super.key});

  @override
  State<RegisterForm> createState() => _RegisterFormState();
}

class _RegisterFormState extends State<RegisterForm> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  static bool passwordVisible = false;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: kHorizontalPadding,
          vertical: kVerticalPaddingL,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: kVerticalPaddingS),
                child: Text('INSCRIPTION', style: kTitleForm),
              ),
            ),
            TextInput(
              controller: firstNameController,
              textCapitalization: TextCapitalization.words,
              hintText: 'John',
              labelText: 'Prénom',
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Veuillez entrer votre prénom';
                }
                return null;
              },
            ),
            const SizedBox(height: kVerticalPadding),
            TextInput(
              controller: lastNameController,
              hintText: 'Doe',
              labelText: 'Nom',
              textCapitalization: TextCapitalization.words,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Veuillez entrer votre nom';
                }
                return null;
              },
            ),
            const SizedBox(height: kVerticalPadding),
            TextInput(
              controller: emailController,
              keyboardType: TextInputType.emailAddress,
              hintText: 'johndoe@johndoe.com',
              labelText: 'Adresse mail',
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Veuillez entrer une adresse mail';
                }
                return null;
              },
            ),
            const SizedBox(height: kVerticalPadding),
            TextInput(
              controller: passwordController,
              keyboardType: TextInputType.visiblePassword,
              hintText: '*******',
              labelText: 'Mot de passe',
              obscureText: !passwordVisible,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Veuillez entrer un mot de passe';
                }
                return null;
              },
            ),
            const SizedBox(height: kVerticalPadding),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: kVerticalPaddingS),
              child: Align(
                alignment: Alignment.centerRight,
                child: WButton(
                  title: 'CRÉER MON COMPTE',
                  ontap: () async {
                    if (_formKey.currentState!.validate()) {
                      final db = FirestoreODM(
                        appSchema,
                        firestore: FirebaseFirestore.instance,
                      );

                      try {
                        String email = emailController.text;
                        String password = passwordController.text;
                        String firstName = firstNameController.text;
                        String lastName = lastNameController.text;
                        final createdAt = DateTime.now();

                        await FirebaseAuth.instance
                            .createUserWithEmailAndPassword(
                              email: email,
                              password: password,
                            )
                            .then((authResult) async {
                              String uid = authResult.user!.uid;

                              await db.users
                                  .insert(
                                    User(
                                      id: uid,
                                      firstName: firstName,
                                      lastName: lastName,
                                      email: email,
                                      createdAt: createdAt,
                                    ),
                                  )
                                  .then((onValue) async {
                                    Navigator.pushNamed(
                                      context,
                                      HomeScreen.routeName,
                                    );
                                  });
                            });
                      } on FirebaseAuthException catch (e) {
                        print("FirebaseAuthException: ${e.code}");
                      } catch (e) {
                        print("Autre erreur: $e");
                      }
                    }
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
