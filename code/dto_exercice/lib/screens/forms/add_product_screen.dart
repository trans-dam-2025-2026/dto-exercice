import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dto/dto.dart';
import 'package:dto/models/product.dart';
import 'package:dto_exercice/styles/font.dart';
import 'package:dto_exercice/styles/others.dart';
import 'package:dto_exercice/styles/size.dart';
import 'package:dto_exercice/styles/spacings.dart';
import 'package:dto_exercice/widgets/text_input.dart';
import 'package:dto_exercice/widgets/utils/category_user.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:dto_exercice/widgets/w_button.dart';
import 'package:dto_exercice/styles/colors.dart';

class AddProductScreen extends StatefulWidget {
  const AddProductScreen({super.key});

  static final String routeName = "/add-product";

  @override
  State<AddProductScreen> createState() => _AddProductScreenState();
}

class _AddProductScreenState extends State<AddProductScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _priceController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  List<DropdownMenuItem<CategoryInfo>> dropdownItems = [];
  CategoryInfo? dropdownValue;

  @override
  void initState() {
    super.initState();
    updateCategories();
  }

  Future<void> updateCategories() async {
    List<CategoryInfo> categories =
        await CategoryUser.getCategoriesForCurrentUser();

    if (!categories.any((category) => category.title == 'Pas de catégorie')) {
      categories.insert(0, CategoryInfo('NotRefered', 'Pas de catégorie'));
    }

    setState(() {
      dropdownItems = categories.map((category) {
        return DropdownMenuItem<CategoryInfo>(
          value: category,
          child: Text(category.title),
        );
      }).toList();
    });
    dropdownValue = dropdownItems.first.value;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: kWhiteColor),
        title: const Text("Ajouter un produit", style: kAppbarText,),
        backgroundColor: kMainColor,
      ),
      body: Padding(
        padding: const EdgeInsets.all(kHorizontalPadding),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextInput(
                controller: _nameController,
                hintText: 'Fruits',
                labelText: 'Nom du produit',
                textCapitalization: TextCapitalization.words,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Veuillez entrer le nom du produit';
                  }
                  return null;
                },
              ),
              const SizedBox(height: kSpaceBetween),
              TextInput(
                isTextArea: 4,
                controller: _descriptionController,
                labelText: 'Description du produit',
                hintText: 'Ex: Description du produit',
                textCapitalization: TextCapitalization.words,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Veuillez entrer la description de votre produit';
                  }
                  return null;
                },
              ),
              const SizedBox(height: kSpaceBetween),
              TextInput(
                controller: _priceController,
                labelText: 'Prix du produit (€)',
                hintText: 'Ex: 3€',
                textCapitalization: TextCapitalization.words,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Veuillez entrer un prix';
                  }
                  return null;
                },
              ),
              const SizedBox(height: kSpaceBetween),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('Choisir la catégorie', style: kLabelStyle),
                  Container(
                    decoration: const BoxDecoration(
                      color: kWhiteColor,
                      borderRadius: BorderRadius.all(
                        Radius.circular(kBorderRadius),
                      ),
                    ),
                    child: DropdownButton<CategoryInfo>(
                      value: dropdownValue,
                      isExpanded: true,
                      style: kDropDownMenu,
                      onChanged: (CategoryInfo? value) {
                        setState(() {
                          dropdownValue = value!;
                        });
                      },
                      items: dropdownItems,
                    ),
                  ),
                ],
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

                    final name = _nameController.text;
                    final description = _descriptionController.text;
                    final price = _priceController.text;
                    String? groupSelected = dropdownValue?.id;

                    groupSelected == '' ? 'Non répertorié' : dropdownValue?.id;
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
