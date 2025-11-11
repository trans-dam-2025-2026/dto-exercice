import 'package:dto_exercice/screens/forms/add_category_screen.dart';
import 'package:dto_exercice/screens/forms/add_product_screen.dart';
import 'package:dto_exercice/screens/login_screen.dart';
import 'package:dto_exercice/styles/colors.dart';
import 'package:dto_exercice/styles/font.dart';
import 'package:dto_exercice/styles/spacings.dart';
import 'package:dto_exercice/widgets/category_slider.dart';
import 'package:dto_exercice/widgets/product_slider.dart';
import 'package:dto_exercice/widgets/title_container.dart';
import 'package:dto_exercice/widgets/w_button.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  static final String routeName = '/home';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kMainColor,
        title: Text('MyFruitz', style: kAppbarText),
        iconTheme: const IconThemeData(color: kWhiteColor),
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            ListTile(
              title: GestureDetector(
                child: Text('Se déconnecter'),
                onTap: () async {
                  try {
                    await FirebaseAuth.instance.signOut().then(
                      (value) => {
                        Navigator.pushNamed(context, LoginScreen.routeName),
                      },
                    );
                  } catch (e) {
                    print("Erreur lors de la déconnexion : $e");
                  }
                },
              ),
            ),
          ],
        ),
      ),
      body: Center(
        child: SizedBox(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                TitleContainer(title: 'Mes actions'),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(
                          left: kHorizontalPadding,
                          right: kHorizontalPadding,
                          bottom: kVerticalPadding,
                        ),
                        child: WButton(
                          ontap: () {
                            Navigator.pushNamed(
                              context,
                              AddProductScreen.routeName,
                            );
                          },
                          title: "Ajouter un produit",
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                          left: kHorizontalPadding,
                          right: kHorizontalPadding,
                          bottom: kVerticalPadding,
                        ),
                        child: WButton(
                          ontap: () {
                            Navigator.pushNamed(
                              context,
                              AddCategoryScreen.routeName,
                            );
                          },
                          title: "Ajouter une catégorie",
                        ),
                      ),
                    ],
                  ),
                ),
                TitleContainer(title: 'Mes catégories'),
                CategorySlider(),
                TitleContainer(title: 'Mes produits (sans catégorie)'),
                ProductSlider(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
