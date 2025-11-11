import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dto/dto.dart';
import 'package:dto_exercice/styles/others.dart';
import 'package:dto_exercice/styles/size.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:dto_exercice/styles/colors.dart';
import 'package:dto_exercice/styles/font.dart';
import 'package:dto_exercice/styles/spacings.dart';

class SingleProductScreen extends StatefulWidget {
  const SingleProductScreen({super.key});

  static final String routeName = '/single-product';

  @override
  State<SingleProductScreen> createState() => _SingleProductScreenState();
}

class _SingleProductScreenState extends State<SingleProductScreen> {
  String? selectedCategoryId;

  @override
  Widget build(BuildContext context) {
    final String productId = ModalRoute.of(context)!.settings.arguments as String;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: kMainColor,
        iconTheme: const IconThemeData(color: kWhiteColor),
        title: Text('Produit', style: kAppbarText),
      ),
      body: SnackBar(content: Text('')),
    );
  }
}
