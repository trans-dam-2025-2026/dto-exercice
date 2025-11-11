import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dto/dto.dart';
import 'package:dto_exercice/styles/colors.dart';
import 'package:dto_exercice/styles/size.dart';
import 'package:dto_exercice/styles/spacings.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ProductItem extends StatefulWidget {
  const ProductItem({
    super.key,
    required this.productId,
    required this.categoryId
  });

  final String productId;
  final String categoryId;

  @override
  State<ProductItem> createState() => _ProductItemState();
}

class _ProductItemState extends State<ProductItem> {
  @override
  Widget build(BuildContext context) {
    return SnackBar(content: Text(''));
  }
}
