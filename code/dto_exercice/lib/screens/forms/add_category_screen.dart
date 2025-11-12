import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dto/dto.dart';
import 'package:dto/models/category.dart';
import 'package:dto_exercice/styles/font.dart';
import 'package:dto_exercice/styles/size.dart';
import 'package:dto_exercice/styles/spacings.dart';
import 'package:dto_exercice/widgets/text_input.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:dto_exercice/widgets/w_button.dart';
import 'package:dto_exercice/styles/colors.dart';

class AddCategoryScreen extends StatefulWidget {
  const AddCategoryScreen({super.key});

  static final String routeName = "/add-category";

  @override
  State<AddCategoryScreen> createState() => _AddCategoryScreenState();
}

class _AddCategoryScreenState extends State<AddCategoryScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Ajouter une catégorie", style: kAppbarText,),
        iconTheme: const IconThemeData(color: kWhiteColor),
        backgroundColor: kMainColor,
      ),
      body: Padding(
        padding: const EdgeInsets.all(kAllPadding),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextInput(
                controller: _nameController,
                hintText: 'Fruits',
                labelText: 'Nom de la catégorie',
                textCapitalization: TextCapitalization.words,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Veuillez entrer le nom de la catégorie';
                  }
                  return null;
                },
              ),
              const SizedBox(height: kSpaceBetween),
              TextInput(
                isTextArea: 4,
                controller: _descriptionController,
                labelText: 'Description (optionnelle)',
                hintText: 'Ex: Je suis la description de fruits',
                textCapitalization: TextCapitalization.words,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Veuillez entrer votre description de fruits';
                  }
                  return null;
                },
              ),
              const SizedBox(height: kSpaceBetween),
              WButton(
                title: "Enregistrer",
                ontap: () async {
                  if (_formKey.currentState!.validate()) {
                    final db = FirestoreODM(
                      appSchema,
                      firestore: FirebaseFirestore.instance,
                    );

                    final title = _nameController.text;
                    final description = _descriptionController.text;
                    final myUserId = FirebaseAuth.instance.currentUser!.uid;

                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
