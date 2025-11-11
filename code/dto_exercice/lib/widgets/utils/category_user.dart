import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dto/dto.dart';
import 'package:dto/models/category.dart';
import 'package:firebase_auth/firebase_auth.dart';

class CategoryInfo {
  final String id;
  final String title;

  CategoryInfo(this.id, this.title);
}

class CategoryUser {
  static Future<List<CategoryInfo>> getCategoriesForCurrentUser() async {
    final db = FirestoreODM(appSchema, firestore: FirebaseFirestore.instance);

    User? user = FirebaseAuth.instance.currentUser;
    List<Category> categoriesQuery = await db.users(user!.uid).categories.get();

    List<CategoryInfo> categories = [];

    for (Category cat in categoriesQuery) {
      String id = cat.id;
      String title = cat.title;
      categories.add(CategoryInfo(id, title));
    }

    return categories;
  }
}