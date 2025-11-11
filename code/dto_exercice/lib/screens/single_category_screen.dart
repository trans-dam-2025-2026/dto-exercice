import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dto/dto.dart';
import 'package:dto_exercice/styles/others.dart';
import 'package:dto_exercice/styles/size.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:dto_exercice/styles/colors.dart';
import 'package:dto_exercice/styles/font.dart';
import 'package:dto_exercice/styles/spacings.dart';
import 'package:dto_exercice/widgets/product_slider.dart'; // pour afficher les produits

class SingleCategoryScreen extends StatefulWidget {
  const SingleCategoryScreen({super.key});

  static final String routeName = '/single-category';

  @override
  State<SingleCategoryScreen> createState() => _SingleCategoryScreenState();
}

class _SingleCategoryScreenState extends State<SingleCategoryScreen> {
  @override
  Widget build(BuildContext context) {
    final String categoryId = ModalRoute.of(context)!.settings.arguments as String;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: kMainColor,
        iconTheme: const IconThemeData(color: kWhiteColor),
        title: Text('Catégorie', style: kAppbarText),
      ),
      body: SnackBar(content: Text('')),
    );
  }
}
